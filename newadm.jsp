<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@include file="dbUtil.jsp"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>  

<title>����Ա����С�������</title>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}

%>
<meta charset=gb2312>
�������ӹ���Ա����
<%
String apassword=request.getParameter("ap");
String sql="insert into admin(apassword) values('"+apassword+"')";
st.executeUpdate(sql);
st.close();
conn.close();
out.println("<script language='javascript'>alert ('����Ա���ӳɹ����뷵�ز鿴����ԱID��');location.href='admin_manage.jsp'</script>");
 //out.println("<script language='javascript'>alert('ע��ɹ�����ӭ����');location.href='index.jsp'</script>");
 %>
