<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>

<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>  
<meta charset="gb2312">
<%  
String username=(String)session.getValue("username");

String classid =(String)session.getValue("classid");   
String tdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); 
String name=request.getParameter("tname");
String content=request.getParameter("tcontent");
String tname=new String(name.getBytes("ISO8859_1"),"gb2312");
String tcontent=new String(content.getBytes("ISO8859_1"),"gb2312");

if(tname.equals("")) {%>
<script language='javascript'>
	alert("标题不能为空，请输入标题！"); 
	window.location.href="fatie.jsp";
</script>
<%}else{
String sql="insert into topic(classid,tname,tcontent,username,tdate) values("+classid+",'"+tname+"','"+tcontent+"','"+username+"',#"+tdate+"#)";
st.executeUpdate(sql);
Connection conn1 =DriverManager.getConnection(dbURL);
Statement st1=conn.createStatement();
String sql1="update users set tips=tips+"+1;
st1.executeUpdate(sql1);
conn1.close();
st1.close();


%>
<script language='javascript'>
	alert("发帖成功！立即查看！"); 
	window.location.href="board.jsp?classid=<%=classid%>";
</script>
<%}st.close();
conn.close();%>
