#!/bin/bash

# Portfolio deployment script for GitHub Pages
# Usage: ./deploy.sh "message" (optional commit message)

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default commit message
COMMIT_MSG="${1:-Update Portfolio deployment}"

echo -e "${YELLOW}🚀 Starting Portfolio deployment...${NC}\n"

# Step 1: Ensure we're on master branch
echo -e "${YELLOW}📌 Checking out master branch...${NC}"
git checkout master
git pull origin master

# Step 2: Build Flutter web
echo -e "${YELLOW}🔨 Building Flutter web app...${NC}"
flutter clean
flutter build web --release

if [ ! -d "build/web" ]; then
    echo -e "${RED}❌ Build failed! build/web directory not found.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Build successful!${NC}\n"

# Step 3: Save build directory to temp location
echo -e "${YELLOW}📦 Saving build files...${NC}"
BUILD_DIR=$(mktemp -d)
cp -r build/web/* "$BUILD_DIR/"

# Step 4: Prepare gh-pages
echo -e "${YELLOW}📝 Preparing gh-pages branch...${NC}"
git checkout gh-pages || git checkout --orphan gh-pages

# Step 5: Clear and copy build files
echo -e "${YELLOW}📂 Copying build files...${NC}"
git rm -rf --cached --quiet . 2>/dev/null || true
find . -mindepth 1 -not -path './.git*' -delete 2>/dev/null || true
cp -r "$BUILD_DIR"/* .
touch .nojekyll  # Prevent GitHub from processing with Jekyll
rm -rf "$BUILD_DIR"  # Clean up temp directory

# Step 6: Commit and push
echo -e "${YELLOW}📤 Committing and pushing...${NC}"
git add .
git commit -m "$COMMIT_MSG" || echo -e "${YELLOW}⚠️  No changes to commit${NC}"
git push -u origin gh-pages

# Step 7: Return to master
echo -e "${YELLOW}🔄 Switching back to master...${NC}"
git checkout master

echo -e "${GREEN}✅ Deployment complete!${NC}"
echo -e "${GREEN}🌐 Your site is live at: https://SamiK28.github.io/Portfolio${NC}\n"
