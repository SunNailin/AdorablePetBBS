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
<title>ɾ��������</title>
<%
String classid=(String)session.getValue("classid");
String id=request.getParameter("topicid");
String sql = "delete from topic where topicid ="+id;
st.executeUpdate(sql);
st.close();
conn.close();
%>
<script language='javascript'>
	alert("������ɾ���ɹ���"); 
	window.location.href="updclass.jsp?id=<%=classid%>";
</script>
</html>