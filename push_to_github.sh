#!/bin/bash
# 🚀 Simple Push Script for Standalone Dashboard Deployment

if [ -z "$1" ]; then
    echo "⚠️ กรุณาระบุ GitHub Repository URL เช่น:"
    echo "   ./push_to_github.sh https://github.com/<your-username>/<repo-name>.git"
    exit 1
fi

REPO_URL=$1
echo "🌐 Connecting to GitHub Remote: $REPO_URL..."

git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"
git branch -M main
git add .
git commit -m "Update T-OOS V3.3 Reader Dashboard [$(date +"%Y-%m-%d %H:%M:%S")]" 2>/dev/null || true

echo "🚀 Pushing Dashboard to GitHub Pages..."
git push -u origin main --force

echo "✨ เสร็จสมบูรณ์! กรุณาไปที่ GitHub Settings -> Pages เพื่อเปิดใช้งาน GitHub Pages"
