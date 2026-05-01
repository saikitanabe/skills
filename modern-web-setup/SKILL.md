---
name: modern-web-setup
description: Scaffals a production-ready React, TypeScript, Tailwind v4, and Vite project. Includes Git initialization with robust ignores and optional shadcn/ui or VSCode settings setup. Use when starting any new web project.
---

# Modern Web Setup

## Usage

Run this command in the parent directory of where you want the project:

```bash
/skill:modern-web-setup <project-name> [--shadcn] [--vscode]
```

### Options
- `<project-name>`: Name of the project folder.
- `--shadcn`: (Optional) Automatically runs the shadcn/ui initialization.
- `--vscode`: (Optional) Sets up recommended `.vscode/settings.json`.

### What is included:
1. **Vite + React + TS**: Quick scaffolding using `pnpm create vite`.
2. **Tailwind v4**: Pre-configured with `@tailwindcss/vite` and `@import "tailwindcss"`.
3. **Git Ready**: `git init` with a professional `.gitignore` (protecting your repo from `.d.ts`, `.map`, and `dist` pollution).
4. **shadcn/ui**: (Optional) Integrated setup if requested.
5. **VSCode Config**: (Optional) Pre-configured editor settings for productivity.
