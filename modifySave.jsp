<%@page contentType="text/html;charset=gb2312"%>
<%@ include file="dbUtil.jsp"%>
<%
String id=(String)session.getValue("id");

String name=request.getParameter("name");
name=new String(name.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ


String password=request.getParameter("password");
password=new String(password.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ

String sex=request.getParameter("sex");
sex=new String(sex.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ

String email=request.getParameter("email");
email=new String(email.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ

String qq=request.getParameter("qq");
qq=new String(qq.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ

String head=request.getParameter("icon");
String regdate=request.getParameter("regdate");
String birthday=request.getParameter("birthday");
//out.print(birthday);
String sql="";

if(birthday.equals("null"))
{
   sql="update users set username='"+name+"',password='"+password+"',sex='"+sex+"',email='"+email+"',qq='"+qq+"',head='"+head+"',userstatus='����' where userid="+id;            
}
 else
 {
     sql="update users set username='"+name+"',password='"+password+"',sex='"+sex+"',email='"+email+"',qq='"+qq+"',head='"+head+"',birthday=#"+birthday+"#,userstatus='����' where userid="+id;            
}
st.executeUpdate(sql);
st.close();
conn.close();
%><script language='javascript'>
	alert("�޸ĳɹ���"); 
	window.location.href="look.jsp?name=<%=name%>";
</script>