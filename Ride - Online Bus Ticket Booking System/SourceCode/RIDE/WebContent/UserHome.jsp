<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<% String user_id=(String)session.getAttribute("userr");%>

<head>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

 </head>

 <body Class=Log>
<br><h3 style="background-color:#82C0FF">Welcome <Font COLOR="#E60000"><U><%=user_id%></U></Font></h3><br><br><br><BR><BR><BR>
	<A href="ChangePassword1.jsp" target="LoginFrame"><img border="0" name="NewPassWord" src="Images/NewPassword1.jpg" width="101" height="22" onmouseover="document['NewPassWord'].src='Images/NewPassword0.jpg'" onmouseout="document['NewPassWord'].src='Images/NewPassword1.jpg'" ></a></td>


<a href="Logout.jsp">
<img border="0" name="Search" src="Images/SignOut1.jpg" width="101" height="22" onmouseover="document['Search'].src='Images/SignOut0.jpg'" onmouseout="document['Search'].src='Images/SignOut1.jpg'" ></a></td>

  
 </BODY>
</HTML>
