<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"  %>
<%@include file="dbUtil.jsp"%>
<title>����û�</title>

<%
String id=request.getParameter("id");
String sql="update users set userstatus ='���' where userid="+id;
st.executeUpdate(sql);
st.close();
conn.close();
out.println("<script language='javascript'>alert('����û��ɹ���');location.href='user_manage.jsp'</script>");
%>


