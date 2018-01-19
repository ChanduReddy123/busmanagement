
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Delete Route</FONT></B>
<HR>
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String Value = request.getParameter("TravelsId");
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
	
			
			String Query = "Delete from travelsmaster where TravelsId='"+Value+"'";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				String Query1  = "Delete from busmaster where TravelsId='"+Value+"'";
				int res = stmt.executeUpdate(Query1);
				if(res > 0){
					%><P align=center><FONT COLOR="green"><B>Travels details deleted sucessfully</B></FONT></P><%
				}
			}
			else{
				%><P align=center><FONT COLOR="red"><B>Error in deletion..please try again</B></FONT></P>
				<center>
				<A href="DelTravel0.jsp"> Delete Travel </A>
				</center>
				<% 
			}
		}catch(Exception e){%><%=e%><%}
%>
</BODY>


