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
<title>ɾ���ظ�</title>
<%
String id=request.getParameter("id");
String topicid=request.getParameter("topicid");
String sql = "delete from reply where replyid ="+id;
st.executeUpdate(sql);
st.close();
conn.close();

%>
<script language='javascript'>
	alert("�ظ�ɾ���ɹ���"); 
	window.location.href="delreply.jsp?topicid=<%=topicid%>";
</script>
</html>