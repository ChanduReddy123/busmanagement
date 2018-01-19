<HTML>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%@ page session="true" %>
<% 
	String TicketId = request.getParameter("TicketId");
	String Travels = request.getParameter("Travels");	
%>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>

<SCRIPT LANGUAGE="JavaScript">
</SCRIPT>
<head>
<body Class='SC'>

<TABLE width="90%" class='notepad' align='center'>
<TR>
	<TD align=left colspan=2><IMG SRC="Images/eWheelzLogo.jpg"  BORDER="0" ALT=""></TD>
</TR>
</TABLE>
<FORM ACTION="">
<input type='Hidden' name='TicketId' value="<%=TicketId%>">
<TABLE width="90%" class='notepad' align='center' cellpadding=2 cellspacing=2>
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

try
{
	/*Connection to MySQL database is made with JDBC class one driver*/
	
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from ticketdetails Where TicketId='"+TicketId+"' and Status='Booked'";
	System.out.println(" Qry->"+Query);
	rs = stmt.executeQuery(Query);
	int count=0,NumRows=0;
	
	if(rs.next()){
					String RouteId=rs.getString(2);
					String CustomerId=rs.getString(3);
					String rFrom=rs.getString(4);
					String rTo=rs.getString(5);
					String JourneyDate=rs.getString(6);
					String StartTime=rs.getString(7);
					String ReachTime=rs.getString(8);
					String Seats=rs.getString(9);
					String BoardingPoint=rs.getString(10);
					String NetAmount=rs.getString(11);
					String Status=rs.getString(12);
					String PaymentId=rs.getString(13);
					String BusId=rs.getString(14);
		//Display header
		%>
			<TR class="row_title">
				<TD align=left colspan=6>Ticket Details</TD>
			</TR>	
			<TR class="row_odd">
				<TD align=left colspan=1><B>Ticket Id</B></TD><TD align=left  colspan=5><B><%=TicketId%></B></TD>
			</TR>
			<TR class="row_odd">
				<TD align=left colspan=1><B>Travels</B></TD><TD align=left  colspan=5><B><%=Travels%></B></TD>
			</TR>
			<TR class="row_title">
				<TD align=left colspan=6 >Journey Details</TD>
			</TR>
			<TR class="row_odd">
				<TD align=left ><B>From</B></TD><TD align=left colspan=2><%=rFrom%></TD>
				<TD align=left><B>To</B></TD><TD align=left colspan=2><%=rTo%></TD>
			</TR>

			<TR class="row_odd">
				<TD align=left colspan=3><B>Journey Date</B></TD><TD align=left  colspan=3><%=JourneyDate%></TD>
			</TR>
			<TR class="row_odd">
				<TD align=left><B>Start Time</B></TD><TD align=left colspan=2><%=StartTime%></TD>
				<TD align=left><B>Reach Time</B></TD><TD align=left colspan=2><%=ReachTime%></TD>
			</TR>

			<TR class="row_odd">
				<TD align=left><B>Seats</B></TD><TD align=left colspan=2><%=Seats%></TD>
				<TD align=left><B>Boarding Point</B></TD><TD align=left  colspan=2><%=BoardingPoint%></TD>
			</TR>
			<TR class="row_odd">
				<TD colspan=4 align=right><B><FONT COLOR="red">Fare</FONT></B></TD><TD align=left  colspan=2><FONT COLOR="red"><B>Rs. <%=NetAmount%></B></FONT></TD>
			</TR>	
</TABLE>
<P align=right>
	<A onclick="javascript:print();" style="cursor:hand"><IMG SRC="Images/printer1.jpg" BORDER="0" ALT=""></A>
</P>
<%
	}else{
		%><P align='CENTER'><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER="0" ALT=""><FONT COLOR="red" face='Georgia'>No tickets found.Please provide valid Ticket Id</FONT><BR>
			<A HREF="ViewMyTicket.jsp">&lt;&lt; Back</A>
		</P>
		
		<%
	}
	System.out.println(count+" routes found");
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>
</FORM>
</BODY>
</HTML>