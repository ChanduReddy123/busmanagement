<!--
     File : Validate.jsp

 -->

<HTML>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true" %>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<body Class="SC">

<%! String user_id; %>
<%! String pass_word; %>
<%! int flag=0;  %>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
   user_id = request.getParameter("Name");
   System.out.println("user name="+user_id);

   pass_word = request.getParameter("Pwd");

   System.out.println("user_id = "+user_id+"\t"+"pass_word = "+pass_word);
/*Checking for userid and password*/

try
{
	/*Connection to MS Acess database is made with JDBC class one driver*/
	
//	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//	con = DriverManager.getConnection("jdbc:odbc:JobPortal","root","");
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement();

	/*Retrives data from the database*/
	String sql="SELECT *from signup where unm='"+user_id+"' and pwd='"+pass_word+"' ";
	System.out.println(sql);
	rs = stmt.executeQuery(sql);
	System.out.println(rs);
	if(rs.next())
	{
		session.setAttribute("unm",user_id);
	response.sendRedirect("ewheelsHome1.jsp");
	
	}
				else{
						response.sendRedirect("ULogin.jsp?msg1=fail");
		
	}

}
catch(Exception e)
{
	System.out.println("Exception"+e);
}

	/*If username and password is validated, then the user is redirected to homepage*/
	%>



</BODY>
</HTML>
