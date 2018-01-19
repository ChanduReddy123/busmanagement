<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.ewheelz.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Add Bus</FONT></B>
<HR>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String BusId = request.getParameter("BusId");
	MyFunctions MF = new MyFunctions();
	BusId = MF.genNextID("busmaster","BusId","B");
	String BusType = request.getParameter("BusType");	
	String BusNumber = request.getParameter("BusNumber");	
	String Capacity = request.getParameter("Capacity");	
	String TravelsId = request.getParameter("TravelsId");	
	try{
			int i=0;
			con = com.ewheelz.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			stmt =  con.createStatement();
			Statement stmt1=con.createStatement();
			ResultSet rst=stmt1.executeQuery("select max(bid) from busmaster");
			
			if(rst.next()){
				
				i=rst.getInt(1)+1;
				
			}
					
			BusId="T"+i;
			String Query = "Insert into busmaster values('"+BusId+"','"+BusType+"','"+BusNumber+"','"+Capacity+"','"+TravelsId+"',"+i+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><B><Font face="Georgia" color="Green">Bus added Successfully</Font></B></P><%
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
<center><input type=button value=close onclick="window.close()"></center>

</BODY>


