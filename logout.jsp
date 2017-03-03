<%
     session.removeValue("admin_id");
     session.removeValue("a_password");
	 response.sendRedirect("main.html");
	 session.removeValue("username");
	 session.removeValue("userid");
%>