<%@page contentType="text/html;charset=gb2312"%>
<%@ include file="usercentertop.jsp"%>
<meta charset="gb2312">

<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.STYLE1 {
	font-family: "��Բ";
	color: #330033;
}
.STYLE2 {font-family: "��Բ"}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û����ϲ鿴</title>
</head>
<body>
<table>
<table width=50% height="393" border=0 align=center bordercolor="#FFFFFF" bgcolor="#FFFFCC">
  <%
String name=request.getParameter("name");
name=new String(name.getBytes("ISO8859_1"), "gb2312");//���ʺ���ʾ���������ַ�
String sql="select * from users where username='"+name+"'";//�����ݲ����û���
ResultSet rs=st.executeQuery(sql);
if(rs.next()){
	String id=rs.getString("userid");
  %>
  <tr>
    <td width="46%" height="37"><div align="center" class="STYLE1">�û����:</div></td>
    <td width="54%" bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=id%></td>
  </tr>
 
  <tr>
    <td bgcolor="#FFFFCC"><div align="center" class="STYLE1">�û���:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("username")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">�û��Ա�:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("sex")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">�û�����:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("email")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">QQ:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("qq")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">��������:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getDate("birthday")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">�û�ͼ��:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><input type="image" src="<%=rs.getString("head")%>"></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">��������:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("tips")%>�������������ͻظ����������Ѿ���ɾ���ģ�</td>
  </tr>

<tr>
    <td><div align="center" class="STYLE2">���ʴ���:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("visits")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">ע������:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getDate("regdate")%></td>
  </tr>
  <tr>
    <td><div align="center" class="STYLE2">�û�״̬:</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFCC"><%=rs.getString("userstatus")%></td>
  </tr>
  <tr> </tr>
  <%}
else  {
	out.println("<script language='javascript'>alert('�û����������������������룡');history.back()</script>");
}
	st.close();
	conn.close();%>
</table>
</body>
</html>
