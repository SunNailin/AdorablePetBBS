
<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>  
<%if (session.getValue("userid")==null)
{
 out.println("<script language='javascript'>alert('您未登陆或登陆失效，请重新登陆');location.href='logout.jsp'</script>");
}
if((session.getValue("userstatus")).equals("封禁"))
{
 out.println("<script language='javascript'>alert('您的账号被封禁，请联系管理员');location.href='logout.jsp'</script>");

}
String username=(String)session.getValue("username");
String userid=(String)session.getValue("userid");
%>
<meta charset="gb2312">
<html>
<style type="text/css">
<!--
#hello {
	font-family: "方正稚艺简体";
	font-size: 16px;
	color: #FFFFFF;
	background-color: #0066FF;
	margin: 0px;
	float: none;
	height: auto;
	width: auto;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	text-align: center;
}
#user {
	float: left;
	height: 600px;
	width: 300px;
	font-family: "方正少儿简体";
	font-size: 24px;
	text-align: center;
	margin-top: 100px;
}
-->
</style>
<body background="pic/ucbg.jpg" bgproperties="fixed">
<%String nowtime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); %>
<div class="top" id="hello">你好，<%=username%>，欢迎来到萌宠俱乐部，快点儿跟大家分享您的养宠趣事儿吧！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现在时间是:<%=nowtime%>。
  <input type="button" value="退出并返回登录界面" onClick="window.location.href='logout.jsp'">
  <a href="usercentertop.jsp?username=<%=username%>"><font color="#FFFFFF"><个人中心></font></a>
  <a href="index.jsp?username=<%=username%>"><font color="#FFFFFF"><网站首页></font></a>
    <a href="search.jsp"><font color="#FFFFFF"><全站搜索></font></a>

  <%
String sqlnot="select top 1 * from notice order by noticeid desc";
Connection connnot =DriverManager.getConnection(dbURL);
Statement stnot=connnot.createStatement();
ResultSet rsnot=stnot.executeQuery(sqlnot);
if(rsnot.next()){
String ntitle=rsnot.getString("ntitle");
String ncontent=rsnot.getString("ncontent");
String ntime=rsnot.getString("ntime");
%>
<P> <MARQUEE scrollamount="5" >【最新通知】：通知标题：<%=ntitle%>&nbsp;&nbsp;&nbsp;通知内容：<%=ncontent%>&nbsp;&nbsp;&nbsp;通知时间：<%=ntime%></MARQUEE></P>
<%}
else %><P> <MARQUEE scrollamount="5" >无通知</MARQUEE></P>
</div>

<%
if(username.equals("游客"))
 out.println("<script language='javascript'>alert('您现在的身份是游客，请登录后查看');location.href=('main.html')</script>");
%>


<div class="usercentertop" id="user"><a href="look.jsp?name=<%=username%>">用户信息查看</a><br><br>
<a href="modify.jsp?id=<%=userid%>">用户信息修改</a><br><br>
<a href="look_tips.jsp?name=<%=username%>">查看自己发布的主题</a><br><br>
<a href="userreply.jsp?name=<%=username%>">查看自己发表的回复</a><br><br></div>
<%stnot.close();
connnot.close();
%>



</body>
</html>