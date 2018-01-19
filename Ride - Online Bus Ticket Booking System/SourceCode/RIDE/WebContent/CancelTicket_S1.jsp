<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">	
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

    <TITLE> Cancel Ticket</TITLE>
	
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		var TicketId = document.SubForm.TicketId.value;
		if(TicketId==""){
			alert("TicketId is mandatory");
			document.SubForm.TicketId.focus();
			return false;
		}
		return true;
	}

	//-->
	</SCRIPT>
  </HEAD>

  <body Class=SC>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Cancel Ticket</FONT></B>
<HR>
<BR><BR>

  <FORM NAME="SubForm" onSubmit="return check()" action="CancelTicket_S2.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> Cancel Tickets </TH>
	   </TR>
	   <tr class="row_even">
	   <TD>Enter Your Ticket Id *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="TicketId" SIZE="10" ></TD>
	   </TR>
	 
	   </TD>
	   <TR class="row_odd" ALIGN="CENTER">
			<TD align=right colspan=2><INPUT TYPE="SUBMIT" VALUE="Cancel Ticket" ></TD>
	   </TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   </HTML>
 