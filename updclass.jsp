<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@include file="dbUtil.jsp"%>
<meta charset="gb2312">
<title>版面修改—萌宠俱乐部BBS管理系统</title>
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
<h2>版面修改</h2>

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
	<td>版面标题:</td>
	<td><input type="text" name="classname" value=<%=classname%> ><br>
</td>
</tr>
<tr>
	<td>版面简介：</td>
	<td><textarea rows="3" cols="20" name="classintro"><%=classintro%></textarea><br>
</td>
</tr>
</table>
<br>
<input type="submit" value="修改" onClick="{if(confirm('修改将不能恢复，确定修改么？')){return true;}return false;}"> 
<input type="button" value="放弃修改并返回上一级" onclick="location.href('class_manage.jsp')">

<%
}%>
</form>
<table width="822" border="0" align="center" bordercolor="#99FFFF">
  <tr bordercolor="#FFFFFF" bgcolor="#ADD8E6">
    <td width="133" >文章标题</td>
    <td width="130">作者</td>
    <td width="130">发表日期</td>
    <td width="130">点击次数</td>
    <td width="130">回复次数</td>
	<td>操作</td>
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
			  <td><a href='deltopic.jsp?topicid=<%=topicid%>'>删除该主题</a></td>
		 </tr>
		<% }%>		
</table>           
<%

st.close();
conn.close();%>
<input type="button" value="返回管理界面" onClick="window.location.href('class_manage.jsp')">
</center>
</body>
</html>