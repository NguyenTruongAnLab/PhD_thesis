# GitHub Actions and GitHub Pages Setup Guide

This guide will help you set up GitHub Actions for automatic thesis building and deployment to GitHub Pages.

## 1. Push to GitHub

First, push your thesis repository to GitHub:

```powershell
# Navigate to your thesis directory (if not already there)
cd c:\Users\nguytruo\Documents\oxforddown

# If not already a git repository, initialize it
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit with GitHub Actions setup"

# Add your remote GitHub repository
# Replace with your actual GitHub username and repository name
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git

# Push to GitHub
git push -u origin main  # or 'master' depending on your default branch name
```

## 2. Configure GitHub Pages

1. Go to your GitHub repository in a web browser
2. Click on "Settings" (tab in the top navigation)
3. In the left sidebar, click on "Pages"
4. Under "Build and deployment" section, change the "Source" to "GitHub Actions"

## 3. Trigger the workflow

You don't need to do anything special to trigger the workflow. It will run automatically whenever you push to your main/master branch.

The workflow will:
- Build both PDF and HTML versions of your thesis
- Deploy them to GitHub Pages
- Make your thesis available at `https://YOUR-USERNAME.github.io/YOUR-REPOSITORY/`
- The PDF will be available at `https://YOUR-USERNAME.github.io/YOUR-REPOSITORY/_main.pdf`

## 4. Check workflow status

To check if the workflow is running:
1. Go to your GitHub repository
2. Click on the "Actions" tab
3. You'll see the "Build and Deploy Thesis" workflow running or completed

Once the workflow completes successfully, your thesis will be available on GitHub Pages.
