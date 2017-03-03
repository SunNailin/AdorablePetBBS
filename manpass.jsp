<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>

<meta charset="gb2312">
<%String adminid,apassword,sql;%>
<%
 adminid=request.getParameter("adminid");
 apassword=request.getParameter("apassword");
  if(adminid.matches("[0-9]+"))//boolean b=str.matches("[0-9]+"); 
           {
            if(adminid==""||apassword=="")
   out.print("<script language='javascript'>alert('管理员ID或密码不能为空');history.go(-1)</script>");
 else
{
	sql="select * from admin where adminid="+adminid;
	ResultSet rs=st.executeQuery(sql);
	if(rs.next())
	 {	String keytemp=rs.getString("apassword");
		if(keytemp.equals(apassword))
		 {
			session.putValue("admin_id",adminid);
			out.println("<script language='javascript'>alert('登录成功，欢迎您！');location.href='manage.jsp'</script>");
		  }
		 else  out.println("<script language='javascript'>alert('密码输入有误，请重新输入');location.href='managelog.jsp'</script>");
	  }
	  else out.print("<script language='javascript'>alert('用户不存在，请重新输入');history.go(-1)</script>");

 }

           }
           else
           {
           out.println("<script language='javascript'>alert('id必须为数字');location.href='managelog.jsp'</script>");
           }
st.close();
conn.close();%>