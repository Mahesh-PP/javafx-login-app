@echo off
REM Simple launcher for JavaFX Login Application (Windows)
echo Starting JavaFX Login Application...
java -cp "javafx-login-app-1.0-SNAPSHOT.jar;libs\*" com.example.javafx.MainApp
pause
#!/bin/bash
# Build script to create Windows .exe installer for JavaFX Login Application

echo "================================================"
echo "Building Windows Installer for JavaFX Login App"
echo "================================================"

# Step 1: Clean and package the application
echo ""
echo "Step 1: Building the application..."
mvn clean package -s settings.xml

if [ $? -ne 0 ]; then
    echo "ERROR: Build failed!"
    exit 1
fi

echo ""
echo "✓ Build successful!"
echo ""
echo "================================================"
echo "Creating distribution package..."
echo "================================================"

# Create distribution directory
DIST_DIR="target/dist"
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

# Copy JAR and dependencies
cp target/javafx-login-app-1.0-SNAPSHOT.jar "$DIST_DIR/"
cp -r target/libs "$DIST_DIR/"

echo "✓ Distribution package created in target/dist/"
echo ""
echo "================================================"
echo "Next Steps for Windows .exe Creation"
echo "================================================"
echo ""
echo "Since you're on macOS, you have two options:"
echo ""
echo "OPTION 1: Transfer to Windows machine"
echo "  1. Copy the entire 'javafx-app' folder to a Windows PC"
echo "  2. On Windows, run: build-windows-installer.bat"
echo "  3. The .exe installer will be created in target/installer/"
echo ""
echo "OPTION 2: Create a cross-platform JAR package"
echo "  - The dist folder contains a runnable JAR that works on any OS"
echo "  - Run on Windows: java -jar javafx-login-app-1.0-SNAPSHOT.jar"
echo ""
echo "Files ready in: $DIST_DIR"
ls -lh "$DIST_DIR"

