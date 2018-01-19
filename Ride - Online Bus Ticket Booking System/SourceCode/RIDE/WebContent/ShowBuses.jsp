
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,com.ewheelz.ConnectionPool"%>
<%String TravelsId=request.getParameter("TravelsId");%>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>List Available Buses</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal)
{
		var txt = window.opener.document.forms(0).BusId;
		txt.value = txtVal;
		
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body  class="SC">

<h2 align=center>Bus Details</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<% 

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
String BusId,BusType,BusNumber,Capacity;
System.out.println("--1---");

try
{

	/*Getting the connection variable from session*/

	//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from busmaster where TravelsId='"+TravelsId+"'";

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
							<th align="left">BusId</th>
							<th align="left">BusType</th>
							<th align="left">BusNumber</th>
							<th align="left">Capacity</th>
							</tr>
	

<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{BusId=rs.getString(1);
	BusType=rs.getString(2);
	   BusNumber=rs.getString(3);
	   Capacity=rs.getString(4);
	   TravelsId=rs.getString(5);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=BusId%>')"><%=BusId%></a></td>
		<td><%=BusType%></td>
		<td><%=BusNumber%></td>
		<td><%=Capacity%></td>

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

