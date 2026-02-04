package com.example.javafx;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class WelcomeScreen {

    private MainApp mainApp;
    private String username;

    public WelcomeScreen(MainApp mainApp, String username) {
        this.mainApp = mainApp;
        this.username = username;
    }

    public void show(Stage primaryStage) {
        VBox vbox = new VBox();
        vbox.setAlignment(Pos.CENTER);
        vbox.setSpacing(20);
        vbox.setPadding(new Insets(25, 25, 25, 25));

        // Welcome title
        Text welcomeTitle = new Text("Welcome to the Application!");
        welcomeTitle.setFont(Font.font("Tahoma", FontWeight.BOLD, 24));

        // User greeting
        Label userLabel = new Label("Hello, " + username + "!");
        userLabel.setFont(Font.font("Tahoma", FontWeight.NORMAL, 18));

        // Success message
        Label messageLabel = new Label("You have successfully logged in.");
        messageLabel.setFont(Font.font("Tahoma", FontWeight.NORMAL, 14));

        // Logout button
        Button logoutBtn = new Button("Logout");
        logoutBtn.setPrefWidth(100);
        logoutBtn.setOnAction(e -> {
            mainApp.showLoginScreen();
        });

        vbox.getChildren().addAll(welcomeTitle, userLabel, messageLabel, logoutBtn);

        Scene scene = new Scene(vbox, 400, 300);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}

