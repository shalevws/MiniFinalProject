package gui;

import java.io.IOException;

import client.ChatClient;
import client.ReaderCardLibrariaViewUI;
import client.ReportsUI;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.stage.Stage;

public class ReportsGUI {

    @FXML
    private RadioButton borrowRep = null;
    @FXML
    private RadioButton statusRep = null;
    @FXML
    private ComboBox<String> months = null;  // Specify type String for ComboBox
    @FXML
    private TextArea Displayarea = null;
    @FXML
    private Button Viewbtt = null;

    // This method will be called when the FXML file is loaded
    public void initialize() {
        // List of months to populate in the ComboBox
        String[] monthsArray = {
            "January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
        };
        
        // Add the months to the ComboBox
        months.getItems().addAll(monthsArray);
    }
    
    public void ViewBttClick(ActionEvent event) {
        // Get the selected month from the ComboBox
        String selectedMonth = months.getValue();

        if (borrowRep.isSelected()) {
            // Send a request to create a borrow report
            ReportsUI.chat.accept("create borrow report", "", "", "");

            // Build a single string to display all borrow report entries
            StringBuilder reportBuilder = new StringBuilder();
            for (String reportEntry : ChatClient.FullBorrowRep) {
                reportBuilder.append(reportEntry).append("\n\n");
            }

            // Display the complete report in the text area
            Displayarea.setText(reportBuilder.toString());
        }
    }

    
    public void BorrowTimeRepClick(ActionEvent event) {
    	statusRep.setSelected(false);
    	
    }
    
    public void SubStatusRepClick(ActionEvent event) {
    	borrowRep.setSelected(false);
    	
    	
    }

    public void start(Stage primaryStage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("/gui/ReportsGUI.fxml"));
        Scene scene = new Scene(root);
        scene.getStylesheets().add(getClass().getResource("/gui/ReportsGUI.css").toExternalForm());
        primaryStage.setTitle("Reports GUI");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

}
