<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>

<meta charset="gb2312">
<title>�ȳ���ֲ���̳����ϵͳ</title>
<html>
<style type="text/css">
<!--
#aa {
	font-family: "����Ҧ�����";
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
  <p>��ӭ�����ȳ���ֲ���̳����ϵͳ��<br>
    ���¼��<br>
      <br>
    ����ԱID��������Ϊ���֣�<br>
      <input type="text" name="adminid">
      <br>
    �������룺<br>
      <input type="password" name="apassword">
      <br>
      <br>
      <input type="submit" value="ȷ��">
      <br>
      <br>
      <input type="button" name="returnlog" onClick="window.location.href='main.html'" value="���ص�¼����">
      </p>
  </form>
</center>
</div>
<body>
</html>