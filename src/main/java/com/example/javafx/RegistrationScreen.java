package com.example.javafx;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class RegistrationScreen {

    private MainApp mainApp;

    public RegistrationScreen(MainApp mainApp) {
        this.mainApp = mainApp;
    }

    public void show(Stage primaryStage) {
        GridPane grid = new GridPane();
        grid.setAlignment(Pos.CENTER);
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(25, 25, 25, 25));

        // Title
        Text scenetitle = new Text("User Registration");
        scenetitle.setFont(Font.font("Tahoma", FontWeight.BOLD, 20));
        grid.add(scenetitle, 0, 0, 2, 1);

        // Full Name
        Label fullNameLabel = new Label("Full Name:");
        grid.add(fullNameLabel, 0, 1);

        TextField fullNameField = new TextField();
        fullNameField.setPromptText("Enter your full name");
        grid.add(fullNameField, 1, 1);

        // Email
        Label emailLabel = new Label("Email:");
        grid.add(emailLabel, 0, 2);

        TextField emailField = new TextField();
        emailField.setPromptText("Enter your email");
        grid.add(emailField, 1, 2);

        // Username
        Label userNameLabel = new Label("Username:");
        grid.add(userNameLabel, 0, 3);

        TextField userTextField = new TextField();
        userTextField.setPromptText("Choose a username");
        grid.add(userTextField, 1, 3);

        // Password
        Label pwLabel = new Label("Password:");
        grid.add(pwLabel, 0, 4);

        PasswordField pwBox = new PasswordField();
        pwBox.setPromptText("Choose a password");
        grid.add(pwBox, 1, 4);

        // Confirm Password
        Label confirmPwLabel = new Label("Confirm Password:");
        grid.add(confirmPwLabel, 0, 5);

        PasswordField confirmPwBox = new PasswordField();
        confirmPwBox.setPromptText("Re-enter password");
        grid.add(confirmPwBox, 1, 5);

        // Message label
        Label messageLabel = new Label();
        messageLabel.setTextFill(Color.RED);
        grid.add(messageLabel, 0, 7, 2, 1);

        // Buttons
        Button registerBtn = new Button("Register");
        Button backBtn = new Button("Back to Login");

        HBox hbBtn = new HBox(10);
        hbBtn.setAlignment(Pos.BOTTOM_RIGHT);
        hbBtn.getChildren().addAll(backBtn, registerBtn);
        grid.add(hbBtn, 1, 6);

        // Register button action
        registerBtn.setOnAction(e -> {
            String fullName = fullNameField.getText();
            String email = emailField.getText();
            String username = userTextField.getText();
            String password = pwBox.getText();
            String confirmPassword = confirmPwBox.getText();

            // Validation
            if (fullName.isEmpty() || email.isEmpty() || username.isEmpty() ||
                password.isEmpty() || confirmPassword.isEmpty()) {
                messageLabel.setTextFill(Color.RED);
                messageLabel.setText("Please fill in all fields!");
                return;
            }

            if (!password.equals(confirmPassword)) {
                messageLabel.setTextFill(Color.RED);
                messageLabel.setText("Passwords do not match!");
                confirmPwBox.clear();
                return;
            }

            if (password.length() < 6) {
                messageLabel.setTextFill(Color.RED);
                messageLabel.setText("Password must be at least 6 characters!");
                return;
            }

            if (!email.contains("@")) {
                messageLabel.setTextFill(Color.RED);
                messageLabel.setText("Please enter a valid email address!");
                return;
            }

            // Registration successful
            messageLabel.setTextFill(Color.GREEN);
            messageLabel.setText("Registration successful! Redirecting to login...");

            // Simulate saving user (in real app, you'd save to database)
            System.out.println("New user registered:");
            System.out.println("Name: " + fullName);
            System.out.println("Email: " + email);
            System.out.println("Username: " + username);

            // Go back to login after 2 seconds
            new Thread(() -> {
                try {
                    Thread.sleep(2000);
                    javafx.application.Platform.runLater(() -> mainApp.showLoginScreen());
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
            }).start();
        });

        // Back button action
        backBtn.setOnAction(e -> {
            mainApp.showLoginScreen();
        });

        Scene scene = new Scene(grid, 450, 400);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}

