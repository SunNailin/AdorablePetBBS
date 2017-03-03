<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="err.jsp"%>
<%@include file="dbUtil.jsp"%>
<meta charset="gb2312">
<title>通知查看或修改—萌宠俱乐部BBS管理系统</title>
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
<h2>通知修改</h2>

<%String noticeid=request.getParameter("id");

String sql="select * from notice where noticeid="+noticeid;
ResultSet rs=st.executeQuery(sql);%>
<form name = "updnot" action = "updatenot.jsp?id=<%=noticeid%>" method=post>
<%while(rs.next())
{String ntitle=rs.getString("ntitle");
String ncontent=rs.getString("ncontent");
%>

<table>
<tr>
	<td>通知标题:</td>
	<td><input type="text" name="ntitle" value=<%=ntitle%> style="width:449px"><br>
</td>
</tr>
<tr>
	<td>通知内容：</td>
	<td><textarea rows="3" cols="100" name="ncontent"><%=ncontent%></textarea><br>
</td>
</tr>
</table>
<br>
<input type="submit" value="修改" onclick="{if(confirm('修改将不能恢复，确定修改么？')){return true;}return false;}">
<input type="button" value="放弃修改并返回上一级" onclick="location.href('notice_manage.jsp')">

<%
}
st.close();
conn.close();%>
</center>
</body>
</html>