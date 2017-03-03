<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@include file="dbUtil.jsp"%>
<title>修改中…………</title>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}

%>
<meta charset=gb2312>
正在修改……
<%
String classid=request.getParameter("id");
out.println(classid);
String classname=request.getParameter("classname");
classname=new String(classname.getBytes("ISO8859_1"),"gb2312");
String classintro=request.getParameter("classintro");
classintro=new String(classintro.getBytes("ISO8859_1"),"gb2312");
out.println(classname);out.println(classintro);

String sql="update class set classname='"+classname+"',classintro='"+classintro+"' where classid="+classid;
st.executeUpdate(sql);
st.close();
conn.close();
 out.println("<script language='javascript'>alert ('修改成功！');location.href='class_manage.jsp'</script>");
 //out.println("<script language='javascript'>alert('注册成功，欢迎您！');location.href='index.jsp'</script>");
 %>
