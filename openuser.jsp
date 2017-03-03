<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"  errorPage="err.jsp"%>
<%@include file="dbUtil.jsp"%>
<title>启用用户</title>

<%
String id=request.getParameter("id");
String sql="update users set userstatus ='正常' where userid="+id;
st.executeUpdate(sql);
st.close();
conn.close();
out.println("<script language='javascript'>alert('启用用户成功！');location.href='user_manage.jsp'</script>");
%>


