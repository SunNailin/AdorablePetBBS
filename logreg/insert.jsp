<%@page contentType="text/html;charset=gb2312"%>
<%@ include file="gongyou.jsp"%>
<meta charset=gb2312>
<%
/*request.setCharacterEncoding("gb2312");
String username=request.getParameter("name");
username=new String(username.getBytes("ISO8859_1"), "gb2312");

String sql="select * from users where username='"+username+"'";
ResultSet rs=st.executeQuery(sql);
if(rs.next()){
  out.println("<script language='javascript'>alert('用户名已存在，请重新注册！');history.back()</script>");
}
else {*/

String username=request.getParameter("name");
username=new String(username.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示

String password=request.getParameter("password");
password=new String(password.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示

String sex=request.getParameter("sex");
sex=new String(sex.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示

String email=request.getParameter("email");
email=new String(email.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示

String qq=request.getParameter("qq");
qq=new String(qq.getBytes("ISO8859_1"),"gb2312");//将问号改为正常显示

String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String birthday=year+"-"+month+"-"+day;

String head=request.getParameter("icon");
String regdate=request.getParameter("regdate");
String sql="insert into users (username,password,sex,email,qq,birthday,head,tips,visits,regdate,userstatus) values ('"+username+"','"+password+"','"+sex+"','"+email+"',"+qq+",#"+birthday+"#,'"+head+"',"+0+","+0+",#"+regdate+"#,"+1+")";
st.executeUpdate(sql);
st.close();
conn.close();
 //out.println("<script language='javascript'>alert ('更新成功!')</script>");
 out.println("<script language='javascript'>alert('注册成功，欢迎您！');location.href='index.jsp'</script>");

 %>