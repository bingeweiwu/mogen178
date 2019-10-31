<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>
	
	<head>
		
	</head>

	<body>

		<jsp:include page="manager2.jsp"/>

		<!-- Start of Search Wrapper -->
		<!-- End of Search Wrapper -->

		<!-- Start of Page Container -->
		<br>
		<br>
 <!--<form action="userManager?operator=add"  method="post" name="stuForm1"  >  
--><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
<!--         <td width="15" height="30"><img src="images/huilan.gif" width="15" height="30" /></td> -->
        <td width="1001" background="images/huilan.gif"><img src="images/huilan.gif" width="16" height="16" /> <span class="STYLE4"> 修改用户</span></td>
        <td width="381" background="images/huilan.gif"></td>
<!--         <td width="14"><img src="images/huilan.gif" width="14" height="30" /></td> -->
      </tr>
    </table></td>
  </tr><tr>
    <td>
    <form action="userManager?operation=update" method="post" >
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="images/huilan.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3">
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c0de98">
  
          
    		<tr>
    		<td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">用户名</div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2">
            <div align="left" class="STYLE2 STYLE1">
                &nbsp;&nbsp;<input type="text" name="username" value="${user.username }">
            </div></td>           
    		</tr>
    		
    		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">真实姓名</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="realname" value="${user.realname }" >
              </div>
             </td>          
    		</tr>
    		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">性别</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="sex" value="${user.sex}" >
              </div>
             </td>          
    		</tr>
    		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">电话</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="telephone" value="${user.telephone}" >
              </div>
             </td>          
    		</tr>
    		
    		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">密码</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="password" name="password" value="${user.password}" >
              </div>
             </td>          
    		</tr>
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">角色</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="role" value="${user.role}" >
              </div>
             </td>          
    		</tr>
		
    		<tr>
    		 <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">id</div></td>
             <td height="18" bgcolor="#FFFFFF" class="STYLE2">
              <div align="left" class="STYLE2 STYLE1">
                 &nbsp;&nbsp;<input type="text" name="id" value="${user.id}" >
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
        </form>
        
        </td>
        <td width="9" background="images/huilan.gif">&nbsp;</td>
      </tr>
    </table>
    </td>
   
  </tr>
  <tr>
    <td >
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
<!--         <td width="15" height="29"><img src="images/huilan.gif" width="15" height="29" /></td> -->
        <td background="images/huilan.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<!--           <tr> -->
<!--             <td width="25%" height="29" nowrap="nowrap"></td> -->
<!--             <td width="75%" valign="top" class="STYLE1"><div align="right"> -->
<!--               <table width="352" height="20" border="0" cellpadding="0" cellspacing="0"> -->
<!--                 <tr> -->
<!--                   <td width="62" height="22" valign="middle"></td> -->
<!--                   <td width="50" height="22" valign="middle"></td> -->
<!--                   <td width="54" height="22" valign="middle"></td> -->
<!--                   <td width="49" height="22" valign="middle"></td> -->
                  
<!--                 </tr> -->
              </table>
            </div></td>
          </tr>
        </table></td>
<!--         <td width="14"><img src="images/huilan.gif" width="14" height="29" /></td> -->
      </tr>
    </table></td>
  </tr>
</table>

		<!-- End of Page Container -->

	
	</body>
</html>

