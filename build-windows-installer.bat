@echo off
REM Windows batch script to create .exe installer for JavaFX Login Application

echo ================================================
echo Building Windows Installer for JavaFX Login App
echo ================================================
echo.

REM Check if Java is installed
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Java is not installed or not in PATH
    echo Please install JDK 17 or higher
    pause
    exit /b 1
)

REM Check if Maven is installed
mvn -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Maven is not installed or not in PATH
    echo Please install Apache Maven
    pause
    exit /b 1
)

echo Step 1: Building the application...
call mvn clean package -s settings.xml

if %errorlevel% neq 0 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo Build successful!
echo.

REM Check if jpackage is available (Java 14+)
jpackage --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo WARNING: jpackage not found!
    echo jpackage is included in JDK 16+
    echo.
    echo Creating portable package instead...
    goto CREATE_PORTABLE
)

echo Step 2: Creating Windows installer with jpackage...
echo.

REM Create installer directory
if not exist "target\installer" mkdir "target\installer"

REM Run jpackage to create Windows installer
jpackage ^
    --type exe ^
    --name "JavaFX-Login-App" ^
    --app-version 1.0 ^
    --vendor "Example Inc" ^
    --description "JavaFX Login Application" ^
    --icon src\main\resources\icon.ico ^
    --dest target\installer ^
    --input target ^
    --main-jar javafx-login-app-1.0-SNAPSHOT.jar ^
    --main-class com.example.javafx.MainApp ^
    --java-options "--module-path target\libs" ^
    --java-options "--add-modules javafx.controls,javafx.fxml" ^
    --win-dir-chooser ^
    --win-menu ^
    --win-shortcut

if %errorlevel% neq 0 (
    echo ERROR: jpackage failed!
    goto CREATE_PORTABLE
)

echo.
echo ================================================
echo SUCCESS! Windows installer created!
echo ================================================
echo.
echo Location: target\installer\JavaFX-Login-App-1.0.exe
echo.
echo You can now distribute this .exe file to install the application on any Windows machine.
echo.
goto END

:CREATE_PORTABLE
echo Creating portable package...
if not exist "target\portable" mkdir "target\portable"
copy target\javafx-login-app-1.0-SNAPSHOT.jar target\portable\
xcopy /E /I target\libs target\portable\libs

echo @echo off > target\portable\run.bat
echo java -cp "javafx-login-app-1.0-SNAPSHOT.jar;libs\*" com.example.javafx.MainApp >> target\portable\run.bat

echo.
echo ================================================
echo Portable package created!
echo ================================================
echo.
echo Location: target\portable\
echo To run: Double-click run.bat
echo.

:END
pause

