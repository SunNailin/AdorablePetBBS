<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@include file="dbUtil.jsp"%>
<title>�޸��С�������</title>
<%
if (session.getValue("admin_id")==null)
{
 response.sendRedirect("err.jsp?id=14");
 return;
}

%>
<meta charset=gb2312>
�����޸ġ���
<%
String classid=request.getParameter("id");
out.println(classid);
String classname=request.getParameter("classname");
classname=new String(classname.getBytes("ISO8859_1"),"gb2312");
String classintro=request.getParameter("classintro");
classintro=new String(classintro.getBytes("ISO8859_1"),"gb2312");
out.println(classname);out.println(classintro);

String sql="update class set classname='"+classname+"',classintro='"+classintro+"' where classid="+classid;
st.executeUpdate(sql);
st.close();
conn.close();
 out.println("<script language='javascript'>alert ('�޸ĳɹ���');location.href='class_manage.jsp'</script>");
 //out.println("<script language='javascript'>alert('ע��ɹ�����ӭ����');location.href='index.jsp'</script>");
 %>
