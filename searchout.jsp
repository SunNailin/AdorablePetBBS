<%@page contentType="text/html;charset=gb2312"%>
<%@include file="top.jsp"%>
<%@page import="java.util.*" %>
<meta charset="gb2312">
<html>
<body background="pic/search.jpg" bgproperties="fixed">
<div><td><a href="index.jsp">首页</a></td>
</div>
<input type="button" name="Submit2" onclick="javascript:history.back(-2);" value="返回" />

<%
String keywords=request.getParameter("keywords");
String classname=request.getParameter("select");
String radio =request.getParameter("radiobutton");


keywords=new String(keywords.getBytes("ISO8859_1"),"gb2312");
classname=new String(classname.getBytes("ISO8859_1"),"gb2312");
radio=new String(radio.getBytes("ISO8859_1"),"gb2312");
//out.println(keywords);
//out.println(radio);

//out.println(classname);

 /*   String tname="";
	String replytimes="";
	String clicktimes="";
	String tdate="";
	String username="";
*/
String sql="select classid from class where classname='"+classname+"'";
ResultSet rs=st.executeQuery(sql);
String classid="";
if (rs.next())
classid=rs.getString("classid");


if(radio.equals("标题")){//1

     String sql2="select * from topic where classid="+classid+"and tname like '%"+keywords+"%'";
     Connection conn2 =DriverManager.getConnection(dbURL);
     Statement st2=conn2.createStatement();
     ResultSet rs2=st2.executeQuery(sql2);

    if(!rs2.next()){  //2
	%>

<script language='javascript'>
    alert("没有匹配信息，请重新输入检索内容！"); 
	window.location.href="search.jsp";
</script><%}//2

    else{ //3%>
<table width="796" border="0" align="center">
  <tr>
    <td width="96" height="65" bgcolor="#FFFF99">版块类别</td>
	
    <td width="107" bgcolor="#FFFF99">标题</td>
    <td width="115" bgcolor="#FFFF99">内容</td>
    <td width="115" bgcolor="#FFFF99">作者</td>
    <td width="115" bgcolor="#FFFF99">发表时间</td>
    <td width="101" bgcolor="#FFFF99">点击次数</td>
    <td width="117" bgcolor="#FFFF99">回复次数</td>
  </tr>
<%
String  replytimes=rs2.getString("replytimes");
String  clicktimes=rs2.getString("clicktimes");
String   username2=rs2.getString("username");
String tdate=rs2.getString("tdate");
String tcontent=rs2.getString("tcontent");
String tname=rs2.getString("tname");


%>

<tr>
    <td width="96" height="65" bgcolor="#FFFFCC"><%=classname%></td>
    <td width="107" bgcolor="#FFFFCC"><%=tname%></td>
    <td width="115" bgcolor="#FFFFCC"><%=tcontent%></td>
    <td width="115" bgcolor="#FFFFCC"><%=username2%></td>
 <td width="115" bgcolor="#FFFFCC"><%=tdate%></td>
    <td width="101" bgcolor="#FFFFCC"><%=clicktimes%></td>
    <td width="117" bgcolor="#FFFFCC"><%=replytimes%></td>
  </tr>

<%
   while (rs2.next()){

  replytimes=rs2.getString("replytimes");
  clicktimes=rs2.getString("clicktimes");
   username2=rs2.getString("username");
   tcontent=rs2.getString("tcontent");
 tdate=rs2.getString("tdate");
 tname=rs2.getString("tname");
%>

  <tr>
    <td width="96" height="65" bgcolor="#FFFFCC"><%=classname%></td>
    <td width="107" bgcolor="#FFFFCC"><%=tname%></td>
    <td width="115" bgcolor="#FFFFCC"><%=tcontent%></td>
    <td width="115" bgcolor="#FFFFCC"><%=tdate%></td>
    <td width="115" bgcolor="#FFFFCC"><%=username2%></td>
    <td width="101" bgcolor="#FFFFCC"><%=clicktimes%></td>
    <td width="117" bgcolor="#FFFFCC"><%=replytimes%></td>
  </tr>
     <%}//4
	conn2.close();
	st2.close();
   } //3%>
</table>

<%}//1
if(radio.equals("内容")){ //1
String sql3="select * from topic where classid="+classid+"and tcontent like '%"+keywords+"%'";
Connection conn3 =DriverManager.getConnection(dbURL);
Statement st3=conn3.createStatement();

ResultSet rs3=st3.executeQuery(sql3);

if(!rs3.next()){ //2%> 
<script language='javascript'>
    alert("没有匹配信息，请重新输入检索内容！"); 
	window.location.href="search.jsp";
</script>
<% }//2
else{ //3%>
<table width="796" border="0" align="center">
  <tr>
    <td width="96" height="65" bgcolor="#FFFF99">版块类别</td>
    <td width="107" bgcolor="#FFFF99">标题</td>
    <td width="115" bgcolor="#FFFF99">内容</td>
    <td width="115" bgcolor="#FFFF99">作者</td>
    <td width="115" bgcolor="#FFFF99">发表时间</td>
    <td width="101" bgcolor="#FFFF99">点击次数</td>
    <td width="117" bgcolor="#FFFF99">回复次数</td>
  </tr>
 <%
String  tname=rs3.getString("tname");
String  clicktimes=rs3.getString("clicktimes");
String replytimes=rs3.getString("replytimes");
String  username2=rs3.getString("username");
String tdate=rs3.getString("tdate");
String  tcontent=rs3.getString("tcontent");


while (rs3.next()){ //4

  tcontent=rs3.getString("tcontent");
  tname=rs3.getString("tname");
  clicktimes=rs3.getString("clicktimes");
 replytimes=rs3.getString("replytimes");
  username2=rs3.getString("username");
 tdate=rs3.getString("tdate");
%>
  <tr>
    <td width="96" height="65" bgcolor="#FFFFCC"><%=classname%></td>
    <td width="107" bgcolor="#FFFFCC"><%=tname%></td>
    <td width="115" bgcolor="#FFFFCC"><%=tcontent%></td>
    <td width="115" bgcolor="#FFFFCC"><%=tdate%></td>
    <td width="115" bgcolor="#FFFFCC"><%=username2%></td>
    <td width="101" bgcolor="#FFFFCC"><%=clicktimes%></td>
    <td width="117" bgcolor="#FFFFCC"><%=replytimes%></td>
  </tr>
     <%}//4
	conn3.close();
	st3.close();
   } //3%>
</table>

<%}

if(radio.equals("作者")){//1

String sql4="select * from topic where classid="+classid+"and username like '%"+keywords+"%'";
Connection conn4 =DriverManager.getConnection(dbURL);
Statement st4=conn4.createStatement();
ResultSet rs4=st4.executeQuery(sql4);
if(!rs4.next()){ //2%>
<script language='javascript'>
    alert("没有匹配信息，请重新输入检索内容！"); 
	window.location.href="search.jsp";
</script>
<% }//2
else {  //3
%>
<table width="796" border="0" align="center">
  <tr>
    <td width="96" height="65" bgcolor="#FFFF99">版块类别</td>
    <td width="107" bgcolor="#FFFF99">标题</td>
    <td width="115" bgcolor="#FFFF99">内容</td>
    <td width="115" bgcolor="#FFFF99">作者</td>
    <td width="115" bgcolor="#FFFF99">发表时间</td>
    <td width="101" bgcolor="#FFFF99">点击次数</td>
    <td width="117" bgcolor="#FFFF99">回复次数</td>
  </tr>
<%String tname=rs4.getString("tname");
String   clicktimes=rs4.getString("clicktimes");
String replytimes=rs4.getString("replytimes");
String  username2=rs4.getString("username");
String tdate=rs4.getString("tdate");
String tcontent=rs4.getString("tcontent");
%>
 <tr>
    <td width="96" height="65" bgcolor="#FFFFCC"> <%=classname%></td>
    <td width="107" bgcolor="#FFFFCC"><%=tname%></td>
    <td width="115" bgcolor="#FFFFCC"><%=tcontent%></td>
  
    <td width="115" bgcolor="#FFFFCC"><%=username2%></td> 
	 <td width="115" bgcolor="#FFFFCC"><%=tdate%></td>
    <td width="101" bgcolor="#FFFFCC"><%=clicktimes%></td>
    <td width="117" bgcolor="#FFFFCC"><%=replytimes%></td>
  </tr>
<%
while (rs4.next()){ //4
  tname=rs4.getString("tname");
   clicktimes=rs4.getString("clicktimes");
 replytimes=rs4.getString("replytimes");
  username2=rs4.getString("username");
 tdate=rs4.getString("tdate");
  tcontent=rs4.getString("tcontent");

%>

  <tr>
    <td width="96" height="65" bgcolor="#FFFFCC"><%=classname%></td>
    <td width="107" bgcolor="#FFFFCC"><%=tname%></td>
    <td width="115" bgcolor="#FFFFCC"><%=tcontent%></td>
    <td width="115" bgcolor="#FFFFCC"><%=tdate%></td>
    <td width="115" bgcolor="#FFFFCC"><%=username2%></td>
    <td width="101" bgcolor="#FFFFCC"><%=clicktimes%></td>
    <td width="117" bgcolor="#FFFFCC"><%=replytimes%></td>
  </tr>
     <%}//4
	conn4.close();
	st4.close();
   } //3%>
</table>

<%}%>






