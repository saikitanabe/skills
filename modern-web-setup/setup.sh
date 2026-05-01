#!/bin/bash
# setup.sh

PROJECT_NAME=$1
USE_SHADCN=false
USE_VSCODE=false

# Simple argument parsing
for arg in "$@"; do
  case $arg in
    --shadcn)
      USE_SHADCN=true
      shift
      ;;
    --vscode)
      USE_VSCODE=true
      shift
      ;;
  esac
done

if [ -z "$PROJECT_NAME" ]; then
  echo "Error: Project name is required."
  echo "Usage: /skill:modern-web-setup <project-name> [--shadcn] [--vscode]"
  exit 1
fi

echo "🚀 Scaffolding project: $PROJECT_NAME"

# 1. Scaffold with Vite
# Note: we use --template react-ts. 
# We use pnpm to ensure consistent package manager usage.
pnpm create vite@latest "$PROJECT_NAME" --template react-ts

cd "$PROJECT_NAME" || exit

# 2. Install Tailwind v4 dependencies
echo "📦 Installing Tailwind CSS v4 and Vite plugin..."
pnpm add tailwindcss @tailwindcss/vite

# 3. Configure Vite (Add tailwind plugin and disable CSS minification for compatibility)
echo "⚙️ Configuring vite.config.js..."
# We'll just overwrite it with a clean version because we know what we want
cat <<EOF > vite.config.js
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [react(), tailwindcss()],
  build: {
    cssMinify: false
  }
  })
EOF

# 4. Configure CSS
echo "🎨 Configuring src/index.css..."
echo '@import "tailwindcss";' > src/index.css

# 5. Initialize Git and copy .gitignore
echo "📂 Initializing Git..."
git init
cp "../.agents/skills/modern-web-setup/templates/.gitignore.tmpl" .gitignore

# 6. Optional: VSCode Settings
if [ "$USE_VSCODE" = true ]; then
  echo "🛠️ Setting up VSCode settings..."
  mkdir -p .vscode
  cp "../.agents/skills/modern-web-setup/templates/vscode/settings.json.tmpl" .vscode/settings.json
fi

# 7. Optional: shadcn/ui
if [ "$USE_SHADCN" = true ]; then
  echo "🍱 Initializing shadcn/ui..."
  # Using pnpm dlx for shadcn init
  pnpm dlx shadcn@latest init -d
fi

echo "✅ Project $PROJECT_NAME is successfully initialized!"
echo "👉 Navigate to project: cd $PROJECT_NAME"
