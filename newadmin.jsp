<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>
<meta charset="gb2312">
<title>�½�����Ա�˺�</title>
<%
if (session.getValue("admin_id")==null)
{
%>
<script language='javascript'>
	alert("�����Թ���Ա��ݵ�¼������"); 
	window.location.href="managelog.jsp";
</script>
<% return;
}

%>

<html>
<body >
<center>
<h2>�½�����Ա</h2>
<form name="newadm" action="newadm.jsp" method=post>
<table>
</tr>
<tr>
	<td>����Ա���룺</td>
	<td><input type="text" name="ap">(���μǸ�����)<br>
</td>
</tr>
</table>
<br>
<input type="submit" value="����" onclick="{if(confirm('ȷ�������¹���Աô��')){return true;}return false;}"> 
<input type="button" value="�������Ӳ�������һҳ" onclick=javascript:history.go(-1)>


</center>
</body>
</html>
