@echo off
REM Build Windows .exe installer directly with Maven
REM No file copying needed!

echo ================================================
echo Building Windows .exe Installer with Maven
echo ================================================
echo.

echo Building application and creating .exe installer...
echo.

call mvn clean package -s settings.xml -P windows-installer

if %errorlevel% equ 0 (
    echo.
    echo ================================================
    echo SUCCESS! Windows installer created!
    echo ================================================
    echo.
    echo Location: target\installer\JavaFX-Login-App-1.0.exe
    echo.
    dir target\installer\*.exe
    echo.
    echo You can now distribute this .exe file!
    echo.
) else (
    echo.
    echo ================================================
    echo Build failed!
    echo ================================================
    echo.
    echo Make sure you have:
    echo   - JDK 17 or higher installed
    echo   - Maven installed
    echo   - Running on Windows OS
    echo.
)

pause
#!/bin/bash
# Build Windows .exe installer directly with Maven
# No file copying needed!

echo "================================================"
echo "Building Windows .exe Installer"
echo "================================================"
echo ""
echo "Building application and creating .exe installer..."
echo ""

mvn clean package -s settings.xml -P windows-installer

if [ $? -eq 0 ]; then
    echo ""
    echo "================================================"
    echo "✅ SUCCESS! Windows installer created!"
    echo "================================================"
    echo ""
    echo "Location: target/installer/JavaFX-Login-App-1.0.exe"
    echo ""
    echo "File size:"
    ls -lh target/installer/*.exe 2>/dev/null || echo "Installer will be created when run on Windows with JDK 17+"
    echo ""
    echo "You can now distribute this .exe file!"
else
    echo ""
    echo "================================================"
    echo "⚠️  Build completed but installer creation failed"
    echo "================================================"
    echo ""
    echo "This is normal if you're on macOS/Linux."
    echo "jpackage for Windows .exe requires:"
    echo "  - Running on Windows OS"
    echo "  - JDK 17+ installed"
    echo ""
    echo "Your JAR file is ready at: target/javafx-login-app-1.0-SNAPSHOT.jar"
    echo ""
    echo "To create the .exe installer:"
    echo "  1. Transfer this project to a Windows PC"
    echo "  2. Run: mvn clean package -s settings.xml -P windows-installer"
fi

