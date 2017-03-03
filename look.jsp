<%@page contentType="text/html;charset=gb2312"%>
<%@ include file="usercentertop.jsp"%>
<meta charset="gb2312">

<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.STYLE1 {
	font-family: "幼圆";
	color: #330033;
}
.STYLE2 {font-family: "幼圆"}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户资料查看</title>
</head>
<body>
<table>
<table width=50% height="393" border=0 align=center bordercolor="#FFFFFF" bgcolor="#FFFFCC">
  <%
String name=request.getParameter("name");
name=new String(name.getBytes("ISO8859_1"), "gb2312");//将问号显示成正常的字符
String sql="select * from users where username='"+name+"'";//从数据查找用户名
ResultSet rs=st.executeQuery(sql);
if(rs.next()){
	String id=rs.getString("userid");
  %>
  <tr>
    <td width="46%" height="37"><div align="center" class="STYLE1">用户编号:</div></td>
    <td width="54%" bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=id%></td>
  </tr>
 
  <tr>
    <td bgcolor="#FFFFCC"><div align="center" class="STYLE1">用户名:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("username")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">用户性别:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("sex")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">用户邮箱:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("email")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">QQ:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("qq")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">出生日期:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getDate("birthday")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">用户图像:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><input type="image" src="<%=rs.getString("head")%>"></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">发帖次数:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("tips")%>（包含主题帖和回复贴，包含已经被删除的）</td>
  </tr>

<tr>
    <td><div align="center" class="STYLE2">访问次数:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("visits")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">注册日期:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getDate("regdate")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">用户状态:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("userstatus")%></td>
  </tr>
  <tr> </tr>
  <%}
else  {
	out.println("<script language='javascript'>alert('用户名或密码有误，请重新输入！');history.back()</script>");
}
	st.close();
	conn.close();%>
</table>
</body>
</html>
