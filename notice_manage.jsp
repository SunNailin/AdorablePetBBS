<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="err.jsp" %>
<%@include file="dbUtil.jsp"%>

<title>֪ͨ�������ȳ���ֲ�BBS����ϵͳ</title>
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
<h1>�ȳ���ֲ�BBS����ϵͳ��֪ͨ����</h1>
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

 <a href="logout.jsp">�˳������ص�¼ҳ��</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin_manage.jsp">����Ա����</a><br>
  <table border = 1 width = 80% >
<tr>
<td width=80>֪ͨID</td>
<td width=200>֪ͨ����</td>
<td width=500>֪ͨ����</td>
<td>����ʱ��</td>
<td width=150>����<br><a href="newnot.jsp"><font color="red">������֪ͨ</font></td>
</tr>
<%String sql = "select * from notice";
 ResultSet rs = st.executeQuery(sql);

 while(rs.next()){%>
	 <%String id=rs.getString("noticeid");
	 String ntime=rs.getString("ntime");
	 %>

<TR>
<TD><%=id%></td>
<TD><%=rs.getString("ntitle")%></td>
<td><%=rs.getString("ncontent")%></td>
<TD><%=ntime%></td>

<td><a href = "delnot.jsp?id=<%=id%>" onClick="{if(confirm('ȷ��ɾ��ѡ���ļ�¼��?')){return true;}return false;}">ɾ��</a>/<a href="updnot.jsp?id=<%=id%>">�鿴���޸�</a></td>
</tr>
<%}%>

</center>
</body>
<html>