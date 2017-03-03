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
<title>删除版面</title>
<%
String id=request.getParameter("id");
String sql = "delete from class where classid="+id;
st.executeUpdate(sql);
st.close();
conn.close();
out.println("<script language='javascript'>alert('版面删除成功！');location.href='class_manage.jsp'</script>");
%>
</html>