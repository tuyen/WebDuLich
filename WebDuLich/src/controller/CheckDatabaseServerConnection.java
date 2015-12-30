package controller;

import model.ModelConnection;

public class CheckDatabaseServerConnection {

	private ModelConnection con = new ModelConnection();
	
	public CheckDatabaseServerConnection()
	{
		
	}
	
	public boolean isConnected()
	{
		if(con.connect())
		{
			con.close();
			return true;
		}
		return false;
	}
	
}
