<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="err.jsp"%>
<%@include file="dbUtil.jsp"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>  

<title>发布中…………</title>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}

%>
<meta charset=gb2312>
正在发布……
<%
String ntitle=request.getParameter("ntitle");
ntitle=new String(ntitle.getBytes("ISO8859_1"),"gb2312");
String ncontent=request.getParameter("ncontent");
ncontent=new String(ncontent.getBytes("ISO8859_1"),"gb2312");
String ntime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); 
out.println(ntime);
out.println(ncontent);

String sql="insert into notice(ntitle,ncontent,ntime) values('"+ntitle+"','"+ncontent+"',#"+ntime+"#)";
st.executeUpdate(sql);
st.close();
conn.close();
out.println("<script language='javascript'>alert ('发布成功！');location.href='notice_manage.jsp'</script>");
 //out.println("<script language='javascript'>alert('注册成功，欢迎您！');location.href='index.jsp'</script>");
 %>
