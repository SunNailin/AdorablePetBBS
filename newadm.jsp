<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@include file="dbUtil.jsp"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>  

<title>管理员添加中…………</title>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}

%>
<meta charset=gb2312>
正在增加管理员……
<%
String apassword=request.getParameter("ap");
String sql="insert into admin(apassword) values('"+apassword+"')";
st.executeUpdate(sql);
st.close();
conn.close();
out.println("<script language='javascript'>alert ('管理员增加成功。请返回查看管理员ID！');location.href='admin_manage.jsp'</script>");
 //out.println("<script language='javascript'>alert('注册成功，欢迎您！');location.href='index.jsp'</script>");
 %>
