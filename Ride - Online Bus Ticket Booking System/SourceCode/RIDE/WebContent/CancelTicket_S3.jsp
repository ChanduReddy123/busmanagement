<HTML>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,Mail.*" %>

<%@ page session="true" %>
<% 
	String TicketId = request.getParameter("TicketId");
	String RouteId = request.getParameter("RouteId");
	String BusId = request.getParameter("BusId");
	String PaymentId = request.getParameter("PaymentId");
	String CustomerId = request.getParameter("CustomerId");
	String NoPass = request.getParameter("NoPass");

	String msg="Ticket ID : "+TicketId+"\n"+"Customer Id: "+CustomerId;

%>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">

</SCRIPT>
<head>
<body Class='SC'>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Cancel Ticket</FONT></B>
<HR>
<BR><BR>

<FORM ACTION="">
<%
/*Declaration of variables*/
Connection con=null;
Statement stmt=null,stmt3=null;
ResultSet rs=null;
boolean success=false;
int[] res = new int[4];
int sum=0;
try
{
	/*Connection to MySQL database is made with JDBC class one driver*/
	
	con = com.ewheelz.ConnectionPool.getConnection();
	con.setAutoCommit(false);
	stmt =  con.createStatement();
	stmt3 =  con.createStatement();
	ResultSet rst=stmt3.executeQuery("select email from signup where unm='"+session.getAttribute("unm")+"'");

if(rst.next()){

String email=rst.getString(1);
boolean sts=mail.mailsend1(msg,email,"raghu.adavalli","AirForce-2");
if(sts){

out.println("<script>alert('Confirmation Message Sent to Mail')</script>");

}

}

	
	//String SQry = "Select RouteId,CustomerId,PaymentId,BusId from ticketdetails Where TicketId='"+TicketId+"' and Status='Booked'";
	String DelCustQry ="delete from customermaster where CustomerId = '"+CustomerId+"'";
	String DelPaymentQry = "delete from paymentdetails where TicketId = '"+TicketId+"'";
	String UpdRouteQry = "update routemaster set Availability = Availability + "+NoPass+" where RouteId='"+RouteId+"' and BusId='"+BusId+"'";
	String DelTicketQry = "delete from ticketdetails where TicketId ='"+TicketId+"'";
	// Adding set of queries to batch
	stmt.addBatch(DelCustQry);
	stmt.addBatch(DelPaymentQry);
	stmt.addBatch(UpdRouteQry);
	stmt.addBatch(DelTicketQry);
	// Executing the batch
	res = stmt.executeBatch();
	for(int i=0;i<res.length;i++){
		sum+=res[i];
	}
	System.out.println("-->"+sum);
	if(sum<4){
		con.rollback();
		success=false;
	}else{
		con.commit();
		success=true;
	}
	System.out.println("-->"+success);
	if(success==true){%>
		<!-- Deleted -->
		<B><FONT COLOR="Green" Face='Georgia'>Your ticket has been successfully cancelled.</FONT></B> 
	<%}else{%>
		<!-- Error -->
		<B><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER="0" ALT=""><FONT COLOR="Red" Face='Georgia'>Error:Please try again.</FONT></B> 
	<%}
}
catch(Exception e)
{ e.printStackTrace();
	//System.out.println("Exception"+e);
}
%>


</FORM>
</BODY>
</HTML>