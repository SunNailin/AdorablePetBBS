<%@page contentType="text/html;charset=gb2312"%>
<%@include file="top.jsp"%>
<meta charset="gb2312">
<%
if(username.equals("�ο�")){
 out.println("<script language='javascript'>alert('�����ڵ��������οͣ����¼���ڷ���');location.href=('main.html')</script>");}
else {
String rtime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
String topicid=request.getParameter("topicid");
String rcontent=request.getParameter("rcontent");
out.println(rcontent);
rcontent=new String(rcontent.getBytes("ISO8859_1"),"gb2312");
if(rcontent.equals("�ظ���")||rcontent.equals("")) 
{%>
<script language='javascript'>
	alert("�ظ����ݲ���Ϊ�գ����������ݣ�"); 
	window.location.href="content.jsp?topicid=<%=topicid%>";
</script>
<%}
else{
String sql="insert into reply(topicid,rcontent,rtime,username)  values("+topicid+",'"+rcontent+"',#"+rtime+"#,'"+username+"')";
st.executeUpdate(sql);

String sql2="select replytimes from topic where topicid ="+topicid ;
ResultSet rs2=st.executeQuery(sql2);

int replytimes=0;
if(rs2.next()){replytimes=rs2.getInt("replytimes");}
replytimes=replytimes+1;

String sql3="update topic set replytimes="+replytimes+" where topicid="+topicid;
st.executeUpdate(sql3);
Connection conn1 =DriverManager.getConnection(dbURL);
Statement st1=conn.createStatement();
String sql1="update users set tips=tips+"+1;
st1.executeUpdate(sql1);
conn1.close();
st1.close();
%>
<script language='javascript'>
	alert("�ظ��ɹ��������鿴��"); 
	window.location.href="content.jsp?topicid=<%=topicid%>";
</script>
<%}}st.close();
conn.close();
%>