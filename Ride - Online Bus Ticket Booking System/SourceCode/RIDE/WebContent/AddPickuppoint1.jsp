<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Add PickUp Points</FONT></B>
<HR>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String RouteId = request.getParameter("RouteId");
	String PickupPoint = request.getParameter("PickupPoint");
	int Fare =0;
	try{
			
			con = com.ewheelz.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into routemap values('"+RouteId+"','"+PickupPoint+"',"+Fare+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><B><Font face="Georgia" color="Green">Pickup point added Successfully</Font></B></P>
			<center>
			<A href="" onclick="window.close()"> Close </A>
			</center>
				<%
			}
			else{
				%><P align=center><B><Font face="Georgia" color="Red">Error: Please try again</Font></B></P><% 
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


