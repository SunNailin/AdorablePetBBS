<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.util.*" %>
<%@include file="top.jsp"%>

<meta charset="gb2312">
<html>
<body background="pic/contentbg (2).jpg;" bgproperties="fixed" >
<center>
<head>
<title>查看主题</title>
</head> 
<body>
<%String classid=(String)session.getValue("classid");%>
<% String topicid=request.getParameter("topicid");
   String user_name="";
   String tcontent="";
   String tname="";
   String tdate="";
   String sql="select *  from topic where topicid="+topicid;
   ResultSet rs=st.executeQuery(sql);
    String sqlcn="select * from class where classid="+classid;
 String cn="";

   Connection conncn =DriverManager.getConnection(dbURL);
Statement stcn=conncn.createStatement();
ResultSet rscn=stcn.executeQuery(sqlcn);
if(rscn.next()){
cn=rscn.getString("classname");}
stcn.close();
conncn.close();

int clicktimes=0;
if  (rs.next())
{String replytimes=rs.getString("replytimes");

 clicktimes =rs.getInt("clicktimes");
 user_name=rs.getString("username"); 
 tcontent=rs.getString("tcontent");
 tdate=rs.getDate("tdate").toString();
 tname=rs.getString("tname");
 String sqlhead="select * from users where username='"+user_name+"'";
 String head="";
Connection connhead =DriverManager.getConnection(dbURL);
Statement sthead=connnot.createStatement();
ResultSet rshead=sthead.executeQuery(sqlhead);
if(rshead.next()){
head=rshead.getString("head");}
sthead.close();
connhead.close();
 
%> 
<a href="index.jsp">首页</a>>><a href="board.jsp?classid=<%=classid%>"><%=cn%></a>>><%=tname%>
<center>
<table width="993" border="0">
  <tr>
    <td bgcolor="#FFFF99">作者</td>
    <td colspan="5" bgcolor="#FFFF99">文章标题：<%=tname%></td>
  </tr>
  
  <tr>
    <td width="244" rowspan="2" bgcolor="#FFFFCC">&nbsp;<%=user_name%><br><input type="image" src="<%=head%>"></td>
    <td colspan="5" bgcolor="#FFFF99">发表时间：<%=tdate%></td>
  </tr>
  
  <tr>
    <td height="144" colspan="5" bgcolor="#FFFFCC">&nbsp;<%=tcontent%></td>
  </tr>
  

  <tr bgcolor="#FFFF99">
  </tr>

<%}%>
<%
clicktimes=clicktimes+1;
String sql3="update topic set clicktimes="+clicktimes+" where topicid="+topicid;
st.executeUpdate(sql3);
String replyid=request.getParameter("replyid");
String sql2="select * from reply where topicid="+topicid;
ResultSet rs2=st.executeQuery(sql2);
String u_name="";
String  rcontent="";
String rtime="";
while (rs2.next()){
 u_name=rs2.getString("username"); 
 rcontent=rs2.getString("rcontent");
 rtime=rs2.getString("rtime");
  String sqlhead2="select * from users where username='"+u_name+"'";
 String head2="";
Connection connhead2 =DriverManager.getConnection(dbURL);
Statement sthead2=connnot.createStatement();
ResultSet rshead2=sthead2.executeQuery(sqlhead2);
if(rshead2.next()){
head2=rshead2.getString("head");}
sthead2.close();
connhead2.close();

%>
   <tr bgcolor="#FFFF99">
   <td>作者</td>
    <td colspan="5">文章标题：回复<%=user_name%></td>
   </tr>
  <tr bgcolor="#FFFFCC">
    <td width="244" rowspan="2">&nbsp;<%=u_name%><br><input type="image" src="<%=head2%>"></td>
    <td colspan="5" bgcolor="#FFFF99">发表时间：<%=rtime%></td>
  </tr>
   <tr bgcolor="#FFFFCC">
    <td height="144" colspan="5">&nbsp;<%=rcontent%></td>
  <tr bgcolor="#FFFF99">
  </tr>
  </tr>
<td height="2"></tr>
<%}%>


</table>

<form name="form2" method="post" action="reply.jsp?topicid=<%=topicid%>">
  <label></label>
  <table width="996" align="center" bordercolor="#FFFFCC">
    <tr bgcolor="#FFFFCC">
      <td width="13" height="118" bordercolor="#FFFFCC" bgcolor="#FFFF99"><div align="left">内容</div></td>
      <td width="971" bgcolor="#FFFFCC">
        
        <div align="left">
            <textarea name="rcontent" cols="50" rows="5" >回复：</textarea>
      &nbsp;</div></td>
    </tr>
  </table>
  <center>
<div align="center">
  <input type="submit" name="Submit3" value="提交">
</div></center>
</center></form>
</body>
</html>
