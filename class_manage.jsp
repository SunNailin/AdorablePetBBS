<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@include file="dbUtil.jsp"%>
<title>��������ȳ���ֲ�BBS����ϵͳ</title>
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
<h1>�ȳ���ֲ�BBS����ϵͳ���������</h1>
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

<a href="logout.jsp">�˳������ص�¼ҳ��</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin_manage.jsp">����Ա����</a>
  <table border = 1 width = 80% >
<tr>

<td width=80>����ID</td>
<td width=200>�������</td>
<td width=400>������</td>
<td width=80>��������</td>
<td width=150>����<br><a href="newcla.jsp"><font color="red">�����°���</font></td>
</tr>
<%String sql = "select * from class";
 ResultSet rs = st.executeQuery(sql);

 while(rs.next()){%>
	 <%String id=rs.getString("classid");
	 String classname=rs.getString("classname");
	 String classintro=rs.getString("classintro");
	 String sql_t="select count(topicid) as tnum from topic where classid="+id;
	 Connection conn1 =DriverManager.getConnection(dbURL);
     Statement st1=conn1.createStatement();

	ResultSet rs_t=st1.executeQuery(sql_t);
	rs_t.next();
	String tnum=rs_t.getString("tnum");
			conn1.close();
			st1.close();%>
<TR>
<TD><%=id%></td>
<TD><a href="updclass.jsp?id=<%=id%>"><%=classname%></td>
<td><%=classintro%></td>
<td><%=tnum%></td>

<td><a href = "delclass.jsp?id=<%=id%>" onClick="{if(confirm('ɾ���ð����ͬʱ���������е����Ӷ��ᱻɾ���Ҳ��ָܻ���ȷ��ɾ��ѡ���ļ�¼��?')){return true;}return false;}">ɾ��</a>/<a href="updclass.jsp?id=<%=id%>">�鿴���޸�</a></td>
</tr>
<%}
st.close();
conn.close();%>
</center>
</body>
<html>