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
<h1>�ȳ���ֲ�BBS����ϵͳ���û�����</h1>
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
 <form name="uss" action="uss.jsp" method=post>�û�������&nbsp;<input type="text" name="us" size="width=100">&nbsp;<input type="submit" name="uss" value="����"></form>
<table border = 1 width = 80% >
<tr >
<td>�û�ID</td>
<td>�û���</td>
<td>���ʴ���</td>
<td>ע������</td>
<td>״̬</td>
<td>����</td>
</tr>
<%
String uss=request.getParameter("us");
uss=new String(uss.getBytes("ISO8859_1"),"gb2312");

String sql = "select * from users where username like '%"+uss+"%'";
 ResultSet rs = st.executeQuery(sql);

 while(rs.next()){%>
	 <%String id=rs.getString("userid");
	 String username=rs.getString("username");
	 int visits=rs.getInt("visits");
	 Date regdate=rs.getDate("regdate");
	 String userstatus=rs.getString("userstatus");
	 %>

<TR>
<TD><%=id%></td>
<TD><%=username%></td>
<TD><%=visits%></td>
<TD><%=regdate%></td>
<td><%=userstatus%></td>
<td>
<a href = "deluser.jsp?id=<%=id%>" onClick="{if(confirm('ȷ��ɾ��ѡ���ļ�¼��?')){return true;}return false;}">ɾ��</a>/
<a href="upduser.jsp?id=<%=id%>">�鿴���޸�</a>/
<a href="banuser.jsp?id=<%=id%>" >����</a>/
<a href="openuser.jsp?id=<%=id%>" >����</a></td>
</tr>
<%}
st.close();
conn.close();%>
  
</center>
</body>
<html>
