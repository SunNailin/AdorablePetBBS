<%@page contentType="text/html;charset=gb2312"%>
<%@include file="top.jsp"%>
<%@page import="java.sql.*"%>

<html>
<title>ɾ���Լ��Ļظ�</title>
<%
String reply_id=request.getParameter("id");

String sql = "delete from reply where replyid ="+reply_id;
out.println(sql);
st.executeUpdate(sql);
st.close();
conn.close();
%>
<script language='javascript'>
	alert("������ɾ���ɹ���"); 
	window.location.href="userreply.jsp";
</script>
</html>