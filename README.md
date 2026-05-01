# 🚀 Project Skills Library

A collection of automation skills designed to enhance the capabilities of AI agents (like `pi`). These skills provide specialized workflows, setup instructions, and helper scripts for common development tasks.

## 🛠 How to use in a new project

When starting a new project (e.g., a React app, a Python script, etc.), you can integrate these skills using one of the two following strategies:

### 1. The Global Strategy (Best for personal productivity)
If you want these skills to be available to the `pi` agent every time you open it on your machine, create a **symlink** from your personal skills folder to your global agent configuration.

**Run this in your terminal:**
```bash 
# Replace ~/path/to/your/skills with the actual path to this repo
ln -s ~/Documents/sources/skills/modern-web-setup ~/.agents/skills/modern-web-setup
```
*Benefit: One update to this repo updates all your agents instantly.*

### 2. The Project-Specific Strategy (Best for sharing/production)
If you want a specific project to "own" its skills (so others can run it without manual setup), use a **Git Submodule**. This is perfect for production-ready repositories.

**Run this inside your project directory:**
```bash
git submodule add https://github.com/saikitanabe/skills.git .agents/skills/my-skills
```
*Benefit: Anyone who clones your project will automatically have access to the exact same skills.*

---

## 📦 Available Skills

### `modern-web-setup`
**Description:** Scaffolds a production-ready React, TypeScript, Tailwind v4, and Vite project. Includes Git initialization with robust ignores and optional shadcn/ui or VSCode settings setup.

**Usage:**
```bash
/skill:modern-web-setup <project-name> [--shadcn] [--vscode]
```

---

## 📜 License
MIT
