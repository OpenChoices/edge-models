# Quick Start: Make Model Downloadable

## Current Status
✅ Model file exists locally (529MB)  
✅ Repository exists on GitHub  
❌ File is stored as Git LFS pointer (not downloadable)  
❌ GitHub release doesn't exist yet  

## Quick Fix (Choose One)

### Method 1: GitHub Web UI (Easiest - 5 minutes)

1. **Open:** https://github.com/OpenChoices/edge-models/releases/new

2. **Fill in:**
   - Tag: `v1.0.0`
   - Title: `Models v1.0`
   - Description: `Gemma 3 1B INT4 model (529MB)`

3. **Upload file:**
   - Drag & drop: `/Users/bharatbhushan/IdeaProjects/bharatnpti/edge-models/gemma3-1b-it-int4.task`
   - Or click "selecting them" and browse to the file

4. **Click:** "Publish release"

5. **Done!** ✅

The download URL will be:
```
https://github.com/OpenChoices/edge-models/releases/download/v1.0.0/gemma3-1b-it-int4.task
```

### Method 2: GitHub CLI (Automated)

```bash
# 1. Authenticate (one time)
gh auth login

# 2. Create release
cd /Users/bharatbhushan/IdeaProjects/bharatnpti/edge-models
./create_github_release.sh
```

## Verify It Works

After creating the release, test:

```bash
curl -I https://github.com/OpenChoices/edge-models/releases/download/v1.0.0/gemma3-1b-it-int4.task
```

Should return `HTTP/2 302` or `HTTP/2 200` (not 404).

## Why This Works

- **Git LFS:** Stores pointer files in the repo (small)
- **GitHub Releases:** Bypass LFS and serve actual files
- **Result:** Direct download of 529MB model file ✅

## After Release is Created

The app is already configured to use:
- Models list: `https://raw.githubusercontent.com/OpenChoices/edge-models/main/models.json`
- Model download: `https://github.com/OpenChoices/edge-models/releases/download/v1.0.0/gemma3-1b-it-int4.task`

Just rebuild the app and it will work!

