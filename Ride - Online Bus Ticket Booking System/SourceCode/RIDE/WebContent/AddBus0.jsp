<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String TravelsId=request.getParameter("TravelsId");%>

 <HTML>
    <HEAD>

    <script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

    <LINK href="styles.css" type="text/css" rel="stylesheet">
    <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
    <script LANGUAGE="Javascript" >
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function ChkAlphaNumericField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter alphabets or numbers for "+T);return false;}
		}
		function ChkAlphaField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z ]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter text for "+T);return false;}
		}
		function ChkEmailField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9\_\.]{4,25})$/;
			if(!(pattern.test(val)==true)){alert("Please enter valid email for "+T);return false;}
		}
		function ChkDateField(F,T)
		{
			var val = F.value;
		    var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		    if(!(pattern.test(val)==true)){alert("Please enter valid date format (yyyy-mm-dd) for "+T);return false;}
		}
		function validate()
		{
			var frm = document.forms(0);
			if(ChkMandatoryField(frm.BusType,'BusType')==false) return false;
			if(ChkMandatoryField(frm.BusNumber,'BusNumber')==false) return false;
			if(ChkMandatoryField(frm.Capacity,'Capacity')==false) return false;
			if(ChkNumField(frm.Capacity,'Capacity')==false) return false;
			if(ChkMandatoryField(frm.TravelsId,'TravelsId')==false) return false;
		}
	</script>
	</HEAD>
	<Body class=SC>
	<HR>
	<B><FONT COLOR="#CC00CC" face='verdana'>Add Bus</FONT></B>
	<HR>	
	<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth=-1;
	if(IAuth!=null){ auth= IAuth.intValue();}
	System.out.println("===Authentication=="+auth);
	if(auth!=0){
		%><P align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER="0" ALT=""><B><FONT COLOR="red">You are not authorized to access this page</FONT></B></P><%
	}
	else{
	%>

<FORM ACTION="AddBus1.jsp" onsubmit="return validate()">

   <center>
   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> Add Bus Details</TH>

		<tr class="row_odd">
			<td>BusType<FONT COLOR="red">*</FONT></td>
				<td><SELECT NAME="BusType" class="ListBox">
				<option value="">---</option>
				<option value="Express">Express</option>
				<option value="Deluxe">Deluxe</option>
				<option value="Luxury">Luxury</option>
				<option value="Premium">Premium</option>
			</select>
		</td>
		</tr>
		<tr class="row_even">
			<td>BusNumber<FONT COLOR="red">*</FONT></td>
				<TD><Input type=text name='BusNumber' value=''></TD>
		</TR>
		<Input type=hidden name='Capacity' value='40'>
		
		<tr class="row_odd">
			<td>TravelsId<FONT COLOR="red">*</FONT></td>
				<TD><Input type=text name='TravelsId' value='<%=TravelsId%>' readonly></TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

<%}%>