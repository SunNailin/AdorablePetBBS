<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@include file="dbUtil.jsp"%>
<meta charset="gb2312">
<title>�������ӡ��ȳ���ֲ�BBS����ϵͳ</title>
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
<h2>���Ӱ���</h2>
<form name="newnot" action="newclass.jsp" method=post>
<table>
<tr>
	<td>�������:</td>
	<td><input type="text" name="classname" value="" ><br>
</td>
</tr>
<tr>
	<td>�����飺</td>
	<td><textarea rows="3" cols="20" name="classintro" ></textarea><br>
</td>
</tr>
</table>
<br>
<input type="submit" value="����" onclick="{if(confirm('ȷ�����Ӱ���ô��')){return true;}return false;}"> 
<input type="button" value="����������������һҳ" onclick=javascript:history.go(-1)>


</center>
</body>
</html>