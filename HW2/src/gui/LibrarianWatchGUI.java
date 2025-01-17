package gui;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import client.ChatClient;
import client.ClientConsole;
import client.ClientUI;
import common.Subscriber1;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.DialogPane;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.scene.control.TextArea;

/**
 * Controller class for the Librarian Watch GUI.
 * Enables librarians to view and manage subscriber details and borrowing history.
 */
public class LibrarianWatchGUI {
	@FXML
	private Pane pane;

	@FXML
	private Button ViewRelevantBooks, ViewClick, ViewClick1, exitbtn, exitbtn1, ManBorrowClick, SaveChangesbtt,
			RetButton, RetButton1;

	@FXML
	private ListView<String> RelevantBooks;

	@FXML
	private Text namelabel, emaillabel, phonelabel, statuslabel, borrowhislabel, OriginalDate, NewDate;

	@FXML
	private TextField subID, subID1, name, phone_number, email, history, OldRetDate, NewRetDate, SubStatus;

	@FXML
	private TextArea Bview ;

	@FXML
	private DialogPane ChangesSavedPop;

	private ArrayList<String> borrowHistory;
	
	/**
     * Initializes the GUI by setting styles and any necessary setup logic.
     */
	public void initialize() {       
		Bview.setStyle("-fx-font-family: 'Courier New'; -fx-font-size: 12;");
    }

	/**
     * Handles the "View Details" button click to fetch and display subscriber details.
     *
     * @param event The action event triggered by the button click.
     * @throws IOException If an I/O error occurs.
     */
	public void ViewDetBtt(ActionEvent event) throws IOException {
		ClientGUIConnectionController.chat.accept("select", subID.getText(), "", "");
		Subscriber1 sub = ChatClient.s1;
		Alert alert = new Alert(Alert.AlertType.WARNING);
		if (sub.getSubscriber_id() == 0) {
			alert.setTitle("Not found");
            alert.setContentText("Oops! 😞 Subscriber not found");
            alert.showAndWait();
			name.clear();
			phone_number.clear();
			email.clear();
			SubStatus.clear();
			return;

		}
		subID.setText(String.valueOf(sub.getSubscriber_id()));
		name.setText(sub.getSubscriber_name());
		phone_number.setText(sub.getSubscriber_phone_number());
		email.setText(sub.getSubscriber_email());
		SubStatus.setText(sub.getSub_status());

		ClientGUIConnectionController.chat.accept("watch borrow history", subID.getText(), "", "");
		borrowHistory = ChatClient.borrowHistory;

		if (borrowHistory == null || borrowHistory.isEmpty()) {
			Bview.setText("No borrow history found.");
			return;
		}
        System.out.println(borrowHistory.toString());

		// Print the table header
		Bview.setText(String.format("%-35s %-20s %-20s %-20s %-20s", "Book Name", "Borrow Date", "Return Date" , "Deadline" ,"Addition Information"));
		Bview.appendText("\n-----------------------------------------------------------------------------------------------------------------------");

		// Print each row of activity history
		for (String record : borrowHistory) {
			// Split the string into components
			String[] parts = record.split(",");
			if (parts.length == 5) {
				String bookName = parts[0].trim();
				String BorrowDate = parts[1].trim();
				String ReturnDate = parts[2].trim();
				String deadline = parts[3].trim();
				String ExIssues = parts[4].trim();

				// Print the row in table format
				Bview.appendText(String.format("\n%-35s %-20s %-20s %-20s %-20s", bookName, BorrowDate, ReturnDate , deadline ,ExIssues ));
			}
		}
		
		
		
	}

	/**
     * Navigates back to the librarian's home page.
     *
     * @param event The action event triggered by the button click.
     * @throws IOException If an I/O error occurs.
     */
	public void ReturnButton(ActionEvent event) throws IOException {
		// Get the current stage from the event source
		Stage currentStage = (Stage) ((Button) event.getSource()).getScene().getWindow();

		// Load the FXML file for the new page
		Parent root = FXMLLoader.load(getClass().getResource("/gui/LibrarianGUIHomePageController.fxml"));

		// Create a new scene and apply the stylesheet
		Scene scene = new Scene(root);
		scene.getStylesheets().add(getClass().getResource("/gui/AppCss.css").toExternalForm());

		// Create a new stage for the new page
		Stage newStage = new Stage();
		newStage.setTitle("Librarian Watch and Update GUI");
		newStage.setScene(scene);

		// Hide the current stage
		currentStage.hide();

		// Show the new stage
		newStage.show();
	}

	/**
     * Opens the return book page.
     *
     * @param event The action event triggered by the button click.
     * @throws IOException If an I/O error occurs.
     */
	public void returnBookBtt(ActionEvent event) throws IOException {
		FXMLLoader loader = new FXMLLoader();

		// ((Node) event.getSource()).getScene().getWindow().hide(); // hiding primary
		// window
		Stage primaryStage = new Stage();
		Pane root = loader.load(getClass().getResource("/gui/LibrarianReturnGUI.fxml").openStream());

		Scene scene = new Scene(root);
		scene.getStylesheets().add(getClass().getResource("/gui/AppCss.css").toExternalForm());
		primaryStage.setTitle("Librarian Return GUI");

		primaryStage.setScene(scene);
		primaryStage.show();

	}
	
	/**
     * Exits the application.
     *
     * @param event The action event triggered by the button click.
     */
	public void getExitBtn(ActionEvent event) throws IOException {
		System.exit(0);
	}

}
