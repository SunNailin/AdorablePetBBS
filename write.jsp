<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%> 
<%@include file="dbUtil.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> New Document </title>
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
function testPass(str){
    
    if(str.length < 4&&str.length>0){
	   alert("�������볤�Ȳ����Ϲ涨!");
		 form1.password.focus();
        return false;
    }
        else{
		return true;
    }
	}

// -->
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
            checkResult.innerHTML = (isValid.indexOf("true")>0) ? "<img src='pic/yes.jpg'>" : "<br><font color=red>���û����ѱ�ע�ᣬ������û�����</font>";       
			if(isValid.indexOf("true")<0){
				form1.subtn.disabled=true;
			}else{
				form1.subtn.disabled=false;
			}
        }
    }
}
</script>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <style type="text/css">
<!--
.STYLE1 {color: #FF0000}
#newuser {
	margin: 0px;
}
#pic {
	text-align: center;
	vertical-align: middle;
}
-->
  </style>
</head>

 <body background="pic/360wallpaper_dt1.jpg">
 <center>
   <div class="write" id="pic"><image src=pic/write.jpg></div>
   <div class="write" id="newuser">
    </center> 
   <table width="528" height="427" border="0" align="center" bgcolor="#00CCFF">
     <form name=form1 action="insert.jsp"> <!--��form���ŵ�table��ҳ��Ͳ�����ת-->
	 
	 
	 <tr>
        <td width="99" height="51"><div align="center">�û�����</div></td>
        <td width="419"><input type="text" name="name" onblur="checkUserName();">
		<span name="checkResult" id="checkResult"></span>
        <span class="STYLE1">***���ܺ��зǷ��ַ�</span></td>
      </tr>
      <tr>
        <td height="48" bgcolor="#CCCCCC"><div align="center">���룺</div></td>
        <td bgcolor="#CCCCCC"><input type="password" name="password"  id="pass" onblur="testPass(document.getElementById('pass').value);"/>
        <span class="STYLE1">***���Ȳ��ܴ���12С��4</span></td>
      </tr>
	  <tr>
	  <td height="48"><div align="center">ȷ�����룺</div></td>>
       <td><input type="password" name="password1">
          <span class="STYLE1">***���Ȳ��ܴ���12С��4</span></td>
      </tr>
      <tr>
        <td height="49" align="center" bgcolor="#CCCCCC" ><div align="center">�Ա�</div></td>
        <td bgcolor="#CCCCCC"><input type="radio" name="sex" value="��"checked>
        ��  <input type="radio" name="sex" value="Ů">
        Ů <span class="STYLE1">* </span></td>
      </tr>
      <tr>
        <td height="51"><div align="center">���䣺</div></td>
        <td><input type="text" name="email" onChange="checkMail('email')">
          <span class="STYLE1">***</span></td>
      </tr>
      <tr>
        <td height="46" bgcolor="#CCCCCC"><div align="center">qq��</div></td>
        <td bgcolor="#CCCCCC"><input type="text" name="qq"></td>
      </tr>
      <tr bgcolor="#FFFFFF">       
                    <td width="99" height="1" bgcolor="#00CCFF" class="tablerow">�������ڣ�</td>      
                    <td width="419" height="1" bgcolor="#00CCFF" class="tablerow">       
                      <input type="text" name="year" size="4" />    
                      ��       
                      <select name="month">    
                        <option value="">&nbsp;</option>
						<%
							for(int i=1;i<13;i++){
									out.print("<option value='"+i+"' ");
									out.print(">"+i+"</option>");
							}
						
						%>
                      </select>
                      ��       
                      <select name="day">    
                        <option value="">&nbsp;</option>
						<%
						for(int j=1;j<32;j++){
						  out.print("<option value='"+j+"' ");
						  out.print(">"+j+"</option>");
					  }
						  %>
                      </select>        </td>        
     </tr>      

      <tr>       
                          <td bgcolor="#FFFFFF"><select name=icon size=1 onChange="document.images['avatar'].src=options[selectedIndex].value;" style="BACKGROUND-COLOR: #FFFFFF; BORDER-BOTTOM: 1px double; BORDER-LEFT: 1px double; BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; COLOR: #000000">
                            <option value='./PIC1/Image0.gif' selected>Image0</option>
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
                            
                                                                                                        </select></td>
                          <td width=419 height=32 bgcolor="#FFFFFF">&nbsp;&nbsp;<img id=avatar src="./PIC1/Image0.gif" alt=����������� width="32" height="32">&nbsp;-          
                            ѡ���Լ������ͷ��</td>       
     </tr>       
<tr bgcolor="#FFFFFF">       
                    <td class="tablerow" height="0" colspan="2" width="731" bgcolor="#C6EFFF">       
                      <div align="center">       
                        <input type="submit" name="regsubmit" onclick='return CheckValue()'; value="���ע��" />   
						<input type="button" name="return" onClick="window.location.href('main.html')" value="���ص�¼����">   
                      </div>                    </td>      
       </tr> 
	</form> 
   </table>
   <center><span class="STYLE1">ע����*��Ϊ����ѡ�� </span></center>
</div>
    
 

 </body>
</html>
