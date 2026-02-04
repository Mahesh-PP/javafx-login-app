# Creating Windows .exe Installer for JavaFX Login Application

## ✅ What Has Been Done

Your JavaFX application has been successfully built and packaged! The distribution files are ready in:
- `target/windows-distribution/`

## 📦 Package Contents

The Windows distribution package includes:
- `javafx-login-app-1.0-SNAPSHOT.jar` - Main application JAR
- `libs/` - All JavaFX dependencies
- `run-windows.bat` - Quick launcher script
- `build-windows-installer.bat` - Script to create .exe installer

## 🪟 Creating Windows .exe Installer - Two Methods

### Method 1: Using jpackage (Recommended - Creates Native Windows Installer)

**Requirements:**
- Windows PC with JDK 17 or higher installed
- The jpackage tool comes bundled with JDK 17+

**Steps:**

1. **Transfer files to Windows:**
   - Copy the entire `javafx-app` folder to a Windows PC
   - Or just copy the `target/windows-distribution` folder

2. **On Windows, open Command Prompt and navigate to the project folder:**
   ```cmd
   cd path\to\javafx-app
   ```

3. **Run the installer creation script:**
   ```cmd
   build-windows-installer.bat
   ```

4. **The script will:**
   - Check if Java and Maven are installed
   - Build the application (if needed)
   - Use jpackage to create a native Windows installer (.exe)
   - Create the installer in `target\installer\JavaFX-Login-App-1.0.exe`

5. **Distribute the installer:**
   - Share `JavaFX-Login-App-1.0.exe` with Windows users
   - Double-click to install the application
   - Creates Start Menu shortcuts automatically
   - Includes uninstaller

### Method 2: Portable Package (Works Now - No Additional Tools Needed)

**For immediate use on Windows:**

1. **Transfer the `target/windows-distribution` folder to Windows**

2. **To run the application:**
   - Double-click `run-windows.bat`
   - Or from Command Prompt: `java -cp "javafx-login-app-1.0-SNAPSHOT.jar;libs\*" com.example.javafx.MainApp`

3. **To create a portable package:**
   - Zip the entire `windows-distribution` folder
   - Users can unzip and run `run-windows.bat` - no installation needed
   - Requires Java 17+ installed on the target Windows machine

## 🔧 Using jpackage Manually (Advanced)

If you want to customize the installer, use this command on Windows:

```cmd
jpackage ^
    --type exe ^
    --name "JavaFX-Login-App" ^
    --app-version 1.0 ^
    --vendor "Example Inc" ^
    --description "JavaFX Login Application" ^
    --dest target\installer ^
    --input target\windows-distribution ^
    --main-jar javafx-login-app-1.0-SNAPSHOT.jar ^
    --main-class com.example.javafx.MainApp ^
    --java-options "--module-path libs" ^
    --java-options "--add-modules javafx.controls,javafx.fxml" ^
    --win-dir-chooser ^
    --win-menu ^
    --win-shortcut
```

**Customization Options:**
- `--icon path\to\icon.ico` - Add custom application icon
- `--win-console` - Show console window for debugging
- `--vendor "Your Company"` - Change vendor name
- `--app-version 1.0` - Update version number

## 📁 File Locations

After building:
- **Portable package:** `target/windows-distribution/`
- **Installer (after running on Windows):** `target/installer/JavaFX-Login-App-1.0.exe`

## 🚀 Quick Start for Windows Users

### If you have the installer (.exe):
1. Double-click `JavaFX-Login-App-1.0.exe`
2. Follow installation wizard
3. Launch from Start Menu

### If you have the portable package:
1. Unzip the folder
2. Double-click `run-windows.bat`
3. Application launches

**Login Credentials:**
- Username: `admin`
- Password: `admin`

## 🔄 Alternative: Using Launch4j (Create .exe launcher)

For a simpler .exe launcher (not an installer):

1. **Download Launch4j:** https://launch4j.sourceforge.net/
2. **Create wrapper configuration:**
   - Jar: `javafx-login-app-1.0-SNAPSHOT.jar`
   - Main class: `com.example.javafx.MainApp`
   - JVM options: `--module-path libs --add-modules javafx.controls,javafx.fxml`
   - Min JRE version: 17
3. **Build:** Creates a single .exe file that launches the JAR

## 📝 Notes

- **Current setup (macOS):** You've built the application successfully and created a portable package
- **To create native Windows installer:** Transfer files to Windows and run `build-windows-installer.bat`
- **System Requirements:** Users need Java 17+ installed (or you can bundle JRE with jpackage using `--runtime-image`)
- **Distribution Size:** ~50-60 MB (with JavaFX libraries)

## ✨ Features of the Generated Installer

When using jpackage, the installer provides:
- ✅ Windows native installation wizard
- ✅ Start Menu shortcuts
- ✅ Desktop shortcut option
- ✅ Add/Remove Programs entry
- ✅ Automatic uninstaller
- ✅ Custom installation directory selection
- ✅ No Java required if you bundle JRE (advanced option)

## 🆘 Troubleshooting

**"jpackage not found":**
- Install JDK 17 or higher (jpackage is included)
- Ensure JAVA_HOME points to JDK 17+

**"Java not found" when running:**
- Install Java Runtime Environment (JRE) 17+
- Or bundle JRE with jpackage using `--runtime-image` option

**Application doesn't start:**
- Check Java version: `java -version` (must be 17+)
- Run from command prompt to see error messages

## 📞 Support

For issues:
1. Check Java version compatibility (17+)
2. Verify all files in libs/ folder are present
3. Run from command prompt to see error messages

