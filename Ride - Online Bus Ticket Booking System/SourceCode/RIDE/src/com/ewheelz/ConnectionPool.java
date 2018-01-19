package com.ewheelz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionPool extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

public ConnectionPool() {
super();
}
private static Connection con=null;
public static Connection getConnection()
{
try
{
Class.forName("com.ibm.db2.jcc.DB2Driver");
				con = DriverManager.getConnection("jdbc:db2://localhost:50000/ride","welcome","water");
	

if (con != null) {
System.out.println("Connection Pool Database Connection Success");
}
}catch(final ClassNotFoundException cfe)
{

}catch(final SQLException se)
{

}

return con;
}


}


