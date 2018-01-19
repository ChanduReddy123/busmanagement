<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>

<HTML>
 <HEAD>
 	<LINK href="styles.css" type="text/css" rel="stylesheet">

 <script language="JavaScript">
  <!--

keyFrame = 0;

keyFrameBack = 0;

movingObjLeft = new Array(1);
movingObjTop = new Array(1);
movingObjLeftBack = new Array(1);
movingObjTopBack = new Array(1);

movingObjLeft[0] = new Array(-175,-160,-140,-120,-100,-80,-60,-40,-20,0);
movingObjTop[0] = new Array(100,100,100,100,100,100,100,100,100,100);
movingObjLeftBack[0] = new Array(0,-20,-40,-60,-80,-100,-120,-140,-160,-175);
movingObjTopBack[0] = new  Array(100,100,100,100,100,100,100,100,100,100);

function startSlide() 
{
     setTimeout("slideTheObject()", 50);
keyFrameBack = 0;
}


function startSlideBack() 
{
     setTimeout("slideTheObjectBack()",50)
keyFrame = 0;
}

function slideTheObject()  
{
     var whichOne;

      whichOne = document.all.menu.style;
      whichOne.posLeft = movingObjLeft[0][keyFrame];
      whichOne.posTop = movingObjTop[0][keyFrame];

     keyFrame++;

    if  (keyFrame < movingObjLeft[0].length && keyFrame < movingObjTop[0].length) 
         setTimeout("slideTheObject()",50);

}

function slideTheObjectBack()  
{
     var whichOne;

     whichOne = document.all.menu.style;
     whichOne.posLeft = movingObjLeftBack[0][keyFrameBack];
     whichOne.posTop = movingObjTopBack[0][keyFrameBack];

     keyFrameBack++
     if  (keyFrameBack < movingObjLeftBack[0].length && keyFrameBack < movingObjTopBack[0].length) 
          setTimeout("slideTheObjectBack()",50);

}
function movein(which,html){
which.style.background='#CFE6F3'
description.innerHTML=html
}

function moveout(which){
which.style.background='#75A8C1'
description.innerHTML='&nbsp;'
}
//-->
</script>

 </HEAD>
 <jsp:include page="MultiLevelmenu.htm"/><br><br>

<body Class=Grad>
<% String Userid=(String)session.getAttribute("userr");%>
<center>
<br><br><br>
<h2 class=report><FONT COLOR="#000000">Welcome</FONT> <u><FONT  COLOR="#CC0000"><%=Userid%></FONT></u><FONT  COLOR="#000000"> to TransportPortal</FONT></h2><br>
</center>
   <div id="menu" style="position:absolute;left:-175px;top:100px;width:200px;z-index:1"> 
<table width="200" border="1" cellspacing="0" cellpadding="3" bordercolor="#FF0000">
<tr align="left" valign="top"> 
<br>
<td bgcolor="#CFE6F3" style="font-weight:bold;font-family:Arial;font-size:14px;">

<table bgcolor="black" border="1" cellpadding="2" cellspacing="0" width="150"><tr> 
<br><br>
<td class="menu" bordercolor="black" id="choice1" style="cursor:hand;background-color:#75A8C1" onMouseOver="movein(choice1,'To create new user')" onMouseOut="moveout(choice1)" onClick="location.href='AddUser0.jsp'">
<div align="center">Add New User</div>
</td>
  </tr>
<td class="menu" bordercolor="black" id="choice2" style="cursor:hand;background-color:#75A8C1" onMouseOver="movein(choice2,'Shows about the users details')" onMouseOut="moveout(choice2)" onClick="location.href='ViewUsers.jsp'">
<div align="center">View Users</div>
</td>
  </tr>
<td class="menu" bordercolor="black" id="choice3" style="cursor:hand;background-color:#75A8C1" onMouseOver="movein(choice3,'Deletes the user information')" onMouseOut="moveout(choice3)" onClick="location.href='DelUser0.jsp'">
<div align="center">Delete User</div>
</td>
  </tr>
<td class="menu" bordercolor="black" id="choice4" style="cursor:hand;background-color:#75A8C1" onMouseOver="movein(choice4,'Used to change user password')" onMouseOut="moveout(choice4)" onClick="location.href='ChangePassword.jsp'">
<div align="center">Change Password</div>
</td>
  </tr>
<td class="menu" bordercolor="black" id="choice5" style="cursor:hand;background-color:#75A8C1" onMouseOver="movein(choice5,'To create a new Employee')" onMouseOut="moveout(choice5)" onClick="location.href='AddNewEmployee0.jsp'">
<div align="center">Add New Employee</div>
</td>
  </tr>
 <td class="menu" bordercolor="black" id="choice6" style="cursor:hand;background-color:#75A8C1" onMouseOver="movein(choice6,'Shows about the employs details')" onMouseOut="moveout(choice6)" onClick="location.href='ViewEmployees.jsp'">
<div align="center">View Employees</div>
</td>
  </tr>
 <td class="menu" bordercolor="black" id="choice7" style="cursor:hand;background-color:#75A8C1" onMouseOver="movein(choice7,'To Remove Employee details')" onMouseOut="moveout(choice7)" onClick="location.href='DelEmployee0.jsp'">
<div align="center">Remove Employee</div>
</td>
  </tr>
<tr> 
    <td bordercolor="black" bgcolor="white" height="18"><font id="description" face="arial" size="2"></font></td>
  </tr>
</table>


</td>
<td bgcolor="#CFE6F3" style="font-weight:bold;font-family:Arial;font-size:14px;color:#FF0000;" align="center" width="20"><a title="Open menu" href="javascript:startSlide();" style="text-decoration:none;"><b>&gt;</b></a><br>
<a title="Close menu" href="javascript:startSlideBack();" style="text-decoration:none;"><b>&lt;</b></a><br>
<br>A<br>D<br>M<br>I<br>N<br><br>O<br>P<br>T<br>I<br>O<br>N<br>S</td>
</tr>
</table>
 </BODY>
</HTML>
