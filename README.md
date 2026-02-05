# JavaFX Login Application

A simple JavaFX application with login, registration, and welcome screens.

## Requirements

- Java 21 or higher
- Maven

## Build Instructions

The application has been successfully built and is ready to run!!!

To rebuild the application:

```bash
mvn clean package -s settings.xml
```

## How to Run

### Option 1: Using the run script (Recommended)
```bash
./run.sh
```

### Option 2: Using Maven directly
```bash
mvn javafx:run -s settings.xml
```

### Option 3: Full clean build and run
```bash
mvn clean javafx:run -s settings.xml
```

## Login Credentials

- **Username:** admin
- **Password:** admin

## Features

- **Login Screen**: Secure login with username and password validation
- **Registration Screen**: User registration with email validation and password confirmation
- **Welcome Screen**: Personalized welcome page after successful login
- Logout functionality to return to login screen

## Project Structure

```
javafx-app/
├── pom.xml                 # Maven configuration
├── settings.xml            # Custom Maven settings for dependencies
├── run.sh                  # Convenient run script
└── src/main/java/com/example/javafx/
    ├── MainApp.java           # Main application entry point
    ├── LoginScreen.java       # Login interface
    ├── RegistrationScreen.java # Registration interface
    └── WelcomeScreen.java     # Welcome screen after login
```

## Notes

- The custom `settings.xml` file ensures dependencies are downloaded from Maven Central
- The build creates a JAR file in the `target/` directory
- Use the JavaFX Maven plugin to run the application with proper module configuration
