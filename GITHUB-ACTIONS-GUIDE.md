# 🚀 GITHUB ACTIONS - BUILD WINDOWS .EXE IN THE CLOUD

## 🎯 OVERVIEW - NO WINDOWS PC NEEDED!

GitHub Actions allows you to build your Windows .exe installer automatically in the cloud using GitHub's free Windows servers.

**Benefits:**
- ✅ No Windows PC required
- ✅ No Maven installation needed
- ✅ No JDK installation needed
- ✅ Automatic builds on every code push
- ✅ Download ready-to-use .exe installer
- ✅ 100% FREE for public repositories

---

## 📋 COMPLETE STEP-BY-STEP PROCEDURE

### STEP 1: Create a GitHub Account (If You Don't Have One)

1. Go to: https://github.com/
2. Click "Sign up"
3. Follow the registration process
4. Verify your email

**Time:** ~2 minutes

---

### STEP 2: Create a New Repository

1. Log in to GitHub
2. Click the **"+"** icon (top right) → **"New repository"**
3. Fill in:
   - **Repository name:** `javafx-login-app`
   - **Description:** "JavaFX Login Application with installer"
   - **Visibility:** 
     - ✅ **Public** (free GitHub Actions)
     - Or **Private** (2,000 free minutes/month)
   - **Initialize repository:** Leave unchecked
4. Click **"Create repository"**

**Time:** ~1 minute

---

### STEP 3: Prepare Your Project (Already Done!)

I've already created the GitHub Actions workflow files in your project:

```
javafx-app/
└── .github/
    └── workflows/
        ├── build-windows-installer.yml      ← Builds Windows .exe only
        └── build-all-installers.yml         ← Builds Windows + macOS
```

✅ **You're ready to go!**

---

### STEP 4: Initialize Git in Your Project

Open Terminal on your Mac and run:

```bash
cd /Users/A-9531/Documents/javafx-app

# Initialize Git repository
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit - JavaFX Login Application with GitHub Actions"
```

**Time:** ~30 seconds

---

### STEP 5: Connect to GitHub and Push

After creating the repository on GitHub, you'll see instructions. Run these commands:

```bash
cd /Users/A-9531/Documents/javafx-app

# Add GitHub repository as remote
git remote add origin https://github.com/YOUR_USERNAME/javafx-login-app.git

# Push to GitHub
git branch -M main
git push -u origin main
```

Replace `YOUR_USERNAME` with your actual GitHub username.

**Time:** ~1 minute

---

### STEP 6: Watch the Magic Happen! ✨

1. Go to your GitHub repository: `https://github.com/YOUR_USERNAME/javafx-login-app`
2. Click the **"Actions"** tab at the top
3. You'll see the workflow running:
   - **"Build Windows Installer with Bundled Java"** 
   - Status: 🟡 In Progress → ✅ Success (takes ~2-3 minutes)

**The build happens automatically on GitHub's Windows server!**

---

### STEP 7: Download Your Windows .exe Installer

Once the build completes (✅ green checkmark):

1. Click on the workflow run (e.g., "Initial commit - JavaFX...")
2. Scroll down to **"Artifacts"** section
3. Click **"JavaFX-Login-App-Windows-Installer"** to download
4. You'll get a ZIP file containing your `.exe` installer!

**Extract the ZIP and you have:** `JavaFX-Login-App-1.0.exe` (~180 MB with bundled Java)

---

## 🎁 WHAT YOU GET

The downloaded installer:
- ✅ Windows .exe installer (~150-200 MB)
- ✅ Includes Java Runtime (users don't need Java installed!)
- ✅ Professional installation wizard
- ✅ Start Menu shortcuts
- ✅ Desktop shortcut
- ✅ Uninstaller

**Ready to distribute to Windows users!**

---

## 🔄 FUTURE UPDATES - AUTOMATIC BUILDS

Every time you make changes and push to GitHub:

```bash
cd /Users/A-9531/Documents/javafx-app

# Make your changes to code
# Then:

git add .
git commit -m "Updated login screen"
git push
```

**GitHub Actions automatically:**
1. Detects the push
2. Builds the new installer on Windows server
3. Makes it available for download
4. All in ~2-3 minutes!

---

## 📊 TWO WORKFLOW OPTIONS

I've created TWO workflow files for you:

### Option 1: `build-windows-installer.yml` (Recommended)
**What it does:**
- Builds Windows .exe installer only
- Faster (~2-3 minutes)
- Smaller artifact to download

**Use when:** You only need Windows installer

---

### Option 2: `build-all-installers.yml` (Complete)
**What it does:**
- Builds Windows .exe installer
- Builds macOS .dmg installer
- Builds both in parallel

**Use when:** You want installers for both platforms

**You can keep both! They won't conflict.**

---

## 🎯 WORKFLOW TRIGGERS

The workflows run automatically when:

✅ **You push code to `main` or `master` branch**
```bash
git push
```

✅ **You manually trigger from GitHub website:**
1. Go to Actions tab
2. Select workflow
3. Click "Run workflow" button

✅ **When you create a release** (for `build-all-installers.yml`)

---

## 💡 MANUAL TRIGGER (No Code Push Needed)

You can trigger a build without pushing code:

1. Go to your repository on GitHub
2. Click **"Actions"** tab
3. Click **"Build Windows Installer with Bundled Java"** (left sidebar)
4. Click **"Run workflow"** dropdown (right side)
5. Select branch: `main`
6. Click **"Run workflow"** button

**Build starts immediately!**

---

## 📝 DETAILED WORKFLOW EXPLANATION

### What Happens Behind the Scenes:

```yaml
runs-on: windows-latest    ← Uses GitHub's Windows server
```

**Step 1: Checkout Code**
- Downloads your code to the build server

**Step 2: Set up JDK 17**
- Installs Java Development Kit automatically
- Uses Temurin distribution (free, open-source)

**Step 3: Build Installer**
- Runs: `mvn clean package -s settings.xml -P windows-installer-with-jre`
- Compiles your code
- Bundles Java Runtime
- Creates .exe installer

**Step 4: Upload Artifact**
- Stores the .exe file for download
- Keeps it for 90 days (default)

---

## 🆓 COST - IT'S FREE!

### GitHub Actions Pricing:

| Repository Type | Free Minutes/Month | Cost |
|-----------------|-------------------|------|
| **Public** | ♾️ **Unlimited** | **FREE** |
| **Private** | 2,000 minutes | FREE |
| **Private** (over 2,000) | Per-minute charge | Paid |

**Your build takes ~2-3 minutes**

**If public repo:** Unlimited free builds! 🎉

**If private repo:** 
- 2,000 minutes = ~600 builds/month
- More than enough for development!

---

## ✅ ADVANTAGES OF GITHUB ACTIONS

| Feature | Benefit |
|---------|---------|
| **No Windows PC** | Build from your Mac |
| **No installations** | JDK/Maven handled automatically |
| **Automatic builds** | Push code → Get installer |
| **Version history** | Download any previous build |
| **Free hosting** | Artifacts stored for 90 days |
| **Multiple platforms** | Build Windows + macOS simultaneously |
| **CI/CD ready** | Professional development workflow |

---

## 📥 DOWNLOADING YOUR INSTALLER

### From Actions Tab:

1. **Go to Actions** tab in your repository
2. **Click** the workflow run (green checkmark)
3. **Scroll down** to "Artifacts" section
4. **Click** the artifact name to download
5. **Extract** the ZIP file
6. **Share** the .exe with users!

### Artifact Details:

- **Name:** `JavaFX-Login-App-Windows-Installer`
- **Size:** ~150-200 MB (compressed in ZIP)
- **Contains:** `JavaFX-Login-App-1.0.exe`
- **Retention:** 90 days (can be configured)

---

## 🔧 CUSTOMIZATION OPTIONS

### Change Build Trigger:

Edit `.github/workflows/build-windows-installer.yml`:

```yaml
on:
  push:
    branches: [ main ]        # Only on main branch
  pull_request:               # Also on pull requests
    branches: [ main ]
  schedule:                   # Run on schedule
    - cron: '0 0 * * 0'      # Every Sunday at midnight
  workflow_dispatch:          # Manual trigger
```

### Change Artifact Retention:

```yaml
- name: Upload Windows Installer
  uses: actions/upload-artifact@v4
  with:
    name: JavaFX-Login-App-Windows-Installer
    path: target/installer/*.exe
    retention-days: 30        # Keep for 30 days instead of 90
```

### Add Release Upload:

When you create a GitHub release, automatically attach the installer:

```yaml
- name: Upload to Release
  if: github.event_name == 'release'
  uses: actions/upload-release-asset@v1
  with:
    upload_url: ${{ github.event.release.upload_url }}
    asset_path: target/installer/*.exe
    asset_name: JavaFX-Login-App-1.0.exe
    asset_content_type: application/octet-stream
```

---

## 🎓 COMPLETE FIRST-TIME SETUP

Here's everything in one place:

```bash
# On your Mac Terminal:

# 1. Go to your project
cd /Users/A-9531/Documents/javafx-app

# 2. Initialize Git
git init

# 3. Add all files (including .github/workflows/)
git add .

# 4. Commit
git commit -m "Initial commit with GitHub Actions workflow"

# 5. Add GitHub remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/javafx-login-app.git

# 6. Push to GitHub
git branch -M main
git push -u origin main
```

**That's it! The build starts automatically.**

---

## 📊 BUILD STATUS BADGES (Optional)

Add a build status badge to your README:

```markdown
![Build Windows Installer](https://github.com/YOUR_USERNAME/javafx-login-app/actions/workflows/build-windows-installer.yml/badge.svg)
```

Shows: ![Build Passing](https://img.shields.io/badge/build-passing-brightgreen)

---

## 🆘 TROUBLESHOOTING

### "Build failed" in Actions

**Check the logs:**
1. Click on the failed workflow
2. Click on the failed job
3. Expand the failed step
4. Read error messages

**Common issues:**
- Missing `settings.xml` file → Make sure it's committed
- Wrong branch name → Check if you're using `main` or `master`
- Maven dependency issues → Usually auto-resolved on retry

### "No artifacts found"

**Solution:**
- Build might have failed before creating installer
- Check the build logs for errors

### Can't push to GitHub

**Authentication error:**
```bash
# Use personal access token instead of password
# Generate token at: https://github.com/settings/tokens
```

Or use SSH:
```bash
git remote set-url origin git@github.com:YOUR_USERNAME/javafx-login-app.git
```

---

## 🎉 SUCCESS CHECKLIST

After pushing to GitHub, verify:

- [ ] Repository visible on GitHub
- [ ] `.github/workflows/` folder visible in repository
- [ ] Actions tab shows workflow runs
- [ ] Workflow status is ✅ green (Success)
- [ ] Artifacts section shows installer
- [ ] Downloaded .exe file (~180 MB)
- [ ] Installer works on Windows

---

## 📱 MOBILE ACCESS

You can trigger builds from your phone!

1. Install GitHub mobile app (iOS/Android)
2. Navigate to your repository
3. Go to Actions
4. Tap workflow → Run workflow

**Build from anywhere!**

---

## 🚀 NEXT STEPS

### After First Successful Build:

1. **Test the installer** on Windows
2. **Share with users** - distribute the .exe
3. **Make updates** - push changes, get new builds automatically
4. **Create releases** - tag versions for distribution

### Create a Release:

```bash
git tag -a v1.0 -m "Version 1.0 - Initial Release"
git push origin v1.0
```

Then on GitHub:
1. Go to "Releases"
2. Click "Draft a new release"
3. Select your tag (v1.0)
4. Attach the installer manually or use workflow

---

## ✅ SUMMARY

**What you have now:**
- ✅ GitHub Actions workflow files created
- ✅ Automatic Windows .exe builder configured
- ✅ Builds on GitHub's Windows servers (free!)
- ✅ No Windows PC needed
- ✅ No installations needed

**What you need to do:**
1. Create GitHub repository (2 minutes)
2. Push your code (1 minute)
3. Download the built .exe (free!)

**Total time:** ~5 minutes to set up, then automatic forever!

---

## 🎯 QUICK COMMANDS REFERENCE

```bash
# First time setup
cd /Users/A-9531/Documents/javafx-app
git init
git add .
git commit -m "Initial commit with GitHub Actions"
git remote add origin https://github.com/YOUR_USERNAME/javafx-login-app.git
git push -u origin main

# Future updates
git add .
git commit -m "Your update message"
git push
```

**Every push triggers automatic build!**

---

**You're all set! Just push to GitHub and let the cloud build your Windows installer!** 🎉

