<%@page contentType="text/html;charset=gb2312"%>
<%@include file="top.jsp"%>
<%@page import="java.util.*" %>

<meta charset="gb2312">
<html><script language="JavaScript"></script></html>
<html>
<head>
<title>�ȳ���ֲ�</title>
</head>
 
<body background="pic/boardbg.jpg" bgproperties="fixed">


 
 
<div filter:Alpha(opacity=80);
       opacity: .80;
       background-color: #FFFFFF;>

<br>
<form name="form1" method="post" action="fatie.jsp">
  <label></label>
  
  <center><a href="index.jsp">��ҳ</a><br>
  <input type="submit" name="Submit2" value="��Ҫ����"><td bgcolor="#0033FF">&nbsp;&nbsp;&nbsp;</td></center>
</form>
<table width="1000" border="0" align="center" >
  <tr bgcolor="#FFFF99" >
    <td width="80">�������</td>
    <td width="80">�ظ�����</td>
	<td width="800" height="30">���±���</td>
    <td width="100">����</td>
    <td width="130">����ʱ��</td>
    
  </tr>
 
<%
        String classid=request.getParameter("classid");
		 session.putValue("classid", classid);
		String sql="SELECT * FROM topic where classid="+classid ;
		ResultSet  rs=st.executeQuery(sql);
		
		while (rs.next())
		{
		String topicid=rs.getString("topicid");
			String tname=rs.getString("tname");
			String clicktimes=rs.getString("clicktimes");
			String replytimes=rs.getString("replytimes");
		
%>
		
		  <tr bgcolor=" #FFFFCC">
		    <td width="80"><%=(clicktimes==null?"0":clicktimes)%></td>
			  <td width="80"><%=(replytimes==null?"0":replytimes)%></td>
			  <td width="600" height="30"><a href="content.jsp?topicid=<%=topicid%>&classid=<%=classid%>"><%=tname%> </a></td>
		  <td width="100"><%out.println(rs.getString("username"));%></td>
		  <td width="100"><%out.println(rs.getString("tdate"));%></td>
		  
		    
		 </tr>
		<% }
		st.close();
		conn.close();%>		
</table>           

</div>
         		
</body>
</html>

