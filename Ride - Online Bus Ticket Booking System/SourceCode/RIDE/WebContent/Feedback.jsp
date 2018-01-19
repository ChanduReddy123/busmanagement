<%@ page import="java.util.Properties,java.sql.*" %>
<%@ page language="java" %>
<%@ page session="true" %>

<%
System.out.println("__________________");

					
%>
<html>
<head>
<title>Testimonial</title>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<script language=javascript>
function goURL()
{
	Msg = document.FeedbackForm.message.value;
	
	From = document.FeedbackForm.From.value;
	if(From==""){
		alert("Please provide your mail id.");
		document.FeedbackForm.From.focus();
		return false;
	}
	if(Msg==""){
		alert("Feedback is mandatory.");
		document.FeedbackForm.message.focus();
		return false;
	}
	if(Msg!="" && From!=""){
		url = "Feedback.jsp?message="+Msg+"&From="+From;
		//alert(url);
		var frm = document.FeedbackForm;
		frm.action = url;
	}else{
		return false;
	}
}
</script>
</head>
<body class="SC" >

<%


if(request.getMethod().equals("POST")  )
{
%>
	<h4>Testimonial</h4>
<%
  boolean status = false;
  //Updating database
  	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	int result=0;
	try
	{
		/*Getting the connection variable from session*/
		con = com.ewheelz.ConnectionPool.getConnection();
		stmt =  con.createStatement();
		Date DateSubmitted = new Date(System.currentTimeMillis());
		String msg = request.getParameter("message").replace('\'',' ');
		String From = request.getParameter("From");



		String Query = "Insert into Feedback(UserID,Feedback,DateSubmitted) values (\'"+From+"\',\'"+msg+"\',\'"+DateSubmitted+"\')";
		System.out.println(Query);
		result = stmt.executeUpdate(Query);
		System.out.println(result);
		if(result!=0){
			status=true;
		}else{
			status=false;
		}
	}
	catch(Exception e)
	{
		%><%=e%><%
	}


  if (status == true)
  {
     out.println("<P align=center><FONT COLOR='green' face='Georgia'>Your Feedback submitted successfully!<BR> Thanks for providing your feedback.</FONT></P>");
	 %><center><A href="Feedback.jsp">&lt;&lt;Back</A></center><%
  }
}
else
{

%>

<h4>Testimonial</h4>
<P align=left><FONT COLOR="black" Face="Georgia">Please drop us a line!<BR>
If you have a query, an idea or a suggestion, we would be most happy to listen and will do our best to implement the same</FONT>
</P>
<form method="POST" name="FeedbackForm"  onsubmit="return goURL()">
<table align=left width="60%">
<tr class="row_title">
    <td colspan=2>Message</td>
</tr>
<tr class="row_odd">
    <td><B>Your email Id</B> <FONT COLOR="#FF0000">*</FONT></td>
    <td><B><INPUT TYPE="text" NAME="From" size="50"></B></td>
</tr>
<tr class="row_odd">
    <td><B>Feedback</B> <FONT COLOR="#FF0000">*</FONT></td>
    <td><TEXTAREA name="message" ROWS = "5" COLS="50"></TEXTAREA></td>
</tr>
<tr class="row_odd">
    <td align=center><input type="reset"  name="Clear" Value="Clear" class="WinButton"></td>
	<td align=center><input type="submit"  name="Command" Value="Submit Feedback"  class="WinButton"></td>
</tr>
</table>
</form>

<%
}
%>

</body>
</html>
