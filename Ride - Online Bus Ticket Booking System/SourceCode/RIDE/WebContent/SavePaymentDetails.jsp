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
	String PaymentId="";
	com.ewheelz.MyFunctions MF = new com.ewheelz.MyFunctions();
	PaymentId = MF.genNextID("paymentdetails","PaymentId","P");
	session.setAttribute("PaymentId",PaymentId);
	String CustomerId = request.getParameter("CustomerId");	
	String PaymentMode = request.getParameter("PaymentMode");	
	String BankName = request.getParameter("BankName");	
	String CardNo = request.getParameter("CardNo");	
	String NetAmount = request.getParameter("NetAmount");	
	String TicketId = request.getParameter("TicketId");	
	try{
			con = com.ewheelz.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into paymentdetails values('"+PaymentId+"','"+CustomerId+"','"+PaymentMode+"','"+BankName+"',"+CardNo+","+NetAmount+",'Made','"+TicketId+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><FONT COLOR="green" face='Georgia'><I>Payment details saved successfully</I></FONT></P><%
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


