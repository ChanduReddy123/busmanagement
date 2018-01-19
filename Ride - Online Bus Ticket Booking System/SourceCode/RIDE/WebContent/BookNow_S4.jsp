<HTML>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,Mail.*" %>
<%@ page session="true" %>
<%
	String rFrom = (String)session.getAttribute("rFrom");
	String rTo = (String)session.getAttribute("rTo");
	String JDate = (String)session.getAttribute("JDate");
	String sBusType = (String)session.getAttribute("BusType");
	String NoPass = (String)session.getAttribute("NoPass");
	int iNoPass=0;
	if(NoPass!=null){
		iNoPass= Integer.parseInt(NoPass);
	}
	String RouteId = (String)session.getAttribute("RouteId");
	String TravelsId = (String)session.getAttribute("TravelsId");
	String Travels = (String)session.getAttribute("Travels");
	String BusId = (String)session.getAttribute("BusId");
	String Fare =	(String)session.getAttribute("Fare");
	String Departure =	(String)session.getAttribute("Departure");
	String Arrival =	(String)session.getAttribute("Arrival");
	String SelSeats =  (String)session.getAttribute("SelSeats");		
	String BPoint = (String)session.getAttribute("BPoint");
	String CustomerId = (String)session.getAttribute("unm");
	String TicketId =(String)session.getAttribute("TicketId");
	String PaymentId = (String)session.getAttribute("PaymentId");
	String msg="Ticket ID : "+TicketId+"\n"+"Departure : "+Departure+"\n"+"Arrival : "+Arrival+"\n"+"Seats : "+SelSeats+"\n"+"Pickup Point: "+BPoint;
%>
<head>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>
<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

<SCRIPT LANGUAGE="JavaScript">
<!--
var SCount = 0;

	function setAction(URL,Obj){
		var f = document.forms(0);
		var ParamsList = "?";
		Obj.target='ResultFrame';
		Obj.href=URL+ParamsList;
	}
	function fnSavePaymentDetails(Params)
	{
		var divObj = document.getElementById("infodiv");
		URL = "CreateTicket.jsp"+Params;
		//alert(URL);
		ajaxFunction(URL,divObj);
	}
//-->
</SCRIPT>


<head>
<body Class='SC'>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Confirmation</FONT></B>
<HR>
<BR><BR>
<FORM>
<%
/*Declaration of variables*/
Connection con=null;
Statement stmt=null,stmt1=null,stmt2=null,stmt3=null;
ResultSet rs=null,rs1=null,rs2=null;
int count=0,NumRows=0;
boolean tflag=false;
try
{
	/*Connection to MySQL database is made with JDBC class one driver*/
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement();
		stmt3 =  con.createStatement();
ResultSet rst=stmt3.executeQuery("select email from signup where unm='"+session.getAttribute("unm")+"'");

if(rst.next()){

String email=rst.getString(1);
boolean sts=mail.mailsend(msg,email,"raghu.adavalli","AirForce-2");
if(sts){

out.println("<script>alert('Confirmation Message Sent to Mail')</script>");

}

}


	String Query = "update ticketdetails set CustomerId='"+CustomerId+"', PaymentId='"+PaymentId+"', Status='Booked' where TicketId='"+TicketId+"'";
	System.out.println("Final Qry->"+Query);
	int result = stmt.executeUpdate(Query);
	if( result > 0)	{
		System.out.println("Ticket saved");
		tflag=true;
		String Query1 = "update routemaster set availability = availability - "+iNoPass+" where RouteId='"+RouteId+"' and BusId='"+BusId+"'";
		System.out.println("Final Qry->"+Query1);
		int result1 = stmt.executeUpdate(Query1);
		if( result1 > 0)	{
			System.out.println("routemaster updated");
			tflag=true;
		}
		else{
			System.out.println("routemaster not updated");
			tflag=false;
		}
	}
	else{
		System.out.println("Ticket not saved");
		tflag=false;
	}
	
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
if(tflag==true){
%>
	<H5>Information</H5>
	<TABLE align=center width="50%">
	<TR class='row_title'>
		<TD colspan=2 align=center>Travel details</TD>
	</TR>
	<TR class='row_odd'>
		<TD>From</TD>
		<TD><%=rFrom%></TD>
	</TR>
	<TR class='row_odd'>
		<TD>To</TD>
		<TD><%=rTo%></TD>
	</TR>
	<TR class='row_odd'>
		<TD>Journey Date</TD>
		<TD><%=JDate%></TD>
	</TR>
	<TR class='row_odd'>
		<TD>Travels Name</TD>
		<TD><%=Travels%></TD>
	</TR>
	<TR class='row_odd'>
		<TD>Start Time</TD>
		<TD><%=Departure%></TD>
	</TR>
	<TR class='row_odd'>
		<TD>Reach Time</TD>
		<TD><%=Arrival%></TD>
	</TR>
	<TR class='row_odd'>
		<TD>No. of Passengers</TD>
		<TD><%=NoPass%></TD>
	</TR>
	<TR class='row_odd'>
		<TD>Seats</TD>
		<TD><%=SelSeats%></TD>
	</TR>
	<TR class='row_odd'>
		<TD>Boarding Point</TD>
		<TD><%=BPoint%></TD>
	</TR>
	<TR class='row_odd'>
		<TD>Net Ammount</TD>
		<TD>Rs. <%=Fare%></TD>
	</TR>
	</TABLE>
	<P align=center>
		<A onclick="fnEmpPopUp('PrintTicket.jsp?TicketId=<%=TicketId%>&Travels=<%=Travels%>',400,400)" target="ResultFrame"><IMG SRC="Images/Menu/PrintTicket1.jpg" border="0"
		onmouseout="this.src = 'Images/Menu/PrintTicket1.jpg'" 
		onmouseover="this.src = 'Images/Menu/PrintTicket2.jpg'"></A>
	</P>


<%
	}
%>
</FORM>
</BODY>
</HTML>
