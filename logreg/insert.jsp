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
  out.println("<script language='javascript'>alert('�û����Ѵ��ڣ�������ע�ᣡ');history.back()</script>");
}
else {*/

String username=request.getParameter("name");
username=new String(username.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ

String password=request.getParameter("password");
password=new String(password.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ

String sex=request.getParameter("sex");
sex=new String(sex.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ

String email=request.getParameter("email");
email=new String(email.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ

String qq=request.getParameter("qq");
qq=new String(qq.getBytes("ISO8859_1"),"gb2312");//���ʺŸ�Ϊ������ʾ

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
 //out.println("<script language='javascript'>alert ('���³ɹ�!')</script>");
 out.println("<script language='javascript'>alert('ע��ɹ�����ӭ����');location.href='index.jsp'</script>");

 %>