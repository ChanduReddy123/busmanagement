<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>


<SCRIPT>

	function validate(){
		var name=document.LOGIN.Name.value;
			//alert("a1="+name);
	var lgnid=document.LOGIN.unm.value;
	//alert("a="+lgnid);
var pwd=document.LOGIN.Pwd.value;
var email=document.LOGIN.email.value;
var cno=document.LOGIN.cno.value;
	var pattern = /^([a-zA-Z ]{1,250})$/;
	var pattern1 = /^[a-zA-Z0-9\-\.\_ ]+\@[a-zA-Z0-9 \-\.]+\.([a-zA-Z]{2,4})$/;
	var pattern2=/^([0-9]{10})$/;
		if(name==""){
		alert("Enter Name");
		return false;
				}
			else if(!(pattern.test(name)==true))
				{
				alert("Please enter text for Name");
				return false;
				}
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
				else if(pwd.length<6){
		alert("Password must be at least 6 characters long.");
		return false;
				}

else if(email=="")
				{
		alert("Enter  Email Id");
		return false;
				}

			else if(!(pattern1.test(email)==true))
				{
				alert("Please enter valid email id");
			return false;
			}

			else if(cno==""){
		alert("Enter  Phone Number");
		return false;
				}


			else if(!(pattern2.test(cno)==true)){
				alert("Please enter valid Phone Number");
				return false;
				}


	}




	
</SCRIPT>



<%

if(request.getParameter("msg")!=null){

out.println("<script>alert('Login Id or Email Already Exist')</script>");
}

%>
<head>
<Body class="SC">
<IMG SRC="Images/eWheelzLogo.jpg" WIDTH="321" HEIGHT="90" BORDER="0" ALT="">
</body>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<BODY onload="document.LOGIN.Name.focus();" CLASS="SC">
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>User SignUp</FONT></B>
<HR>
<BR><BR>
<FORM NAME='LOGIN' ACTION="Signup1.jsp" onsubmit="return validate()">

<TABLE align='left' width="60%" >
<TR>
	<TD><FONT size="-2" COLOR="#CC0099" face='verdana'>Name</FONT></TD>
	<TD><INPUT TYPE="text" NAME="Name" pattern="[A-Za-z]+" required></TD></tr>
	<tr>
	<TD><FONT size="-2" COLOR="#CC0099" face='verdana'>Login ID</FONT></TD>
	<TD><INPUT TYPE="text" NAME="unm"  required></TD></tr>
	<tr><TD><FONT size="-2" COLOR="#CC0099" face='verdana'>Password</FONT></TD>
	<TD><INPUT TYPE="password" NAME="Pwd" required></TD>

</TR>


<TR>
	<TD><FONT size="-2" COLOR="#CC0099" face='verdana'>Email</FONT></TD>
	<TD><INPUT TYPE="email" NAME="email"  required></TD></tr>
	<TD><FONT size="-2" COLOR="#CC0099" face='verdana'>Contact</FONT></TD>
	<TD><INPUT TYPE="text" NAME="cno"  pattern="[0-9]{10,10}" maxlength="10" required></TD>
	<tr><td></td>
	<TD><INPUT TYPE="submit" value="Register"></TD>
</TR>
</TABLE>

</FORM>
</BODY>
</HTML>
