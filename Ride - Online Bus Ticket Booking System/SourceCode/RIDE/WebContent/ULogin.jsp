<!--
		File : Header.html
		Purpose : Displaying header section
-->

<html>
<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<SCRIPT>
function validate(){
			//alert("a1="+name);
	var lgnid=document.LOGIN.Name.value;
	//alert("a="+lgnid);
var pwd=document.LOGIN.Pwd.value;

 if(lgnid=="")
				{
		alert("Enter  Login ID");
		return false;
				}
			else if(pwd=="")
				{
		alert("Enter  Password");
		return false;
		}



}
</SCRIPT>

</HEAD>
<Body class="SC">
<IMG SRC="Images/eWheelzLogo.jpg" WIDTH="321" HEIGHT="90" BORDER="0" ALT="">
</body>
<HTML>
<%

if(request.getParameter("msg")!=null){

out.println("<script>alert('Registered Successfully')</script>");
}
if(request.getParameter("msg1")!=null){

out.println("<script>alert('InCorrect Login ID or Password')</script>");
}
%>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<head>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<BODY onload="document.LOGIN.Name.focus();" CLASS="SC">
<HR>
<center><a href="Login.jsp"><B><FONT size="5" COLOR="#CC00CC" face='verdana'><h3>SRTC Employees </FONT></B></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="ULogin.jsp"><B><FONT  size="5"COLOR="#CC00CC" face='verdana'>Travelers </FONT></B></a>&nbsp;
</center><HR>
<BR><BR>
<BR><BR>
<center><FORM NAME='LOGIN' ACTION="UValidate.jsp"  onsubmit="return validate()">

<TABLE align='center' width="60%" cellspacing=0 cellpadding=0>
<TR>
	<TD><FONT SIZE="3" COLOR="#CC0099"><B>User Login:</B></FONT>&nbsp;&nbsp;<FONT size="-2" COLOR="#CC0099" face='verdana'></TD>
	
</TR>

</TABLE>

<br><br>
<TABLE align='center' width="60%" >
<TR>
	
	<TD><FONT size="2" COLOR="#CC0099" face='verdana'>Login ID</FONT>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="text" NAME="Name"  required></TD></tr>
	<tr><TD><FONT size="2" COLOR="#CC0099" face='verdana'>Password</FONT>&nbsp;&nbsp;&nbsp;&nbsp;
	<INPUT TYPE="password" NAME="Pwd" required></TD>

</TR>
<TR>
	
<TD>&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;<INPUT TYPE="submit" value="Login"></TD>
</TR>
</TABLE>
<TABLE align='center' width="60%" ><tr><tr><tr><tr>
<TR>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<TD>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Signup.jsp">New User?</td>

</TR>
<TR>
</FORM>


</BODY>
</HTML></center>
