<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="err.jsp" %>
<%@include file="dbUtil.jsp"%>
<title>�û������ȳ���ֲ�BBS����ϵͳ</title>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}
%>
<html>
<body background="pic/mgbg.jpg" bgproperties="fixed">
<center>
<h1>�ȳ���ֲ�BBS����ϵͳ������Ա����</h1>
<table cellspacing="0" cellpadding="0" border="0" width="99%" align="center">
  <tr> 
    <td bgcolor="#009ACE" width="17"> 
    
  <tr> 
    <td class="tablerow" colspan="7"  height="16"> 
      <table border="0" cellspacing="0" width="100%" cellpadding="0">
        <tr> 
          <td width="40%" align="right"><font color="blue"><b><a href='notice_manage.jsp'>֪ͨ����</a></b></font></td>
          <td width="20%" align="center"><font color="blue"><b><a href='class_manage.jsp'><font color="red">�������</font></a></b></font></td>
          <td width="40%" align="left"><font color="blue"><b><a href='user_manage.jsp'>�û�����</a></b></font></td>
        </tr>
      </table>
    </td>
  </tr>

 <a href="logout.jsp">�˳������ص�¼ҳ��</a><br>
<table border = 1 width = 80% >
<tr >
<td>����ԱID</td>
<td>����Ա����</td>
<td>����<br><a href="newadmin.jsp"><font color="red">��ӹ���Ա</font></td>
</tr>
 <%String sql = "select * from admin";
 ResultSet rs = st.executeQuery(sql);
 while(rs.next()){%>
	 <%String id=rs.getString("adminid");
	 String apassword=rs.getString("apassword");%>
	 <TR>
<TD><%=id%></td>
<td><%=apassword%></td>
<td><a href="deladmin.jsp?id=<%=id%>">ɾ��</a></td>
</tr>
<%}
st.close();
conn.close();%>
  
</center>
</body>
</html>



