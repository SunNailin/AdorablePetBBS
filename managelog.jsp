<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>

<meta charset="gb2312">
<title>萌宠俱乐部论坛管理系统</title>
<html>
<style type="text/css">
<!--
#aa {
	font-family: "方正姚体简体";
	font-size: 24px;
	text-decoration: blink;
	text-align: center;
	vertical-align: middle;
	color: #FFFFFF;
	margin-top: 30px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
}
-->
</style>
<body background="pic/adminbg.jpg">
<div class="managelog" id="aa"><center>
<form name="frm" action="manpass.jsp">
  <p><img src="pic/admin.jpg" width="193" height="193">  <br>
    </p>
  <p>欢迎进入萌宠俱乐部论坛管理系统！<br>
    请登录！<br>
      <br>
    管理员ID：（必须为数字）<br>
      <input type="text" name="adminid">
      <br>
    管理密码：<br>
      <input type="password" name="apassword">
      <br>
      <br>
      <input type="submit" value="确定">
      <br>
      <br>
      <input type="button" name="returnlog" onClick="window.location.href='main.html'" value="返回登录界面">
      </p>
  </form>
</center>
</div>
<body>
</html>