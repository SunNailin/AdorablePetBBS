<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>

<meta charset="gb2312">
<%String username,password,sql;%>
<%
 username=request.getParameter("username");
 password=request.getParameter("password");
 out.println(username);
 username=new String(username.getBytes("ISO8859_1"),"gb2312");
 if(username==""||password=="")
   response.sendRedirect("err.jsp?id=2");
 else
{
	sql="select * from users where username='"+username+"'";
	ResultSet rs=st.executeQuery(sql);
	if(rs.next())
	 {	String keytemp=rs.getString("password");
		if(keytemp.equals(password))
		 {
			String user_id=rs.getString("userid");
			int visits=rs.getInt("visits");
			String userstatus=rs.getString("userstatus");
			session.putValue("username",username);
		    session.putValue("userid",user_id);
			session.putValue("userstatus",userstatus);
			visits=visits+1;
			Connection conn1 =DriverManager.getConnection(dbURL);
			Statement st1=conn1.createStatement();
			String sql1="update users set visits="+visits+" where username='"+username+"'";
			st1.executeUpdate(sql1);
			st1.close();
			conn1.close();
			out.println("<script language='javascript'>alert('登录成功，欢迎您！');location.href='index.jsp'</script>");
		  }
		 else  out.println("<script language='javascript'>alert('密码输入有误，请重新输入');location.href='main.html'</script>");
	  }
	  else out.print("<script language='javascript'>alert('用户不存在，请重新输入');history.go(-1)</script>");

 }
st.close();
conn.close();%>