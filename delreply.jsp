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
<title>ɾ���ظ���</title>
</head>
<% String topicid=request.getParameter("topicid");
String classid=request.getParameter("classid");

%>
	
		
<body>
<center>
<h1>�鿴��ɾ���ظ�</h1>

<form name="form1" method="post" action="fatie.jsp?topicid=<%=topicid%>">

</form>
<table width="820" border="0" align="center" bordercolor="#FFFFFF">
  <tr bgcolor="#33FFCC">
    <td width="171" height="37">��������</td>
    <td width="200">��������</td>
	<td width>��������</td>
    <td width="201">���ⷢ��ʱ��</td>
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
    <td width="171" height="37">�ظ���</td>
    <td width="434">�ظ�����</td>
    <td width="201">�ظ�ʱ��</td>
	<td width="80">����</td>
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
	 <td><a href="deleterep.jsp?id=<%=replyid%>&topicid=<%=topicid%>">ɾ��</a></td>
</tr>
<%}%>




  <center>
<div align="center">
</div>

</form>
<input name="button" type=button onClick="location.href('updclass.jsp?id=<%=classid%>')" value="������һ��">
</body>
</html>
