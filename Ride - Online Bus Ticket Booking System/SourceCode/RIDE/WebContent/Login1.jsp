
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<HTML>

<head>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

</head>

<BODY CLASS=Grad onload="document.LOGIN.uid.focus();">
<center>
<BR><BR>
<FONT FACE="Century Gothic">


<!--Declaration of varaibles-->

<%! String errormsg ;%>
<%! String disluserid ;%>
<%! String dislpwd ;%>

    

<% 
   /*Retreiving user id and password*/

    disluserid = request.getParameter("uid");
    if(disluserid == null)
    disluserid = "";
    dislpwd = request.getParameter("pwd");
    if(dislpwd == null)
    dislpwd = "";

%>

<!--Retrieve the error from request and display on screen-->

<%  errormsg = request.getParameter("error") ;
    //System.out.println("errormsg = "+errormsg);
    if (errormsg == null)
    {
        //System.out.println("Error messages was null so clearing it..");
        errormsg = " ";
    }
    if(errormsg.equals("blankfields"))
    {
      %>
       <FONT COLOR="#FF0000">
       Both the fields are Mandatory.Please fill up both fields.<BR><BR>
      <%
    }  
    if(errormsg.equals("invalid"))
    {
      %>
        <FONT COLOR="#FF0000">
        Invalid Username or Password. Please re-enter. <BR><BR>
        <%
    } 
%>

<%-- ***** LOGIN SCREEN ***** --%>


<FORM NAME="LOGIN" ACTION="Validate.jsp" METHOD="POST" >
<br>

<p align=left>
<A href="ChangePassword1.jsp"> <FONT  COLOR="#E60000">RequestNew Password </A>
<A href="Login.jsp"> <FONT  COLOR="#E60000">Back</A>

</center>

</FORM>
</BODY>
</HTML>
