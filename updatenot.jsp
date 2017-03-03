<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="err.jsp"%>
<%@include file="dbUtil.jsp"%>
<title>修改中…………</title>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}

%>
<meta charset=gb2312>
正在修改……
<%
String noticeid=request.getParameter("id");
out.println(noticeid);
String ntitle=request.getParameter("ntitle");
ntitle=new String(ntitle.getBytes("ISO8859_1"),"gb2312");
String ncontent=request.getParameter("ncontent");
ncontent=new String(ncontent.getBytes("ISO8859_1"),"gb2312");
out.println(ncontent);

String sql="update notice set ntitle='"+ntitle+"',ncontent='"+ncontent+"' where noticeid="+noticeid;
st.executeUpdate(sql);
st.close();
conn.close();
 out.println("<script language='javascript'>alert ('修改成功！');location.href='notice_manage.jsp'</script>");
 //out.println("<script language='javascript'>alert('注册成功，欢迎您！');location.href='index.jsp'</script>");
 %>
