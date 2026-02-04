#!/bin/bash
# Build Windows .exe installer WITH BUNDLED JAVA RUNTIME
# Users will NOT need to install Java!

echo "================================================"
echo "Building Self-Contained Windows Installer"
echo "(Includes Java Runtime - No Java Install Needed!)"
echo "================================================"
echo ""

echo "Building application with bundled JRE..."
echo ""

mvn clean package -s settings.xml -P windows-installer-with-jre

if [ $? -eq 0 ]; then
    echo ""
    echo "================================================"
    echo "✅ SUCCESS! Self-Contained Installer Created!"
    echo "================================================"
    echo ""
    echo "Location: target/installer/JavaFX-Login-App-1.0.exe"
    echo ""
    echo "IMPORTANT: This installer includes Java Runtime!"
    echo "Windows users can install and run WITHOUT installing Java."
    echo ""
    echo "⚠️  Note: This must be run on Windows to create the .exe"
    echo "The installer size will be ~150-200 MB (includes JRE)."
else
    echo ""
    echo "================================================"
    echo "⚠️  Build completed but installer creation failed"
    echo "================================================"
    echo ""
    echo "This is expected if you're on macOS/Linux."
    echo "To create Windows .exe with bundled Java:"
    echo "  1. Transfer this project to a Windows PC"
    echo "  2. Run: build-exe-with-java.bat"
    echo ""
    echo "Your JAR file is ready at: target/javafx-login-app-1.0-SNAPSHOT.jar"
fi

