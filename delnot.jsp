<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}%>
<html>
<title>删除公告</title>
<%
String id=request.getParameter("id");
String sql = "delete from notice where noticeid ="+id;
st.executeUpdate(sql);
st.close();
conn.close();
out.println("<script language='javascript'>alert('公告删除成功！');location.href='notice_manage.jsp'</script>");
%>
</html>