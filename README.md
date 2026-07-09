# aaradhyadtmr.github.io

Personal portfolio website for **Aaradhya Dev Tamrakar** — BEI IV/I student at Kathmandu Engineering College (KEC), Institute of Engineering (IOE), Tribhuvan University.

_Last updated May 30, 2026._

## About

This site showcases my work as an Electronics, Communication and Information Engineering student, IEEE KEC KTM Vice Chair, Fuse AI Fellow (Fusemachines 2026), NSSR DataCamp Fellow (Cohort 2), and robotics enthusiast. It features a modern, luxury editorial design with glassmorphism effects, custom CSS animations, and interactive elements.

## Features

- **Responsive design** optimised for all devices
- **Custom cursor animation** (pointer: fine only — keyboard/touch safe)
- **Glassmorphism & depth effects** — modern aesthetic with backdrop blur and layered shadows
- **Smooth scrolling navigation** with active-section highlighting
- **Light / dark theme toggle** with smooth transitions and consistent animated accent borders in both themes
- **Back-to-top button** (appears after scrolling 400 px)
- **Profile photo** with grayscale-to-colour hover effect (`loading="lazy"`)
- **Proficiency dot scale** (●●● / ●●○ / ●○○) replacing arbitrary skill bars
- **Comprehensive portfolio sections** — projects, apps, experience, skills, achievements, contact
- **Contact form** with EmailJS (primary + auto-reply) → Formspree (fallback) → mailto (last resort)
- **Full ARIA landmark compliance** — `<main>`, `aria-labelledby` on all sections, `role="navigation"` on mobile drawer, `role="contentinfo"` on footer, skip link to `#main-content`, dynamic hamburger `aria-expanded`
- **`prefers-reduced-motion` guard** on all animations
- **Google Analytics 4** (G-P38642CDGB) — pageview tracking, scroll depth, outbound clicks, CV download events, contact form conversion events
- **Font render-blocking eliminated** — `media=print` onload swap + `rel=preload`; `@font-face` `size-adjust` fallbacks to reduce FOUT/CLS
- **Projects grid** with progress tracking (For in-progress projects)
- **Apps showcase** — Live applications and tools
- **Achievements section** — Training, certifications, and recognitions

## Lighthouse Scores **(May 2026)**

| Score | Performance | Accessibility | Best Practices | SEO |
| --- | --- | --- | --- | --- |
| **Desktop** | 98 | 100 | 100 | 100 |
| **Mobile** | 78 | 100 | 100 | 100 |

Mobile FCP 3.0 s / LCP 4.3 s on slow-4G simulation. EmailJS (65 KiB) is an irreducible third-party cost. HubSpot Website Grader: **90 / 100**.

## Portfolio Sections

1. **Hero** — Introduction with status card displaying current roles, focus, and tech stack
2. **Projects** — Featured engineering projects (6 showcase items) with GitHub links and progress tracking
3. **Apps** — Live applications and tools (Alpha Super-App showcase)
4. **Experience** — Professional roles, fellowships, and organizational positions
5. **Skills** — Technical expertise organized by category (Languages, Hardware, Mobile, AI/Deployment) with proficiency ratings
6. **Achievements** — Training programs, certifications, and recognitions
7. **About** — Personal biography with stats (year, firmware versions, languages, etc.)
8. **Contact** — Contact form with EmailJS integration + social links

## Technologies Used

- **HTML5** — Semantic structure with ARIA landmarks
- **CSS3** — Custom properties, Flexbox, Grid, Glassmorphism effects, backdrop blur
- **JavaScript (Vanilla)** — DATA-driven architecture (content separated from render logic) with dynamic rendering
- **Google Fonts** — Cormorant Garamond (serif) · DM Mono (monospace) · Instrument Sans (sans-serif)
- **EmailJS** — Contact form with auto-reply
- **Formspree** — Contact form fallback
- **Google Analytics 4** (GA4) — Visitor tracking, CV download events, contact form conversion events
- **Canvas API** — Background animation layers (if applicable)

## `index.html` Build & Architecture

This portfolio is a single-file static build located in `index.html`. It does not require a bundler, transpiler, or build step.

- **Single entry file**: all markup, styles, data, and behavior live in `index.html`.
- **Data-driven rendering**: site content is defined in one `DATA` object, then injected into the DOM via `renderHero()`, `renderNav()`, `renderProjects()`, `renderApps()`, `renderExperience()`, `renderSkills()`, `renderAchievements()`, `renderAbout()`, `renderContact()`, and `renderFooter()`.
- **Pure Vanilla JS**: uses template strings, `document.createElement`, `innerHTML`, `querySelectorAll`, and DOM event listeners.
- **Smooth anchor scrolling**: internal links (`href="#..."`) use a custom scroll handler that accounts for the fixed top navigation bar and prevents incorrect landing positions.
- **Contact form fallback chain**: the submit handler tries EmailJS first, then Formspree, then `mailto:` as a last-resort fallback.
- **Mailto behavior**: the email contact item is rendered as a direct `mailto:` link without `target="_blank"`, avoiding blank-tab behavior in browsers that handle mail links internally.
- **Accessibility-first**: includes skip links, `aria-label`, `aria-expanded` management, landmark roles, keyboard section jumps, and `prefers-reduced-motion` support.
- **Performance optimisations**: fonts are loaded non-blocking, inline SVG favicon is used, and third-party scripts are limited to EmailJS and GA4.

## Profile Photo & CV

**Profile photo:** Place the profile image in `assets/images/` (recommended: ~400×500 px minimum). The config already references `profilePhoto: "assets/images/photo.png"` — just push the file.

**CV download:** Place `AARADHYA_DEV_TAMRAKAR_CV.pdf` in `assets/docs/`. The hero **Download CV** button is already linked — no code changes needed.

## Content Editing Guide

All portfolio content is managed in a single `DATA` object in `index.html` around line 1234. Edit only this section to update:

- **Profile Info:** `name`, `tagline`, `headline`, `description`
- **Status Card:** `status` array (current focus, roles, tech stack)
- **Projects:** `projects` array with title, description, tags, GitHub links, and progress tracking
- **Apps:** `apps` array for live applications showcase
- **Experience:** `experience` array with org, title, description, year
- **Skills:** `skillGroups` array with categories and proficiency levels (1–3)
- **Achievements:** `achievements` array with training, certifications, dates
- **About:** `aboutParagraphs` (bio text) and `aboutStats` (metrics)
- **Contact:** `contactTagline`, `contactNote`, `contactLinks`
- **Footer:** `footerCopy`, `footerSocials`

The contact form configuration and EmailJS/Formspree fallback settings are defined later in `index.html` near the bottom of the file.

**No JSX, no build step, no framework needed** — all rendering is vanilla JavaScript with simple template strings.

## Local Development

```bash
git clone https://github.com/AaradhyaDTmr/AaradhyaDTmr.github.io.git
cd AaradhyaDTmr.github.io
# Open index.html in your browser
```

## Deployment

Deployed automatically via GitHub Pages. Changes pushed to `main` go live at **[https://aaradhyadtmr.github.io](https://aaradhyadtmr.github.io)**.

## Contact

| Channel | Detail |
| --------- | -------- |
| Email | [aaradhyadevtmr@gmail.com](mailto:aaradhyadevtmr@gmail.com) |
| LinkedIn | [aaradhya-dev-tamrakar](https://www.linkedin.com/in/aaradhya-dev-tamrakar) |
| GitHub | [AaradhyaDT](https://github.com/AaradhyaDT) |
| Instagram | [@aaradhya_dev_tamrakar](https://instagram.com/aaradhya_dev_tamrakar) |
| X / Twitter | [@AaradhyaDT](https://x.com/AaradhyaDT) |

## License

This project is licensed under an **All Rights Reserved** proprietary license.

**All code, design, and content are the exclusive property of Aaradhya Dev Tamrakar.**

No part of this website may be copied, modified, distributed, or used without **explicit written permission**.

To request permission to use or adapt any part of this portfolio, please contact: **<aaradhyadevtmr@gmail.com>**

See the [LICENSE](LICENSE) file for full details.
