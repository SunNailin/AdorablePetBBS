
<%@page contentType="text/html;charset=gb2312"%>
<%@include file="dbUtil.jsp"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>  
<%if (session.getValue("userid")==null)
{
 out.println("<script language='javascript'>alert('��δ��½���½ʧЧ�������µ�½');location.href='logout.jsp'</script>");
}
if((session.getValue("userstatus")).equals("���"))
{
 out.println("<script language='javascript'>alert('�����˺ű����������ϵ����Ա');location.href='logout.jsp'</script>");

}
String username=(String)session.getValue("username");
String userid=(String)session.getValue("userid");
%>
<meta charset="gb2312">
<html>
<style type="text/css">
<!--
#hello {
	font-family: "�������ռ���";
	font-size: 16px;
	color: #FFFFFF;
	background-color: #0066FF;
	margin: 0px;
	float: none;
	height: auto;
	width: auto;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	text-align: center;
}
#user {
	float: left;
	height: 600px;
	width: 300px;
	font-family: "�����ٶ�����";
	font-size: 24px;
	text-align: center;
	margin-top: 100px;
}
-->
</style>
<body background="pic/ucbg.jpg" bgproperties="fixed">
<%String nowtime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); %>
<div class="top" id="hello">��ã�<%=username%>����ӭ�����ȳ���ֲ�����������ҷ�����������Ȥ�¶��ɣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ʱ����:<%=nowtime%>��
  <input type="button" value="�˳������ص�¼����" onClick="window.location.href='logout.jsp'">
  <a href="usercentertop.jsp?username=<%=username%>"><font color="#FFFFFF"><��������></font></a>
  <a href="index.jsp?username=<%=username%>"><font color="#FFFFFF"><��վ��ҳ></font></a>
    <a href="search.jsp"><font color="#FFFFFF"><ȫվ����></font></a>

  <%
String sqlnot="select top 1 * from notice order by noticeid desc";
Connection connnot =DriverManager.getConnection(dbURL);
Statement stnot=connnot.createStatement();
ResultSet rsnot=stnot.executeQuery(sqlnot);
if(rsnot.next()){
String ntitle=rsnot.getString("ntitle");
String ncontent=rsnot.getString("ncontent");
String ntime=rsnot.getString("ntime");
%>
<P> <MARQUEE scrollamount="5" >������֪ͨ����֪ͨ���⣺<%=ntitle%>&nbsp;&nbsp;&nbsp;֪ͨ���ݣ�<%=ncontent%>&nbsp;&nbsp;&nbsp;֪ͨʱ�䣺<%=ntime%></MARQUEE></P>
<%}
else %><P> <MARQUEE scrollamount="5" >��֪ͨ</MARQUEE></P>
</div>

<%
if(username.equals("�ο�"))
 out.println("<script language='javascript'>alert('�����ڵ�������οͣ����¼��鿴');location.href=('main.html')</script>");
%>


<div class="usercentertop" id="user"><a href="look.jsp?name=<%=username%>">�û���Ϣ�鿴</a><br><br>
<a href="modify.jsp?id=<%=userid%>">�û���Ϣ�޸�</a><br><br>
<a href="look_tips.jsp?name=<%=username%>">�鿴�Լ�����������</a><br><br>
<a href="userreply.jsp?name=<%=username%>">�鿴�Լ�����Ļظ�</a><br><br></div>
<%stnot.close();
connnot.close();
%>



</body>
</html>