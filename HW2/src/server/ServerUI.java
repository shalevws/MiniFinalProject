package server;


import gui.ServerGUI;
import javafx.application.Application;
import javafx.stage.Stage;

public class ServerUI extends Application {
	final public static int DEFAULT_PORT = 5555;

	public static void main( String args[] ) throws Exception
	   {
		 launch(args);
	  } // end main

	@Override
	public void start(Stage primaryStage) throws Exception {
		// TODO Auto-generated method stub
		ServerGUI aFrame = new ServerGUI(); // create Frame

		aFrame.start(primaryStage);
	}

	public static EchoServer runServer(String p)
	{
		 int port = 0; //Port to listen on

	        try
	        {
	        	port = Integer.parseInt(p); //Set port to 5555

	        }
	        catch(Throwable t)
	        {
	        	System.out.println("ERROR - Could not connect!");
	        }

	        EchoServer sv = new EchoServer(port);

	        try
	        {
	          sv.listen(); //Start listening for connections
	        }
	        catch (Exception ex)
	        {
	          System.out.println("ERROR - Could not listen for clients!");
	        }
	        return sv;
	}


}
