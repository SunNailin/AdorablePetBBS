<%@page contentType="text/html;charset=gb2312"%>
<%@include file="top.jsp"%>
<%@page import="java.util.*" %>
<html>
<body background="pic/search.jpg" bgproperties="fixed">
<div><td><a href="index.jsp">��ҳ</a></td>
</div>
<input type="button" name="Submit2" onclick="javascript:history.back(-2);" value="����" />

<style type="text/css">
<!--
-->
</style>
<form name="form1" method="post" action="searchout.jsp">
  <table width="452" border="0" align="center">
  <tr>
    <td width="106" height="60" bgcolor="#FFFF99">�ؼ���</td>
    <td width="336" bgcolor="#FFFFCC">
      <label>
        <textarea name="keywords"></textarea>
      </label>
  
    </td>
  </tr>
  <tr>
    <td height="76" bgcolor="#FFFF99">�������</td>
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
    <td height="69" bgcolor="#FFFF99">���ط�Χ</td>
    <td bgcolor="#FFFFCC">
      <label>
        <input type="radio" name="radiobutton" value="����">
        ����
        <input type="radio" name="radiobutton" value="����">
        ����</label>
      <label>
      <input type="radio" name="radiobutton" value="����">
      ����</label>
 
    </td>
  </tr>
  
</table>
 
  <p>&nbsp;</p>
  <p>
   <center> <input name="Submit" type="submit" value="�ύ" /></center>
</p>
</form>
</body>
</html>
