package com.example.javafx;

import javafx.application.Application;
import javafx.stage.Stage;

public class MainApp extends Application {

    private Stage primaryStage;

    @Override
    public void start(Stage primaryStage) {
        this.primaryStage = primaryStage;
        this.primaryStage.setTitle("JavaFX Login Application");

        // Show login screen first
        showLoginScreen();
    }

    public void showLoginScreen() {
        LoginScreen loginScreen = new LoginScreen(this);
        loginScreen.show(primaryStage);
    }

    public void showRegistrationScreen() {
        RegistrationScreen registrationScreen = new RegistrationScreen(this);
        registrationScreen.show(primaryStage);
    }

    public void showWelcomeScreen(String username) {
        WelcomeScreen welcomeScreen = new WelcomeScreen(this, username);
        welcomeScreen.show(primaryStage);
    }

    public static void main(String[] args) {
        launch(args);
    }
}

