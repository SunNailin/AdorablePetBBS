
<%@page contentType="text/html;charset=gb2312"%>
<%@ include file="usercentertop.jsp"%>
<%@ page import="java.util.*"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> ���������޸�</title>
<SCRIPT LANGUAGE="JavaScript">
<!-- 
function CheckValue()//�����������Ƿ�Ϊ��ֵ
{
 var name=document.all.name.value;
  var re=/( )/gi
  name=name.replace(re,"")
  re=/\</gi
  name=name.replace(re,"&lt;")
  if(name==""||name.length<1)
  {
    alert("�û�������Ϊ��");
    document.all.name.focus();
    return false;
  }
  document.all.name.value=name;
  TheText=document.all.email.value;
  var re=/( )/gi
  TheText=TheText.replace(re,"")
  if(TheText=="")
  {
        alert("E_Mail��ַ����Ϊ��");
    document.all.email.focus();
    return false;
  }

  if(form1.password.value!=form1.password1.value)
	  {
	  alert("�����������벻��ͬ,����������!");
		 form1.password.focus();
	  return false;
  }
  return true;
}
function checkMail(str){ 
var strReg=""; 
var r; 
var strText=document.all(str).value; 
//strReg=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/i;
strReg=/^\w+((-\w+)|(\.\w+))*\@{1}\w+\.{1}\w{2,4}(\.{0,1}\w{2}){0,1}/ig;
r=strText.search(strReg); 
if(r==-1) { 
alert("�����ʽ����!"); 
document.all(str).focus();
} 
}
// -->
function testPass(){
    
    if(form1.password.value.length < 4)
	{
		if(form1.password.value.length>0)
		{
	     alert("�������볤�Ȳ����Ϲ涨!");
		 form1.password.focus();
		 return false
		}
	}
	return true;
}
</SCRIPT>

  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <style type="text/css">
<!--
.STYLE1 {color: #FFffcc}
-->
  </style>
</head>
<%
 String id=request.getParameter("id");
 String sql="select * from users where userid="+id;
 session.putValue("id", id);
 ResultSet rs=st.executeQuery(sql);
 if(rs.next()){
	String password=rs.getString("password");
	String regdate=rs.getDate("regdate").toString();
	String head=rs.getString("head");
    String birthday=rs.getString("birthday");	
 %>
 <body background="360wallpaper_dt1.jpg">
 <center><span class="STYLE1">��*��Ϊ����ѡ�� </span></center>
 
   <table width="528" height="427" border="0" align="center" bgcolor="#FFFFCC">
     <form name=form1 action="modifySave.jsp"> <!--��form���ŵ�table��ҳ��Ͳ�����ת-->
	 
	 
	 <tr>
        <td width="99" height="51"><div align="center">�û�����</div></td>
        <td width="419"><input type="text" name="name" value="<%=rs.getString("username")%>" onblur="checkUserName();" readonly>
		<span name="checkResult" id="checkResult"></span>
        <span class="STYLE1">�����޸�</span></td>
      </tr>
      <tr>
        <td height="48" bgcolor="#FFFFCC"><div align="center">���룺</div></td>
        <td bgcolor="#FFFFCC"><input type="password" name="password" value="<%=password%>" onChange="testPass()"/>
        <span class="STYLE1">*���볤�ȱ������4С��12</span></td>
      </tr>
	  <tr>
	  <td height="48"><div align="center">ȷ�����룺</div></td>>
       <td><input type="password" name="password1" value="<%=password%>">
          <span class="STYLE1">*���볤�ȱ������4С��12</span></td>
      </tr>
      <tr>
        <td height="49" align="center" bgcolor="#FFFFCC" ><div align="center">�Ա�</div></td>
		<%
			String check_male="";
			String check_female="";
			if(rs.getString("sex").equals("��")){
				check_male="checked";
			}else{
				check_female="checked";
			}
	 
	 %>
        <td bgcolor="#FFFFCC"><input type="radio" name="sex" value="��" <%=check_male%>>
        ��  <input type="radio" name="sex" value="Ů" <%=check_female%>>
        Ů <span class="STYLE1">* </span></td>
      </tr>
      <tr>
        <td height="51"><div align="center">���䣺</div></td>
        <td><input type="text" name="email" onChange="checkMail('email')" value="<%=rs.getString("email")%>">
          <span class="STYLE1">*</span></td>
      </tr>
      <tr>
        <td height="46" bgcolor="#FFFFCC"><div align="center">qq��</div></td>
        <td bgcolor="#FFFFCC"><input type="text" name="qq" value="<%=rs.getString("qq")%>"></td>
      </tr>
      <tr bgcolor="#FFFFCC">       
                    <td width="99" height="1" bgcolor="#FFFFCC" class="tablerow">�������ڣ�</td>      
        <td width="419" height="1" bgcolor="#FFFFCC" class="tablerow"><input type="text" name="birthday" value="<%=birthday%>"></td>        
     </tr>      

      <tr>       
                          <td bgcolor="#FFFFCC">       
                            <select name=icon size=1 onChange="document.images['avatar'].src=options[selectedIndex].value;" style="BACKGROUND-COLOR: #FFFFFF; BORDER-BOTTOM: 1px double; BORDER-LEFT: 1px double; BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; COLOR: #000000"> 
							<option value='<%=head%>'>now</option>
                              <option value='./PIC1/Image1.gif'>Image1</option>
                              <option value='./PIC1/Image2.gif'>Image2</option>
                              <option value='./PIC1/Image3.gif'>Image3</option>
                              <option value='./PIC1/Image4.gif'>Image4</option>
                              <option value='./PIC1/Image5.gif'>Image5</option>
                              <option value='./PIC1/Image6.gif'>Image6</option>
                              <option value='./PIC1/Image7.gif'>Image7</option>
                              <option value='./PIC1/Image8.gif'>Image8</option>
                              <option value='./PIC1/Image9.gif'>Image9</option>
                              <option value='./PIC1/Image10.gif'>Image10</option>
                              <option value='./PIC1/Image11.gif'>Image11</option>
                              <option value='./PIC1/Image12.gif'>Image12</option>
                              
                            </select>        </td>
                          <td width=419 height=32 bgcolor="#FFFFCC">&nbsp;&nbsp;<img id=avatar src="./PIC1/Image1.gif" alt=����������� width="32" height="32">&nbsp;-          
                            ѡ���Լ������ͷ��</td>       
     </tr>       

      <tr>
        <td height="59" bgcolor="#FFFFCC"><div align="center">ע�����ڣ�</div></td>
        <td bgcolor="#FFFFCC"><input type="text" name="regdate" value="<%=regdate%>" readonly>        <span class="STYLE1">�����޸�</span></td>
</td>
      </tr>
<tr bgcolor="#FFFFCC">       
                    <td class="tablerow" height="0" colspan="2" width="731" bgcolor="#FFFFCC">       
                      <div align="center"> 
                        <input type="submit" name="regsubmit" onclick='return CheckValue()'; value="ȷ���޸�" />      
                      </div>      
                    </td>      
                 </tr> 
	</form> 
   </table>
    
<% }
%>

 </body>
</html>
</SCRIPT>
<script type="text/javascript">
var xmlHttp;
function createXMLHttpRequest(){
    if(window.ActiveXObject){
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if(window.XMLHttpRequest){
        xmlHttp = new XMLHttpRequest();
    }
}

  function checkUserName(){
     var UserName =form1.name.value;// document.getElementById("username");
     if (UserName == "")   return;
    createXMLHttpRequest();
    var url = "check_user.jsp?name=" +UserName;
    xmlHttp.open("GET",url,true);
	xmlHttp.send();
    xmlHttp.onreadystatechange = handleStateChange;
    
}

function handleStateChange(){
    if(xmlHttp.readyState == 4){
        if(xmlHttp.status == 200){
            var isValid = xmlHttp.responseText;
            var checkResult = document.getElementById("checkResult");
            checkResult.innerHTML = (isValid.indexOf("true")>0) ? "<img src='images/yes.jpg'>" : "<br><font color=red>���û����Ѵ��ڣ�������ѡ���û�����</font>";       
			if(isValid.indexOf("true")<0){
				form1.subtn.disabled=true;
			}else{
				form1.subtn.disabled=false;
			}
        }
    }
}
</script>