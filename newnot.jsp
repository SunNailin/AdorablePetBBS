<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@include file="dbUtil.jsp"%>
<meta charset="gb2312">
<title>通知发布—萌宠俱乐部BBS管理系统</title>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}
%>

<html>
<body >
<center>
<h2>通知发布</h2>
<form name="newnot" action="newnotice.jsp" method=post>
<table>
<tr>
	<td>通知标题:</td>
	<td><input type="text" name="ntitle" value="" ><br>
</td>
</tr>
<tr>
	<td>通知内容：</td>
	<td><textarea rows="3" cols="20" name="ncontent" ></textarea><br>
</td>
</tr>
</table>
<br>
<input type="submit" value="发布" onclick="{if(confirm('确认发布么？')){return true;}return false;}"> 
<input type="button" value="放弃发布并返回上一页" onclick=javascript:history.go(-1)>


</center>
</body>
</html>