<%@page contentType="text/html;charset=gb2312"%>
<%@ include file="dbUtil.jsp"%>
<%
String id=(String)session.getValue("id");

String name=request.getParameter("name");
name=new String(name.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示


String password=request.getParameter("password");
password=new String(password.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示

String sex=request.getParameter("sex");
sex=new String(sex.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示

String email=request.getParameter("email");
email=new String(email.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示

String qq=request.getParameter("qq");
qq=new String(qq.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示

String head=request.getParameter("icon");
String regdate=request.getParameter("regdate");
String birthday=request.getParameter("birthday");
//out.print(birthday);
String sql="";

if(birthday.equals("null"))
{
   sql="update users set username='"+name+"',password='"+password+"',sex='"+sex+"',email='"+email+"',qq='"+qq+"',head='"+head+"' where userid="+id;            
}
 else
 {
     sql="update users set username='"+name+"',password='"+password+"',sex='"+sex+"',email='"+email+"',qq='"+qq+"',head='"+head+"',birthday=#"+birthday+"# where userid="+id;            
}
st.executeUpdate(sql);
st.close();
conn.close();

 out.println("<script language='javascript'>alert ('修改成功！');location.href='user_manage.jsp'</script>");
 //out.println("<script language='javascript'>alert('注册成功，欢迎您！');location.href='index.jsp'</script>");
 %>
