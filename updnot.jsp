<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="err.jsp"%>
<%@include file="dbUtil.jsp"%>
<meta charset="gb2312">
<title>֪ͨ�鿴���޸ġ��ȳ���ֲ�BBS����ϵͳ</title>
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
<h2>֪ͨ�޸�</h2>

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
	<td>֪ͨ����:</td>
	<td><input type="text" name="ntitle" value=<%=ntitle%> style="width:449px"><br>
</td>
</tr>
<tr>
	<td>֪ͨ���ݣ�</td>
	<td><textarea rows="3" cols="100" name="ncontent"><%=ncontent%></textarea><br>
</td>
</tr>
</table>
<br>
<input type="submit" value="�޸�" onclick="{if(confirm('�޸Ľ����ָܻ���ȷ���޸�ô��')){return true;}return false;}">
<input type="button" value="�����޸Ĳ�������һ��" onclick="location.href('notice_manage.jsp')">

<%
}
st.close();
conn.close();%>
</center>
</body>
</html>