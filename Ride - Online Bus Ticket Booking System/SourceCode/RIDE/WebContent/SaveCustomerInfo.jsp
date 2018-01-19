<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class=SC>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String CustomerId="";
	com.ewheelz.MyFunctions MF = new com.ewheelz.MyFunctions();
	CustomerId = MF.genNextID("customermaster","CustomerId","C");
	//session.setAttribute("CustomerId",CustomerId);
	String CustomerName = request.getParameter("CustomerName");	String PhoneNumber = request.getParameter("PhoneNumber");	String Address = request.getParameter("Address");	String Location = request.getParameter("Location");	String email = request.getParameter("email");	String Gender = request.getParameter("Gender");	
	try{
			
			con = com.ewheelz.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into customermaster values('"+session.getAttribute("unm")+"','"+CustomerName+"',"+PhoneNumber+",'"+Address+"','"+Location+"','"+email+"','"+Gender+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><FONT COLOR="green" face='Georgia'><I>Customer info saved successfully</I></FONT></P><%
			}
			else{
				%><P align=center>Error: Please try again</P><% 
			}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>


