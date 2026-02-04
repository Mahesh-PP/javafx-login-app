#!/bin/bash
# Build macOS .dmg installer directly with Maven
# No file copying needed!

echo "================================================"
echo "Building macOS .dmg Installer"
echo "================================================"
echo ""
echo "Building application and creating .dmg installer..."
echo ""

mvn clean package -s settings.xml -P mac-installer

if [ $? -eq 0 ]; then
    echo ""
    echo "================================================"
    echo "✅ SUCCESS! macOS installer created!"
    echo "================================================"
    echo ""
    echo "Location: target/installer/JavaFX-Login-App-1.0.dmg"
    echo ""
    echo "File size:"
    ls -lh target/installer/*.dmg 2>/dev/null
    echo ""
    echo "You can now distribute this .dmg file for macOS!"
else
    echo ""
    echo "Build failed. Check the error messages above."
fi

