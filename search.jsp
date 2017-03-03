<%@page contentType="text/html;charset=gb2312"%>
<%@include file="top.jsp"%>
<%@page import="java.util.*" %>
<html>
<body background="pic/search.jpg" bgproperties="fixed">
<div><td><a href="index.jsp">首页</a></td>
</div>
<input type="button" name="Submit2" onclick="javascript:history.back(-2);" value="返回" />

<style type="text/css">
<!--
-->
</style>
<form name="form1" method="post" action="searchout.jsp">
  <table width="452" border="0" align="center">
  <tr>
    <td width="106" height="60" bgcolor="#FFFF99">关键字</td>
    <td width="336" bgcolor="#FFFFCC">
      <label>
        <textarea name="keywords"></textarea>
      </label>
  
    </td>
  </tr>
  <tr>
    <td height="76" bgcolor="#FFFF99">版块类型</td>
    <td bgcolor="#FFFFCC">
      <label>
        <select name="select">
		  <%
	  String sql="select classname from  class ";
	  ResultSet rs=st.executeQuery(sql);
	  while (rs.next()){
	  String classname=rs.getString("classname");
	  %>
       
          <option><%=classname%></option>
        <%}%>
  
        </select>
      </label>
  
    </td>
  </tr>
  <tr>
    <td height="69" bgcolor="#FFFF99">搜素范围</td>
    <td bgcolor="#FFFFCC">
      <label>
        <input type="radio" name="radiobutton" value="标题">
        标题
        <input type="radio" name="radiobutton" value="内容">
        内容</label>
      <label>
      <input type="radio" name="radiobutton" value="作者">
      作者</label>
 
    </td>
  </tr>
  
</table>
 
  <p>&nbsp;</p>
  <p>
   <center> <input name="Submit" type="submit" value="提交" /></center>
</p>
</form>
</body>
</html>
