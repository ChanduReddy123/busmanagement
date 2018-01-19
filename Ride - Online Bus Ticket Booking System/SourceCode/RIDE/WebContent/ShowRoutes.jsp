
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String RouteId=request.getParameter("RouteId");%>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>List Available Routes</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal)
{
		var txt = window.opener.document.forms(0).RouteId;
		txt.value = txtVal;
		
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body  class="SC">

<h2 align=center>Route Details</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<% 

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
String rFrom,rTo,TravelsId,BusId,Departure,Arrival,Fare,JDate,Availability;
System.out.println("--1---");

try
{

	/*Getting the connection variable from session*/

			con = com.ewheelz.ConnectionPool.getConnection();
			stmt =  con.createStatement();

	String Query = "Select * from routemaster where RouteId='"+RouteId+"'";

	System.out.println("--1--"+Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>


<%
if(rs!=null)
{
//System.out.println("Resultset is not null");

%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->

	<table class=notebook align=center>
	<tr class=row_title>
							<th align="left">RouteId</th>
							<th align="left">From</th>
							<th align="left">To</th>
							<th align="left">TravelsId</th>
							<th align="left">BusId</th>
							<th align="left">Departure</th>
							<th align="left">Arrival</th>
							<th align="left">Fare</th>
							<th align="left">Date</th>
							<th align="left">Availability</th>
							</tr>
	

<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{rFrom=rs.getString(2);
	rTo=rs.getString(3);
	   TravelsId=rs.getString(4);
	   BusId=rs.getString(5);
	   Departure=rs.getString(6);
	   Arrival=rs.getString(7);
	   Fare=rs.getString(8);
	   JDate=rs.getString(9);
	   Availability=rs.getString(10);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=RouteId%>')"><%=RouteId%></a></td>
		<td><%=rFrom%></td>
		<td><%=rTo%></td>
		<td><%=TravelsId%></td>
		<td><%=BusId%></td>
		<td><%=Departure%></td>
		<td><%=Arrival%></td>
		<td><%=Fare%></td>
		<td><%=JDate%></td>
		<td><%=Availability%></td>

	<%
	}


	rs.close();
	
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=6>No Records found</th></tr>

		</CENTER>
	<%

}

}
%>
</table>
</form>
</BODY>
</HTML>

