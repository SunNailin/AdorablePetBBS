<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>
<meta charset="gb2312">
<title>萌宠俱乐部BBS管理系统首页</title>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}

%>
<html>
<body background="pic/mgbg.jpg" bgproperties="fixed">
<center>
<h1>萌宠俱乐部BBS管理系统</h1>
<table cellspacing="0" cellpadding="0" border="0" width="99%" align="center">
  <tr> 
    <td bgcolor="#009ACE" width="17"> 
    
  <tr> 
    <td class="tablerow" colspan="7"  height="16"> 
      <table border="0" cellspacing="0" width="100%" cellpadding="0">
        <tr> 
          <td width="40%" align="right"><font color="blue"><b><a href='notice_manage.jsp'>通知管理</a></b></font></td>
          <td width="20%" align="center"><font color="blue"><b><a href='class_manage.jsp'>版面管理</font></a></b></font></td>
          <td width="40%" align="left"><font color="blue"><b><a href='user_manage.jsp'>用户管理</a></b></font></td>
        </tr>
      </table>
    </td>
  </tr>

  <a href="logout.jsp">退出并返回论坛首页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin_manage.jsp">管理员管理</a>
  
</center>
</body>
<html>