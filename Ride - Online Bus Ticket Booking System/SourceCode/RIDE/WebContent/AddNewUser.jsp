<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>


<HTML>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);
function validate(){
 x = document.NewUser.uid;
 y = document.NewUser.pwd;
 z = document.NewUser.auth;
 var ed=x.value;
 var pd=y.value;
 var ad=z.value;
 var pattern = /^([a-zA-Z0-9\_\. ]{4,8})$/;
 var Apattern = /^([0-3]{1})$/;
 if(!(pattern.test(ed))){
	alert("Invalid username");
    return false;
	}
 else if(!(pattern.test(pd))){
	alert("Invalid password");
    return false;
	}
 else if(!(Apattern.test(ad))){
	alert("Invalid Authentication");
	return false;
  }
 else
   return true;

}
//-->
</SCRIPT>
<body Class=Grad>

<center>

<BR><BR><br><br>
<FONT FACE="Century Gothic">



<FONT size="2" color="blue" FACE="Century Gothic">

<FORM NAME="NewUser" ACTION="AddNewUser1.jsp" METHOD="POST" onsubmit="return validate()">


<TABLE Border=0 align=center>
<TR class=row_title ALIGN="center">
	   <TH COLSPAN="2"> Add user</TH>
</TR>

<TR class=row_even>
	<TD>Userid * </TD>
	<TD><input TYPE=text name=uid size="8" maxlength="8"></TD>
</TR>
<TR class=row_odd>
	<TD>Password * </TD>
	<TD><input TYPE=password name=pwd size="8"  maxlength="8"></TD>
</TR>
<TD><input type=hidden name=auth value=3>
<TR class=row_even>
	<TD><INPUT TYPE=submit name=submit value="Submit">
</TD>
	<TD><INPUT TYPE=reset name=resett value="Reset" > 
</TD>
</TR>
</TABLE>


</FORM>
</BODY>
</HTML>




