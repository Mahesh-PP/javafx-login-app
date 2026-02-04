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

public class LoginScreen {

    private MainApp mainApp;

    public LoginScreen(MainApp mainApp) {
        this.mainApp = mainApp;
    }

    public void show(Stage primaryStage) {
        GridPane grid = new GridPane();
        grid.setAlignment(Pos.CENTER);
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(25, 25, 25, 25));

        // Title
        Text scenetitle = new Text("Welcome");
        scenetitle.setFont(Font.font("Tahoma", FontWeight.BOLD, 20));
        grid.add(scenetitle, 0, 0, 2, 1);

        // Username
        Label userName = new Label("Username:");
        grid.add(userName, 0, 1);

        TextField userTextField = new TextField();
        userTextField.setPromptText("Enter username");
        grid.add(userTextField, 1, 1);

        // Password
        Label pw = new Label("Password:");
        grid.add(pw, 0, 2);

        PasswordField pwBox = new PasswordField();
        pwBox.setPromptText("Enter password");
        grid.add(pwBox, 1, 2);

        // Message label
        Label messageLabel = new Label();
        messageLabel.setTextFill(Color.RED);
        grid.add(messageLabel, 0, 4, 2, 1);

        // Buttons
        Button loginBtn = new Button("Login");
        Button registerBtn = new Button("Register");

        HBox hbBtn = new HBox(10);
        hbBtn.setAlignment(Pos.BOTTOM_RIGHT);
        hbBtn.getChildren().addAll(registerBtn, loginBtn);
        grid.add(hbBtn, 1, 3);

        // Login button action
        loginBtn.setOnAction(e -> {
            String username = userTextField.getText();
            String password = pwBox.getText();

            if (username.isEmpty() || password.isEmpty()) {
                messageLabel.setText("Please enter both username and password!");
                return;
            }

            // Check credentials (admin/admin)
            if (username.equals("admin") && password.equals("admin")) {
                messageLabel.setTextFill(Color.GREEN);
                messageLabel.setText("Login successful!");
                // Navigate to welcome screen
                mainApp.showWelcomeScreen(username);
            } else {
                messageLabel.setTextFill(Color.RED);
                messageLabel.setText("Invalid username or password!");
                pwBox.clear();
            }
        });

        // Register button action
        registerBtn.setOnAction(e -> {
            mainApp.showRegistrationScreen();
        });

        // Allow Enter key to trigger login
        pwBox.setOnAction(e -> loginBtn.fire());

        Scene scene = new Scene(grid, 400, 300);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}

