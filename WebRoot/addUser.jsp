<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en-US">
	<!--<![endif]-->
	
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
</script>

<script type="text/javascript">
	function validate(field){
		if(field.value.length!=0){
			//创建XMLHttpRequest
			createXMLHttpRequest();
			var url = "ajax?id="+field.value;//去检查学号是否存在
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
		<!-- META TAGS -->
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>Knowledge Base Theme</title>

		<link rel="shortcut icon" href="images/favicon.png" />




		<!-- Style Sheet-->
		<link rel="stylesheet" href="style.css" />
		<link rel='stylesheet' id='bootstrap-css-css'
			href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
		<link rel='stylesheet' id='responsive-css-css'
			href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
		<link rel='stylesheet' id='pretty-photo-css-css'
			href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css'
			media='all' />
		<link rel='stylesheet' id='main-css-css'
			href='css/main5152.css?ver=1.0' type='text/css' media='all' />
		<link rel='stylesheet' id='custom-css-css'
			href='css/custom5152.html?ver=1.0' type='text/css' media='all' />


		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
                <script src="js/html5.js"></script></script>
                <![endif]-->

	</head>

	<body>

		<!-- Start of Header -->
		<jsp:include page="manager2.jsp"></jsp:include>
		<!-- End of Header -->

		<!-- Start of Search Wrapper -->
		<!-- End of Search Wrapper -->

		<!-- Start of Page Container -->
		<br>
		<br>
 <form action="userManager?operation=add"  method="post"  >
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="images/huilan.gif" width="15" height="30" /></td>
        <td width="1001" background="images/huilan.gif"><img src="images/huilan.gif" width="16" height="16" /> <span class="STYLE4">增加新用户</span></td>
        <td width="381" background="images/huilan.gif"></td>
        <td width="14"><img src="images/huilan.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr><tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td width="9" background="images/huilan.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3">
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c0de98">
          
          
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">账号</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="id" value="" onblur="validate(this);">
                 <div id="snodiv"></div>
              </div>
             </td>          
    		</tr>
    		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">密码</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="password" value="" >
              </div>
             </td>          
    		</tr>
    		
    		<tr>
    		<td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">用户名</div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2">
            <div align="left" class="STYLE2 STYLE1">
                &nbsp;&nbsp;<input type="text" name="username" value="">
            </div></td>           
    		</tr>
    		
    		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">真实姓名</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="realname" value="" >
              </div>
             </td>          
    		</tr>
    		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">性别</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="sex" value="" >
              </div>
             </td>          
    		</tr>
    		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">电话</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="telephone" value="" >
              </div>
             </td>          
    		</tr>
    		
    		
    		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">角色</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="role" value="" >
              </div>
             </td>          
    		</tr>
		

    		
    	    <tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
    		    <input type="reset" name="reset" value="重置"/></div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="submit" name="submit" value="提交"/>
              </div>
             </td>
    		</tr>
        </table>
        </td>
        <td width="9" background="images/huilan.gif">&nbsp;</td>
      </tr>
    </table>
    </td>
   
  </tr>
  <tr>
    <td height="29">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="29"><img src="images/huilan.gif" width="15" height="29" /></td>
        <td background="images/huilan.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%" height="29" nowrap="nowrap"></td>
            <td width="75%" valign="top" class="STYLE1"><div align="right">
              <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="62" height="22" valign="middle"></td>
                  <td width="50" height="22" valign="middle"></td>
                  <td width="54" height="22" valign="middle"></td>
                  <td width="49" height="22" valign="middle"></td>
                  
                </tr>
              </table>
            </div></td>
          </tr>
        </table></td>
        <td width="14"><img src="images/huilan.gif" width="14" height="29" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
		<!-- End of Page Container -->

		<!-- Start of Footer -->
		<!-- End of Footer -->

		<a href="#top" id="scroll-top"></a>

		<!-- script -->
		<script type='text/javascript' src='js/jquery-1.8.3.min.js'>
</script>
		<script type='text/javascript' src='js/jquery.easing.1.3.js'>
</script>
		<script type='text/javascript'
			src='js/prettyphoto/jquery.prettyPhoto.js'>
</script>
		<script type='text/javascript' src='js/jquery.liveSearch.js'>
</script>
		<script type='text/javascript' src='js/jquery.form.js'>
</script>
		<script type='text/javascript' src='js/jquery.validate.min.js'>
</script>
		<script type='text/javascript' src='js/custom.js'>
</script>

	</body>
</html>

