<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@ include file="dbUtil.jsp"%>
<%@ page import="java.util.*"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 用户信息查看或修改</title>
<SCRIPT LANGUAGE="JavaScript">
<!-- 
function CheckValue()//检查标题内容是否为空值
{
 var name=document.all.name.value;
  var re=/( )/gi
  name=name.replace(re,"")
  re=/\</gi
  name=name.replace(re,"&lt;")
  if(name==""||name.length<1)
  {
    alert("用户名不能为空");
    document.all.name.focus();
    return false;
  }
  document.all.name.value=name;
  TheText=document.all.email.value;
  var re=/( )/gi
  TheText=TheText.replace(re,"")
  if(TheText=="")
  {
        alert("E_Mail地址不能为空");
    document.all.email.focus();
    return false;
  }

  if(form1.password.value!=form1.password1.value)
	  {
	  alert("两次输入密码不相同,请重新输入!");
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
alert("邮箱格式错误!"); 
document.all(str).focus();
} 
}
// -->
function testPass(){
    
    if(form1.password.value.length < 4)
	{
		if(form1.password.value.length>0)
		{
	     alert("您的密码长度不符合规定!");
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
.STYLE1 {color: #FF0000}
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
	String visits=rs.getString("visits");
 %>
 <body>
 <center>
   <h1>用户信息查看或修改</h1>

 <span class="STYLE1">带*的为必填选项 </span></center>
 
   <table width="528" height="427" border="0" align="center" bgcolor="#00CCFF">
     <form name=form1 action="updateuser.jsp"> <!--将form表单放到table中页面就不会跳转-->
	 
	 
	 <tr>
        <td width="99" height="51"><div align="center">用户名：</div></td>
        <td width="419"><input type="text" name="name" value="<%=rs.getString("username")%>"  readonly>
		<span name="checkResult" id="checkResult"></span>
        <span class="STYLE1">*只读无法修改</span></td>
      </tr>
      <tr>
        <td height="48" bgcolor="#CCCCCC"><div align="center">密码：</div></td>
        <td bgcolor="#CCCCCC"><input type="text" name="password" value="<%=password%>" onChange="testPass()"/>
        <span class="STYLE1">*   密码长度必须大于4小于12</span></td>
      </tr>
      <tr>
        <td height="49" align="center" bgcolor="#CCCCCC" ><div align="center">性别：</div></td>
		<%
			String check_male="";
			String check_female="";
			if(rs.getString("sex").equals("男")){
				check_male="checked";
			}else{
				check_female="checked";
			}
	 
	 %>
        <td bgcolor="#CCCCCC"><input type="radio" name="sex" value="男" <%=check_male%>>
        男  <input type="radio" name="sex" value="女" <%=check_female%>>
        女 <span class="STYLE1">* </span></td>
      </tr>
      <tr>
        <td height="51"><div align="center">邮箱：</div></td>
        <td><input type="text" name="email" onChange="checkMail('email')" value="<%=rs.getString("email")%>">
          <span class="STYLE1">*</span></td>
      </tr>
      <tr>
        <td height="46" bgcolor="#CCCCCC"><div align="center">qq：</div></td>
        <td bgcolor="#CCCCCC"><input type="text" name="qq" value="<%=rs.getString("qq")%>"></td>
      </tr>
      <tr bgcolor="#FFFFFF">       
                    <td width="99" height="1" bgcolor="#00CCFF" class="tablerow">出生日期：</td>      
        <td width="419" height="1" bgcolor="#00CCFF" class="tablerow"><input type="text" name="birthday" value="<%=birthday%>"></td>        
     </tr>      

      <tr>       
                          <td bgcolor="#FFFFFF">       
                            <select name=icon size=1 onChange="document.images['avatar'].src=options[selectedIndex].value;" style="BACKGROUND-COLOR: #FFFFFF; BORDER-BOTTOM: 1px double; BORDER-LEFT: 1px double; BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; COLOR: #000000"> 
							<option value='<%=head%>'>Image1</option>
                              <option value='./PIC1/Image1.gif'>Image1</option>
                              <option value='./PIC1/Image2.gif'>Image2</option>
                              <option value='./PIC1/Image3.gif'>Image3</option>
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
                          <td width=419 height=32 bgcolor="#FFFFFF">&nbsp;&nbsp;<img id=avatar src="./PIC1/Image1.gif" alt=个人形象代表 width="32" height="32">&nbsp;-          
                            选择自己满意的头像</td>       
     </tr>       

      <tr>
        <td height="59" bgcolor="#00CCFF"><div align="center">注册日期：</div></td>
        <td bgcolor="#00CCFF"><input type="text" name="regdate" value="<%=regdate%>" readonly><span class="STYLE1">只读无法修改 </span></td>
      </tr>
	  		<tr>
        <td height="59" bgcolor="#CCCCCC"><div align="center">访问次数</div></td>
		<td bgcolor="#CCCCCC"><input type="text" name="visits" value="<%=visits%>" readonly><span class="STYLE1">只读无法修改 </span></td>
		</tr>

<tr bgcolor="#FFFFFF">       
                    <td class="tablerow" height="0" colspan="2" width="731" bgcolor="#C6EFFF">       
                      <div align="center"> 
                        <input type="submit" name="regsubmit" onclick='return CheckValue()'; value="确认修改" />      
                        <input type="button" name="back"  value="放弃修改并返回上一级" onclick="window.location.href('user_manage.jsp')"/>      
                      </div>      
                    </td>      
                 </tr> 
	</form> 
   </table>
    
<% }%>

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
            checkResult.innerHTML = (isValid.indexOf("true")>0) ? "<img src='images/yes.jpg'>" : "<br><font color=red>此用户名已存在，请重新选择用户名！</font>";       
			if(isValid.indexOf("true")<0){
				form1.subtn.disabled=true;
			}else{
				form1.subtn.disabled=false;
			}
        }
    }
}
</script>