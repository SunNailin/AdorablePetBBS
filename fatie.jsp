<%@page contentType="text/html;charset=gb2312"%>
<%@include file="top.jsp"%>
<%
if(username.equals("�ο�"))
 out.println("<script language='javascript'>alert('�����ڵ�������οͣ����¼���ڷ���');location.href=('main.html')</script>");
%>
<meta charset="gb2312">
<html>
<style type="text/css">
<!--
#fatie {
	float: right;
	margin-right: 200px;
	margin-top: 100px;
}
#fatie #fa {
	float: right;
	margin-right: 200px;
	text-align: center;
	vertical-align: middle;
	filter: Alpha(Opacity=60, FinishOpacity=0.80);
	margin-top: 50px;
}
-->
</style>
<body background="pic/fatie.jpg">
<form name="form1" method="post" action="fatiesave.jsp">
<div align="center"></div>

<div class="fatie" id="fatie"><table width="425" border="0" align="center" bordercolor="#FF99FF">
  <tr bordercolor="#0000CC" bgcolor="#0099FF">
    <td width="40" height="46">����</td>
    <td width="367"><textarea name="tname" cols="50" rows="2"></textarea> 
    &nbsp;</td>
  </tr>
  <tr bordercolor="#0066CC" bgcolor="#0066FF">
    <td height="137" bgcolor="#0099FF">����</td>
    <td bgcolor="#0099FF"><textarea name="tcontent" cols="50" rows="10"></textarea>      &nbsp;</td>
  </tr>
</table>  
  <div class="fatie" id="fa"><input type="button" name="Submit2" onclick="javascript:history.back(-1);" value="������һҳ" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="�ύ">
</div>
</div>
<div align="center">
  </div>
</form>
</body>
</html>
