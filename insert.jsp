<%@page contentType="text/html;charset=gb2312"%>
<%@ include file="dbUtil.jsp"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>
<meta charset=gb2312>
<%

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

String head=request.getParameter("icon");
String regdate=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
String birthday="";
String sql="";
if(year.equals("")||month.equals("")||day.equals(""))
{
  sql="insert into users (username,password,sex,email,qq,head,tips,visits,regdate,userstatus) values ('"+username+"','"+password+"','"+sex+"','"+email+"','"+qq+"','"+head+"',"+0+","+0+",#"+regdate+"#,'����')";
}
 else
 {
   birthday=year+"-"+month+"-"+day;
    sql="insert into users (username,password,sex,email,qq,head,tips,visits,regdate,userstatus,birthday) values ('"+username+"','"+password+"','"+sex+"','"+email+"','"+qq+"','"+head+"',"+0+","+0+",#"+regdate+"#,'   ����',#"+birthday+"#)";
 }
st.executeUpdate(sql);
st.close();
conn.close();
 out.println("<script language='javascript'>alert('ע��ɹ������¼��');location.href='main.html'</script>");

 %>