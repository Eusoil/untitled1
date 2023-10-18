<%@ page import="xju.dao.SelectDao" %>
<%@ page import="java.util.List" %>
<%@ page import="xju.pojo.Xinxi" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="zh-cn">

<title>简单留言本</title>

<style>
body,td,th {
	/*文字大小*/
	font-size: 12px;
	/*文字颜色*/
	color: #2E2E2E;
	/*文字行距*/
	line-height: 20px;
}

a:link {
	color: #2E2E2E;
	text-decoration: none;
}

a:visited {
	text-decoration: none;
	color: #2E2E2E;
}

a:hover {
	color: #FF6600;
}

.Blank {
	padding-top:150px;
}
</style>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0"><br>
<script language="javascript">
<!--
//**********添加留言调用**********
function Add(the){
	//判断昵称如果为空自动输入“网友”
	if(the.Books_Name.value==""){
		the.Books_Name.value="网友";
	}
	//判断昵称不能为以下特殊符号
	tChk = /^[^ \s~!@#$%\^\&\*\(\)_\+|\-\=\/\?:;'"\[\{\]\}`\.>,<\\]+$/;
	if(!tChk.exec(the.Books_Name.value)){
		alert("请输入正确的昵称！\n\n昵称必须在1-10位之间，且不得含有特殊符号！");
		the.Books_Name.focus();
		return false;
	}
	//判断昵称不能大于5个汉字
	if(the.Books_Name.value.length>10){
		alert("昵称不能大于5个汉字！");
		the.Books_Name.focus();
		return false;
	}
	//判断QQ不能小于5
	if(the.Books_Qq.value.length<5){
		alert("QQ号码位数不正确！");
		the.Books_Qq.focus();
		return false;
	}
	//判断QQ只能为数字
	if(isNaN(the.Books_Qq.value)){
		alert("QQ号码只能是数字！");
		return  false;		
	 }
	//判断EMAIL
	tChk = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	if(!tChk.exec(the.Books_Mail.value)){
		alert("请输入正确的E-Mail！");
		the.Books_Mail.focus();
		return false;
	}
	//判断留言内容不能小于10
	if(the.Books_Info.value.length<10){
		alert("留言内容太少了！");
		the.Books_Info.focus();
		return false;
	}
}

//**********登陆后台调用**********
function Login(the){
	//判断管理员不能为空
	if(the.Admin_User.value==""){
		alert("管理员用户名不能为空！");
		the.Admin_User.focus();
		return false;
	}
	//判断管理员密码不能为空
	if(the.Admin_Pass.value==""){
		alert("管理员密码不能为空！");
		the.Admin_Pass.focus();
		return false;
	}
}

//**********修改管理员调用**********
function Modify_admin(the){
	//判断管理员不能为空
	if(the.Admin_User.value==""){
		alert("管理员用户名不能为空！");
		the.Admin_User.focus();
		return false;
	}
	//判断管理员旧密码不能为空
	if(the.Admin_Gps.value==""){
		alert("管理员旧密码不能为空！");
		the.Admin_Gps.focus();
		return false;
	}
	//判断管理员新密码不能为空
	if(the.Admin_Nps.value==""){
		alert("管理员新密码不能为空！");
		the.Admin_Nps.focus();
		return false;
	}
	//判断管理员新密码不能小于6个字符
	if(the.Admin_Nps.value.length<6){
		alert("管理员新密码不能小于6个字符！");
		the.Admin_Nps.focus();
		return false;
	}
	//判断管理员确认密码不能为空
	if(the.Admin_Pass.value==""){
		alert("管理员确认密码不能为空！");
		the.Admin_Pass.focus();
		return false;
	}

	//判断管理员两次新密码必须相等
	if(the.Admin_Nps.value!=the.Admin_Pass.value){
		alert("两次新密码不一致！");
		the.Admin_Nps.focus();
		return false;
	}
}

//**********删除留言**********
function Del()
{
if(confirm("确定是否删除，删除将无法恢复！"))
	return true;
else
	return false;

}

//**********显示隐藏留言**********
function ly()
{
	if(document.all.Ly.style.display=='none') {
		document.all.Ly.style.display='block';
	} else {
		document.all.Ly.style.display='none';
	}
}
-->
</script>

<table border="0" cellpadding="3" cellspacing="1" style="border-collapse: collapse" width="778" bgcolor="#78B8F1" align="center">
	<tbody><tr>
		<td bgcolor="#FFFFFF">
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
				<tbody><tr>
					<td height="25" style="padding-left:10px;">· 留言列表 ·</td>
					<td align="right" style="padding-right:13px;"><a style="color:#FF0000;cursor:hand" onclick="ly()">发布留言</a>&nbsp;&nbsp;<a href="#" style="color:black">管理员登录</a>
					</td>
				</tr>
			</tbody></table>
		</td>
	</tr>
</tbody></table>
<table border="0" cellpadding="3" cellspacing="1" style="border-collapse: collapse; display: none; " width="778" bgcolor="#78B8F1" align="center" id="Ly">
	<tbody><tr>
		<td bgcolor="#FFFFFF" style="padding-left:10px;">· 写留言 ·</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF">
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
				<form method="post" action="AddMessageServlet" onsubmit="return Add(this);">
					<tbody><tr>
						<td width="80" align="center">昵称：</td>
						<td width="180"><input name="Books_Name" type="text"><font color="red"> *</font></td>
						<td width="48" align="center">内容：</td>
						<td rowspan="4"><textarea name="Books_Info" rows="8" cols="60"></textarea><font color="red"> *</font></td>
					</tr>
					<tr>
						<td align="center">Q&nbsp; Q：</td>
						<td><input name="Books_Qq" type="text"><font color="red"> *</font></td>
						<td></td>
					</tr>
					<tr>
						<td align="center">邮箱：</td>
						<td><input name="Books_Mail" type="text"><font color="red"> *</font></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3" align="center"><input type="submit" value=" 添加留言 ">&nbsp;&nbsp;<input type="reset" value=" 重新留言 "></td>
					</tr>
				
			</tbody></form></table>

		</td>
	</tr>
</tbody></table>
<table border="0" cellpadding="3" cellspacing="1" style="border-collapse: collapse" width="778" bgcolor="#78B8F1" align="center">
	<tbody>
	<tr>
		<td bgcolor="#FFFFFF">
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
			
				<tbody>
				<%
					SelectDao selectDao = new SelectDao();
					List<Xinxi> xinxiList = selectDao.select();
					for (Xinxi xinxi : xinxiList){
				%>
				<tr>
					<td>
						<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
							<tbody><tr>
								<td width="33" align="center"><font color="#006699" face="wingdings">1</font></td>
								<td><b><%=xinxi.getNickname()%></b>在<font color="#006699">2012-3-21 17:29:55</font>的留言：

								</td>
								<td width="40">
									<a style="cursor:hand" title="270902697@qq.com"><font color="#006699" face="wingdings">+</font></a>
									<a style="cursor:hand" title="270902697"><font color="#006699" face="wingdings">''</font></a>
								</td>
							</tr>
							</tbody></table>
						<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
							<tbody><tr onmouseover="javascript:this.bgColor=&#39;#EFEFEF&#39;;" onmouseout="javascript:this.bgColor=&#39;#FFFFFF&#39;;" bgcolor="#FFFFFF">
								<td width="33"></td>
								<td style="width:730; word-break:break-all; word-wrap:break-word;">
									<%=xinxi.getText()%><span style="color:#006699"><br><b>回复：</b><br>这是回复</span>
								</td>
							</tr>
							</tbody></table>
						<hr noshade="" size="1" color="#78B8F1">
					</td>
				</tr>
				<%
					}
				%>

				
			</tbody></table>
		</td>
	</tr>
</tbody></table>
<table border="0" cellpadding="3" style="border-collapse: collapse" width="776" align="center"><form method="get" onsubmit="document.location = &#39;http://www.fob001.cn/guestbook/index.asp?Page=&#39;+ this.page.value;return false;"></form><tbody><tr><td align="center" bgcolor="#FFFFFF">首页 上一页 <a href="http://www.fob001.cn/guestbook/index.asp?Page=2">下一页</a> <a href="http://www.fob001.cn/guestbook/index.asp?Page=10">尾页</a>  页次：1/10&nbsp;页 共有&nbsp;73&nbsp;条留言 转到&nbsp;<input tyep="text" name="page" maxlength="5" value="1" style="font-size: 12px;border: 1px solid #CCCCCC;width:23px;">&nbsp;页 <input type="submit" style="font-size: 9pt" value="GO"></td></tr></tbody></table>


</body></html>