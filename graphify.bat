@echo off
setlocal enabledelayedexpansion
pushd "%~dp0" || exit /b 1
title Graphify Universal Offline Visualizer
cls

echo =======================================================
echo   INITIALIZING UNIVERSAL OFFLINE GRAPHIFY PIPELINE
echo =======================================================

echo Target Directory : %cd%
echo -------------------------------------------------------

echo.
echo [1/3] Flushing stale cache blocks...
if exist "graphify-out\cache\" (
    rmdir /s /q "graphify-out\cache"
    echo Cache cleared successfully.
) else (
    echo No cache found. Proceeding...
)

echo.
echo [2/3] Running Fast Local AST Re-Extraction (No LLM)...
:: Using native update syntax to guarantee 0% cloud api connectivity
call graphify.exe update . --force

echo.
echo [3/3] Generating D3 Interactive Collapsible Architecture Tree...
:: Builds the interactive offline webpage 
call graphify.exe tree --graph graphify-out\graph.json --output graphify-out\GRAPH_TREE.html

echo.
echo -------------------------------------------------------
echo   Launching Visualization Screen Offline...
echo -------------------------------------------------------
if exist "graphify-out\GRAPH_TREE.html" (
    start "" "graphify-out\GRAPH_TREE.html"
) else (
    echo [ERROR] GRAPH_TREE.html generation failed. Check code files.
)

echo.
echo =======================================================
echo   PIPELINE COMPLETE. YOU CAN CLOSE THIS WINDOW.
echo =======================================================
popd
pause
