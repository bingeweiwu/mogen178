<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<html>
	
<!--以下是ajax的js代码 -->
<script type="text/javascript">
	var xmlHttp;
	function createXMLHttpRequest(){
		if(window.XMLHttpRequest){
			xmlHttp= new XMLHttpRequest();
		}else if(window.ActiveXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
 
	function validate(field){
		if(field.value.length!=0){
			//创建XMLHttpRequest
			createXMLHttpRequest();
			var url = "ajax?action=validate&id="+field.value;//去检查学号是否存在
			xmlHttp.open("GET",url,true);
			xmlHttp.onreadystatechange=callback;//callback是一个函数地址,回调
			xmlHttp.send(null);
		}else{
			document.getElementById("snodiv").innerHTML="";
		}
	}
</script>

<script type="text/javascript">
	function callback(){
		if(xmlHttp.readyState==4){
			if(xmlHttp.status==200){
				document.getElementById("snodiv").innerHTML="<font color='red'>"
				+xmlHttp.responseText+"</font>";
			}else{
				alert("账号必须全为数字,status="+xmlHttp.status);
			}
		}
	}
</script>
	
	<head>
		
	</head>

	<body>

		
<center>
	  	<form action="userManager?operation=register" method="post">
	  		<table border="1" width="400">
		  	<h2>用户注册&nbsp;&nbsp;<a href="login.jsp">登录</a></h2>
		  	
			<tr height="30"><td align="center">账&nbsp;&nbsp;&nbsp;号：<input type="text" name="id" onblur="validate(this);" />
			<div id="snodiv"></div></td></tr>
			<tr height="30"><td align="center">密     码：<input type="password" name="pwd1" ></td></tr>
			<tr height="30"><td align="center">确     认：<input type="password" name="pwd2" ></td></tr>
			<tr height="30">
				<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				性别：	
					<input name="role" type="radio" value="man"/>男 
					<input name="role" type="radio" value="woman"/>女 
				</td>
			</tr>
			
			<tr height="30"><td align="center">	
					<input type="image" src="images/zhuce.gif" width="81" height="31"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="image" src="images/reset.gif" onClick="reset" width="81" height="31"/>
					</td>
			</tr>

		  	<tr height="30"><td><a href="index-2.jsp">官网详情</a></td></tr>
		  </table>
	  	</form>
	  	
  	</center>
	</body>
</html>

