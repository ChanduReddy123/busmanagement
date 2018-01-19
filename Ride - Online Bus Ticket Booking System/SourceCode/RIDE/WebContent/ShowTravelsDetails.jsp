
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String TravelsId=request.getParameter("TravelsId");%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>List Available Travels</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal)
{
		var txt = window.opener.document.forms(0).TravelsId;
		txt.value = txtVal;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body  class="SC">

<h2 align=center>Travels Details</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<% 

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
String Travels,Location,Address,AgentName,PhoneNumber;
System.out.println("--1---");

try
{

	/*Getting the connection variable from session*/

	//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	//con = DriverManager.getConnection("jdbc:odbc:ewheelz","root","");
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from travelsmaster where TravelsId='"+TravelsId+"'";

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
							<th align="left">TravelsId</th>
							<th align="left">Travels</th>
							<th align="left">Location</th>
							<th align="left">Address</th>
							<th align="left">AgentName</th>
							<th align="left">PhoneNumber</th>
							</tr>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{TravelsId=rs.getString(1);
	Travels=rs.getString(2);
	   Location=rs.getString(3);
	   Address=rs.getString(4);
	   AgentName=rs.getString(5);
	   PhoneNumber=rs.getString(6);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=TravelsId%>')"><%=TravelsId%></a></td>
		<td><%=Travels%></td>
		<td><%=Location%></td>
		<td><%=Address%></td>
		<td><%=AgentName%></td>
		<td><%=PhoneNumber%></td>

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

