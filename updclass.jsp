<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@include file="dbUtil.jsp"%>
<meta charset="gb2312">
<title>�����޸ġ��ȳ���ֲ�BBS����ϵͳ</title>
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
<h2>�����޸�</h2>

<%String classid=request.getParameter("id");

String sql="select * from class where classid="+classid;
ResultSet rs=st.executeQuery(sql);%>
<form name = "updcla" action = "updatecla.jsp?id=<%=classid%>" method=post>
<%while(rs.next())
{String classname=rs.getString("classname");
String classintro=rs.getString("classintro");
%>

<table>
<tr>
	<td>�������:</td>
	<td><input type="text" name="classname" value=<%=classname%> ><br>
</td>
</tr>
<tr>
	<td>�����飺</td>
	<td><textarea rows="3" cols="20" name="classintro"><%=classintro%></textarea><br>
</td>
</tr>
</table>
<br>
<input type="submit" value="�޸�" onClick="{if(confirm('�޸Ľ����ָܻ���ȷ���޸�ô��')){return true;}return false;}"> 
<input type="button" value="�����޸Ĳ�������һ��" onclick="location.href('class_manage.jsp')">

<%
}%>
</form>
<table width="822" border="0" align="center" bordercolor="#99FFFF">
  <tr bordercolor="#FFFFFF" bgcolor="#ADD8E6">
    <td width="133" >���±���</td>
    <td width="130">����</td>
    <td width="130">��������</td>
    <td width="130">�������</td>
    <td width="130">�ظ�����</td>
	<td>����</td>
  </tr>
 
<%
		session.putValue("classid", classid);
		sql="SELECT * FROM topic where classid="+classid ;
		rs=st.executeQuery(sql);
		
		while (rs.next())
		{
		String topicid=rs.getString("topicid");
			String tname=rs.getString("tname");
			String clicktimes=rs.getString("clicktimes");
			String replytimes=rs.getString("replytimes");
		
%>
		
		  <tr bgcolor="#AFEEEE">
		    <td width="130" height="80"><a href="delreply.jsp?topicid=<%=topicid%>&classid=<%=classid%>"><%=tname%> </a></td>
		  <td width="130"><%out.println(rs.getString("username"));%></td>
		  <td width="130"><%out.println(rs.getString("tdate"));%></td>
		  
		    <td width="130"><%=clicktimes%></td>
			  <td width="130"><%=replytimes%></td>
			  <td><a href='deltopic.jsp?topicid=<%=topicid%>'>ɾ��������</a></td>
		 </tr>
		<% }%>		
</table>           
<%

st.close();
conn.close();%>
<input type="button" value="���ع������" onClick="window.location.href('class_manage.jsp')">
</center>
</body>
</html>