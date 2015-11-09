<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="News-Type" news="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/resources/css/admin/admin_default.css" />
<script type="text/javascript" src="/resources/js/common/common.js"></script>
<script type="text/javascript" src="/resources/js/common/jquery-1.8.3.min.js"></script>
<style type="text/css">
	.pgLogin { background-color:#ffffff; }
	.pgLogin .logBox { padding-top:50px; margin:0 auto; width:600px; }
	.pgLogin .logBox .tit { padding-bottom:30px; margin-bottom:80px; border-bottom:2px solid #cccccc; }
	.pgLogin .logBox .logTxt { float:left; width:30%; text-align:center; }
	.pgLogin .logBox .logForm { position:relative; float:left; width:70%; }
	.pgLogin .logBox .logForm li { margin-bottom:2px; }
	.pgLogin .logBox .logForm input.put { width:200px; height:22px; text-indent:10px; line-height:22px; border-radius:2px; border:1px solid #c6c9cc; }
	.pgLogin .logBox .logForm input.put:focus { border-color:#1985c7; outline:none; }
	.pgLogin .logBox .logForm .btn { position:absolute; top:0; left:280px; }
	.pgLogin .logBox .logForm {}
	.pgLogin .footer { position:absolute; bottom:20px; left:50%; margin-left:-300px; text-align:center; width:600px; font-size:11px; color:#999999; }
</style>
</head>
<body class="pgLogin">
	<div class="logBox">
		<div class="tit">
			<h1>
				금호폴리켐관리자
			</h1>
		</div>
		<div class="logTxt">
			<img src="/resources/image/admin/login/txt_admin.gif" alt="" />
		</div>
		<div class="logForm">
			<form id="frmEdit" name="frmEdit" action="/admin/j_spring_security_check" method="post">
				<ul class="set"> 
					<li style="float:left; width:60px;">이메일</li>
					<li>
						<input class="put" type="text" title="이메일" name="j_username" value=""/>
					</li>
					<li style="clear:both;float:left; width:60px;">비밀번호</li>
					<li>
						<input class="put" type="password" title="비밀번호" name="j_password" value="" />
					</li>
				</ul>
				<div class="btn">
					<input type="image" src="/resources/image/admin/login/btn_login.gif" style="height:50px;" alt="로그인" title="로그인" />
				</div>
			</form>
		</div>
		<div style="float:left;padding-left:33px;padding-top: 10px;color: #666666;">
			<b><br/>아이디는 기존의 개인 이메일을 사용하시면 됩니다.<br/>
			더 궁금하시거나 문의하실 사항이 있으면 전략기획팀<span style="color:#d02626;">(내선번호 : 3764)</span>으로 문의하시기 바랍니다.</b>
		</div>
	</div>
	<div class="footer">
		Copyright 2015 KNCI. All rights reserved.
	</div>
<script type="text/javascript">
$(document).ready(function(){
	var f = document.frmEdit;
	
	f.j_username.focus();
	
	if ("${message}" != ""){
		if("${message}" == "Bad credentials"){
			alert("로그인 실패! 아이디 혹은 패스워드를 확인하세요!");
		} else {
			alert("${message}");
		}
		<% request.getSession().setAttribute("message", ""); %>
	}
	
	$("#frmEdit").bind("submit", function(){
		if(!common.commonModule.isCheck(f.j_username, "메일주소를 입력하십시오.", "")) { return false; }
		if(!common.commonModule.isCheck(f.j_password, "비밀번호를 입력하십시오.", "")) { return false; }
		return true;
	});
});
</script>	
</body>
</html>