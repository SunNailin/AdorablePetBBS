
<%@page contentType="text/html;charset=gb2312"%>
<%@ include file="usercentertop.jsp"%>
<%@ page import="java.util.*"%> 
<meta charset="gb2312">

<%username=(String)session.getValue("username");
  String sql="select * from topic where username='"+username+"'";
  ResultSet rs=st.executeQuery(sql);  	%>  
 <html>
 <body>
 <center>
  <table bgcolor="#FFff99">  
  <tr>
	<td width="92"><div align="center"><strong> ��������</strong></div></td>
    <td width="94"><div align="center"><strong>��������</strong></div></td>
    <td width="108"><div align="center"><strong>��������</strong></div></td>
    <td width="81"><div align="center"><strong>�������</strong></div></td>
    <td width="72"><div align="center"><strong>�ظ�����</strong></div></td>
    <td width="88"><div align="center"><strong>����</strong></div></td>
</tr>
<%while(rs.next())
{String tname=rs.getString("tname");
String tid=rs.getString("topicid");
String clicktimes=rs.getString("clicktimes");
String replytimes=rs.getString("replytimes");%>
<tr bgcolor="#FFFFCC">
<td><%=tname%></td>
<td><%=rs.getString("tcontent")%></td>
<td><%=rs.getString("tdate")%></td>
<td><%=(clicktimes==null?"0":clicktimes)%></td>
<td><%=(replytimes==null?"0":replytimes)%></td>
<td><a href="delmytopic.jsp?id=<%=tid%>">ɾ��</a></td>
</tr>
<%}
st.close();
conn.close();%>
</table>
</center>
</body>
</html>