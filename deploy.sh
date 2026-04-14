#!/bin/bash

## Configuration
SSH_HOST="u562021447@191.96.54.102"
THEME_PATH="public_html/wp-content/themes/hiking-photo-theme"
DEFAULT_MSG="Update theme"

## Use custom commit message if provided, otherwise use default
COMMIT_MSG="${1:-$DEFAULT_MSG}"

## Step 1: stage, commit, and push to GitHub
echo "Pushing to GitHub..."
git add .
git commit -m "$COMMIT_MSG"
git push

## Step 2: SSH into Hostinger and pull latest
echo "Deploying to Hostinger..."
ssh "$SSH_HOST" "cd $THEME_PATH && git pull"

echo "Done! Live site updated."