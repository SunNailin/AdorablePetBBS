<%@page contentType="text/html;charset=gb2312"%>
<%@include file="top.jsp"%>
<%@page import="java.sql.*"%>

<html>
<title>ɾ���Լ���������</title>
<%
String topic_id=request.getParameter("id");

String sql = "delete from topic where topicid ="+topic_id;
out.println(sql);
st.executeUpdate(sql);
st.close();
conn.close();
%>
<script language='javascript'>
	alert("������ɾ���ɹ���"); 
	window.location.href="look_tips.jsp";
</script>
</html>