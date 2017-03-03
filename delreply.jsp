<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.util.*" %>

<meta charset="gb2312">
<html>
<style type="text/css">
<!--
.STYLE2 {font-size: 18px}
a:link {
	color: #FF66FF;
	font-weight: bold;
	font-style: italic;
}
-->
</style>
<head>
<title>删除回复贴</title>
</head>
<% String topicid=request.getParameter("topicid");
String classid=request.getParameter("classid");

%>
	
		
<body>
<center>
<h1>查看或删除回复</h1>

<form name="form1" method="post" action="fatie.jsp?topicid=<%=topicid%>">

</form>
<table width="820" border="0" align="center" bordercolor="#FFFFFF">
  <tr bgcolor="#33FFCC">
    <td width="171" height="37">主题作者</td>
    <td width="200">主题名称</td>
	<td width>主题内容</td>
    <td width="201">主题发布时间</td>
  </tr>

<% 
String sql="select *  from topic where topicid="+topicid;
ResultSet rs=st.executeQuery(sql);
int clicktimes=0;
if (rs.next()){
clicktimes =rs.getInt("clicktimes");
String username=rs.getString("username"); 
String tname=rs.getString("tname");
String  tcontent=rs.getString("tcontent");
String tdate=rs.getDate("tdate").toString();
 
%>
   <tr bgcolor="#0099FF">
       <td width="171" height="26"><%=username%></td>  
	    <td width="171" height="26"><%=tname%></td>  
     <td width="434" height="26"><%=tcontent%></td>
     <td width="201" height="26"><%out.println(tdate);%></td>
  </tr>	 
<%}%>
<table width="820" border="0" align="center" bordercolor="#FFFFFF">
  <tr bgcolor="#33FFCC">
    <td width="171" height="37">回复者</td>
    <td width="434">回复内容</td>
    <td width="201">回复时间</td>
	<td width="80">操作</td>
  </tr>

<%
clicktimes=clicktimes+1;
String sql3="update topic set clicktimes="+clicktimes+" where topicid="+topicid;
st.executeUpdate(sql3);
String sql2="select * from reply where topicid="+topicid;
ResultSet rs2=st.executeQuery(sql2);
while (rs2.next()){
	String replyid=rs2.getString("replyid");
String username=rs2.getString("username"); 
String  rcontent=rs2.getString("rcontent");
String rtime=rs2.getString("rtime");
%>
   <tr bgcolor="#0099FF">
     <td width="171" height="26"><%=username%></td>  
     <td width="434" height="26"><%=rcontent%></td>
     <td width="201" height="26"><%out.println(rtime);%></td>
	 <td><a href="deleterep.jsp?id=<%=replyid%>&topicid=<%=topicid%>">删除</a></td>
</tr>
<%}%>




  <center>
<div align="center">
</div>

</form>
<input name="button" type=button onClick="location.href('updclass.jsp?id=<%=classid%>')" value="返回上一级">
</body>
</html>
