<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>
<meta charset="gb2312">
<title>新建管理员账号</title>
<%
if (session.getValue("admin_id")==null)
{
%>
<script language='javascript'>
	alert("必须以管理员身份登录并创建"); 
	window.location.href="managelog.jsp";
</script>
<% return;
}

%>

<html>
<body >
<center>
<h2>新建管理员</h2>
<form name="newadm" action="newadm.jsp" method=post>
<table>
</tr>
<tr>
	<td>管理员密码：</td>
	<td><input type="text" name="ap">(请牢记该密码)<br>
</td>
</tr>
</table>
<br>
<input type="submit" value="增加" onclick="{if(confirm('确认增加新管理员么？')){return true;}return false;}"> 
<input type="button" value="放弃增加并返回上一页" onclick=javascript:history.go(-1)>


</center>
</body>
</html>
