<%@page contentType="text/html; charset=gb2312" language="java" %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel='stylesheet' type='text/css' href='inc/TURBOCRM.CSS'>
</head>
<BODY oncontextmenu=self.event.returnValue=false>
<table width="100%" border="0" height="100%">
<tr align="center"> 
<td>
<form method="post" action="" name="forms[0]">
        <table border="1" bordercolorlight="000000" bordercolordark="FFFFFF" cellspacing="0" bgcolor="#C0EFFE">
          <tr>
<td>
              <table border="0" bgcolor="#00CCFF" cellspacing="0" cellpadding="2" width="350">
                <tr>
                  <td width="342"></td>
<td width="18">
<table border="1" bordercolorlight="666666" bordercolordark="FFFFFF" cellpadding="0" bgcolor="E0E0E0" cellspacing="0" width="18">
<tr>
<td width="16"><b><a href="javascript:history.go(-1)" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="�ر�"><font color="000000">��</font></a></b></td>
</tr>
</table>
</td>
</tr>
</table>
<table border="0" width="350" cellpadding="4">
<tr> 
                  <td width="59" align="center" valign="top">&nbsp;</td>
<td width="269">

<%
  String Id=request.getParameter("id");
  if (Id==null)
     out.println("<P>???���Ժ�������!</P>");
  else
  {
  int Err_id=0;
	Err_id=Integer.parseInt(Id);
  if (Err_id==1)
     out.println("<P>���ӵı���</P>");
  else if(Err_id==2)
	  out.println("<P>�û��������벻��Ϊ��,������!</P>");
  else if(Err_id==3)
	  out.println("<p>���û����Ѵ���,��ѡ���������û���!</p>");
    else if(Err_id==4)
	  out.println("<p>��������û��������벻��ȷ,������!</p>");
    else if(Err_id==5)
	  out.println("<p>�㻹û�е�½������㻹û��ע�ᣬ��ע���û�!</p>");
	else if(Err_id==6)
	  out.println("<p>���Ȩ�޲�����ֻ��ϵͳ����Ա�ͱ����������޸ı��˵�����!</p>"); 
	else if(Err_id==7)
	  out.println("<p>���Ȩ�޲�����ֻ��ϵͳ����Ա�ͱ���������ɾ�����˵�����!</p>");
	else if(Err_id==8)
	  out.println("<p>����û����ѱ����ã����������Ա��ϵ!</p>");
	else if(Err_id==9)
	  out.println("<p>�����������벻ͬ�������������˵�����!</p>");
		else if(Err_id==10)
	  out.println("<p>����ĳ��Ȳ��ܴ���12���ַ�,С��6���ַ�!</p>"); 
	else if(Err_id==11)
	  out.println("<p>E-Mail����Ϊ�գ����������E_MAIL��ַ!</p>");
	else if(Err_id==12)
	  out.println("<p>�û����к��зǷ��ַ�!</p>");
	else if(Err_id==13)
	  out.println("<p>E_Mail��ַ���벻�Ϸ���������!</p>");
		else if(Err_id==14)
	  out.println("<p>���Ȩ�޲���������ϵͳ��Ա��ϵͳ!</p>");
	else if(Err_id==15)
	  out.println("<p>��̳���Ʋ���Ϊ��!</p>");
		else if(Err_id==16)
	  out.println("<p>���û������ڣ����ܳ�Ϊ������ע����û�!</p>");
		else if(Err_id==17)
	  out.println("<p>��������֮�У�������Ŀ�Դ�!</p>");
  }
%>

</td>
</tr>
<tr>
<td colspan="2" align="center" valign="top">
<input type="button" name="ok" value="��ȷ ����" onclick=javascript:history.go(-1)>
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</td>
</tr>
</table>

</body>
</html>

<html><script language="JavaScript"></script></html>