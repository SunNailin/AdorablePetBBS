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
   out.print("<script language='javascript'>alert('����ԱID�����벻��Ϊ��');history.go(-1)</script>");
 else
{
	sql="select * from admin where adminid="+adminid;
	ResultSet rs=st.executeQuery(sql);
	if(rs.next())
	 {	String keytemp=rs.getString("apassword");
		if(keytemp.equals(apassword))
		 {
			session.putValue("admin_id",adminid);
			out.println("<script language='javascript'>alert('��¼�ɹ�����ӭ����');location.href='manage.jsp'</script>");
		  }
		 else  out.println("<script language='javascript'>alert('����������������������');location.href='managelog.jsp'</script>");
	  }
	  else out.print("<script language='javascript'>alert('�û������ڣ�����������');history.go(-1)</script>");

 }

           }
           else
           {
           out.println("<script language='javascript'>alert('id����Ϊ����');location.href='managelog.jsp'</script>");
           }
st.close();
conn.close();%>