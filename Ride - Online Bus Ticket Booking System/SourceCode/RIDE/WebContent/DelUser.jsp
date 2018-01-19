
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<BODY class=SC>
<h2 align = center>Delete a User</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String Value = request.getParameter("UserID");
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
	
			
			String Query = "Delete from Login where UserID='"+Value+"'";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Deleted from the database sucessfully</h3>
		
		<center>
			<A href="DelUser0.jsp"> Delete another </A>
		</center>
		<%
			}
			else{
				%><h3 align=center>Error in deletion..please try again</h3><% 
			}
		}catch(Exception e){%><%=e%><%}
%>
</BODY>