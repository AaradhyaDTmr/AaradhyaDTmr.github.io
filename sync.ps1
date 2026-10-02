<#
.SYNOPSIS
    Deterministic sync for AaradhyaDTmr.github.io — pull, verify, commit, push.

.DESCRIPTION
    Standard workflow for AaradhyaDTmr.github.io:
    1. Pull remote updates with --autostash (if upstream branch exists).
    2. Run scripts/verify.py (structural integrity & zero placeholder commit SHA checks).
    3. Stage, commit (auto-message or -m), and push to remote.

.PARAMETER Message
    Custom commit message (e.g. -m "fix: update bio").
    If omitted, a message is generated from changed file names.

.PARAMETER PullOnly
    Pull remote changes with --autostash only; no commit or push.

.PARAMETER SkipVerify
    Bypass the verify.py gate (not recommended).
#>

param(
    [Alias("m")][string]$Message,
    [switch]$PullOnly,
    [switch]$SkipVerify
)

$ErrorActionPreference = "Stop"

function Write-Step($msg) { Write-Host "==> $msg" -ForegroundColor Cyan }
function Write-Err($msg)  { Write-Host "ERROR: $msg" -ForegroundColor Red }

# ── 1. Pull ─────────────────────────────────────────────────────────
$currentBranch = (git branch --show-current).Trim()
$remoteBranchExists = git ls-remote --heads origin $currentBranch 2>$null
if ($remoteBranchExists) {
    Write-Step "Pulling remote changes on $currentBranch (--autostash)..."
    git pull --autostash origin $currentBranch
    if ($LASTEXITCODE -ne 0) {
        Write-Err "git pull failed. Resolve conflicts before continuing."
        exit 1
    }
} else {
    Write-Step "Branch $currentBranch is local-only. Skipping initial pull."
}

if ($PullOnly) {
    Write-Step "PullOnly mode — done."
    exit 0
}

# ── 2. Verify ───────────────────────────────────────────────────────
if (-not $SkipVerify -and (Test-Path "scripts/verify.py")) {
    Write-Step "Running scripts/verify.py..."
    python scripts/verify.py
    if ($LASTEXITCODE -ne 0) {
        Write-Err "verify.py found errors. Fix them before committing."
        exit 1
    }
}

# ── 3. Check for Changes ───────────────────────────────────────────
$status = git status --porcelain
if (-not $status) {
    Write-Step "No changes to commit. Working tree is clean."
    exit 0
}

# ── 4. Stage & Auto-Commit Message ─────────────────────────────────
git add -A

if (-not $Message) {
    $changed = git diff --staged --name-only
    $shortList = ($changed | Select-Object -First 3) -join ", "
    if ($changed.Count -gt 3) { $shortList += " (+$($changed.Count - 3) more)" }
    $Message = "chore: update $shortList"
}

Write-Step "Committing: $Message"
git commit -m "$Message"
if ($LASTEXITCODE -ne 0) {
    Write-Err "git commit failed."
    exit 1
}

# ── 5. Push ─────────────────────────────────────────────────────────
Write-Step "Pushing to origin $currentBranch..."
git push -u origin $currentBranch
if ($LASTEXITCODE -ne 0) {
    Write-Err "git push failed."
    exit 1
}

Write-Step "Sync complete!"
