<!--Interface Code to prompt condition value from end user-->

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<BODY class=SC>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth!=0){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

<h2 align = center>Delete User</h2>
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String Condition = "UserID";
	String[] ConValues = new String[2000];
	int ConCount=0,i=0;
	String Query1="";
%>
<FORM Name='DelForm' METHOD=POST ACTION="DelUser.jsp">
			<CENTER><B><FONT face="verdana"> Select a record to delete from database </FONT></B></CENTER><BR><BR>
		 <center>
   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	<TR class=row_title ALIGN="center"> <TH COLSPAN="2"> Delete User</TH>
		<TR class=row_odd>
			<TH><%=Condition.replace('`',' ')%></TH>
			<TD><SELECT NAME="<%=Condition%>">
			<OPTION Value="">Select</OPTION>

<%
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();

			if(Condition.trim().equalsIgnoreCase("undefined")){
				System.out.println("in if");
				Query1 = "Select * from Login";
			}
			else{
				System.out.println("in else");
				Query1 = "Select "+Condition+" from Login";
			}
			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			int rCount=0;
				while(rs.next()){
					String x = rs.getString(1);
					ConValues[i]=x;
					%><OPTION Value=<%=ConValues[i]%>><%=ConValues[i]%></OPTION><%
					i++;
				}
		}catch(Exception e){%><%=e%><%}
%>
		</SELECT></TD>
		</TR>
		<TR class=row_odd><TD align=center><Input type='Submit' name='submit' value='Delete'></TD>
		<TD align=center><Input type='reset' name='Reset' value='Clear'></TD>
		</TR>
		</TABLE>
</FORM>
</BODY>

<%
}
%>



