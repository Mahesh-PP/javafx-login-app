@echo off
REM Build Windows .exe installer WITH BUNDLED JAVA
REM NO MAVEN INSTALLATION REQUIRED - Uses Maven Wrapper!

echo ================================================
echo Building Self-Contained Windows Installer
echo (No Maven Installation Required!)
echo ================================================
echo.

REM Check if Java is installed
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Java (JDK 17+) is not installed or not in PATH
    echo Please install JDK 17 or higher from https://adoptium.net/
    pause
    exit /b 1
)

echo Using Maven Wrapper - No Maven installation needed!
echo.
echo Step 1: Building the application...
call mvnw.cmd clean package -s settings.xml -P windows-installer-with-jre

if %errorlevel% neq 0 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo ================================================
echo SUCCESS! Self-Contained Installer Created!
echo ================================================
echo.
echo Location: target\installer\JavaFX-Login-App-1.0.exe
echo.
dir target\installer\*.exe
echo.
echo IMPORTANT: This installer includes Java Runtime!
echo Windows users can install and run WITHOUT installing Java separately.
echo.
echo Installer size: ~150-200 MB (includes JRE)
echo.
pause

