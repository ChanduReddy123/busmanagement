<%@ page import="com.ewheelz.SessionCounter" %>
<html>
<head>
	<title>Active Sessions</title>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

</head>

<body CLASS=SC>
	<p align="center">
	<b><font face="Verdana" size="2">No. of users online <%= SessionCounter.getActiveSessions() %></font></b>
	</p>
</body>
</html>