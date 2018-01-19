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
Statement stmt=null,stmt1=null;
ResultSet rs=null;
   String name= request.getParameter("Name");
   user_id = request.getParameter("unm");
   System.out.println("user name="+user_id);
pass_word = request.getParameter("Pwd");
String email = request.getParameter("email");
String cno = request.getParameter("cno");

   System.out.println("user_id = "+user_id+"\t"+"pass_word = "+pass_word);
/*Checking for userid and password*/

try
{
	/*Connection to MS Acess database is made with JDBC class one driver*/
	
//	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//	con = DriverManager.getConnection("jdbc:odbc:JobPortal","root","");
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	stmt1 =  con.createStatement();

ResultSet rst=stmt1.executeQuery("select *from signup where email='"+email+"' or unm='"+user_id+"' ");
if(rst.next()){

response.sendRedirect("Signup.jsp?msg=Exist");

}else{
	/*Retrives data from the database*/

int i=stmt.executeUpdate("insert into signup values('"+name+"','"+user_id+"','"+pass_word+"','"+email+"','"+cno+"')");

if(i>0){

response.sendRedirect("ULogin.jsp?msg=Registered");
}

}
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}

%>


</BODY>
</HTML>
