<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.util.*" %>
<%@ include file="top.jsp"%>
<meta charset="gb2312">
<title>�ȳ���ֲ�</title>
<html>
<style type="text/css">
<!--
#index {
	background-position: center;
	vertical-align: middle;
	filter:alpha(opacity=0,finishopacity=100,
����style=1,startx=0,starty=85,finishx=150,finishy=85);
}
-->
</style>
<body background="pic/indexbg.jpg" bgproperties="fixed"><br><br><br><br>

<center>
		    <div class="index" id="index">
			<table width="1000">
  <tr  bgcolor="#FFFF99">
    <td width="145" height="30"><p>����б�</p>    </td>
	<td width="400" >�����</td>
    <td width="100" >��������</td>
  </tr>
  <%
  String sql="select * from class";
  ResultSet rs=st.executeQuery(sql);
  while(rs.next())
  {

  String classid=rs.getString("classid");//����
  String classname=rs.getString("classname");
  String classintro=rs.getString("classintro");
  	 String sql_t="select count(topicid) as tnum from topic where classid="+classid;
	 Connection conn1 =DriverManager.getConnection(dbURL);
     Statement st1=conn1.createStatement();

	ResultSet rs_t=st1.executeQuery(sql_t);
	rs_t.next();
	String tnum=rs_t.getString("tnum");
			conn1.close();
			st1.close();//�����
  %><tr>
		  <td width="145" height="80"  bgcolor="#ffffcc"><a href="board.jsp?classid=<%=classid%>"><%=classname%> </a></td>
	  <td width="400" bgcolor="#ffffcc"><%=classintro%>
			</td>
		  <td width="100" bgcolor="#ffffcc"><span class="STYLE2"><%=tnum%></span></td>  <!��ʾ��������-->

		
		
	   
    </tr>
<% }st.close();
conn.close();%>		
</table>

<br><br><br><br><br>
�ȳ���ֲ� ������̳1.0��<br>
Powerd by ��<br>
������&nbsp;&nbsp;&nbsp;&nbsp;��ϼ&nbsp;&nbsp;&nbsp;&nbsp;������<br>
��Ȩ����

			</div>

</center>
</body>
</html>




