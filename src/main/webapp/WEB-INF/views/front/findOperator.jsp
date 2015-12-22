<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/front/style.css" />
</head>

<body>
<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}" >
	<div id="loginWrap">
		<div id="header">
			<ul class="gnb">
				<li><a href="${pageContext.request.contextPath}/">홈페이지 가기</a></li>
			</ul>
		</div>

		<div id="loginAreaBg">
			<div class="loginArea">
				<br/>
				<div class="loginBx">
					<div class="loginboxarea">
						<p class="title">
							아이디 찾기
						</p>
						<div class="inputArea">
							<div class="inputBox">
								<label for="memberName" class="lbl">이름</label> <input type="text" name="memberName" id="memberName" class="intBox" />
								
							</div>
							<div class="inputBox">
								<label for="email" class="lbl">이메일</label> <input type="text" name="email" id="email" class="intBox" />
							</div>
							<div class="inputBox">
							</div>
						</div>
						
						<p class="loginbtn">
							<input name="Btn_Login" type="button" class="login_btn" value="아이디 찾기" onclick="fnFindId()" />
						</p>
					</div>
					<div class="loginboxarea nomargin">
						<p class="title">
							비밀번호 찾기
						</p>
						<div class="inputArea">
							<div class="inputBox">
								<label for="Ls_name" class="lbl">아이디</label> <input type="text" name="Ls_Uid" id="Ls_Uid" class="intBox" />
							</div>
							<div class="inputBox">
								<label for="Ls_name" class="lbl">이름</label> <input type="text" name="Ls_Uid" id="Ls_Uid" class="intBox" />
							</div>
							<div class="inputBox">
								<label for="Ls_name" class="lbl">이메일</label> <input type="text" name="Ls_Uid" id="Ls_Uid" class="intBox" />
							</div>
						</div>
						<p class="loginbtn">
							<input name="Btn_Login" type="button" class="login_btn" value="비밀번호 찾기" onclick="openPWCBAWindow()" />
						</p>
					</div>

				</div>
				<div class="memjoinBtn">
					<p class="joinbtn">
						<input name="Btn_Login" type="button" class="join_btn" value="회원가입하기" onclick="location.href='${pageContext.request.contextPath}/front/member/register'" />
					</p>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>

<script src="${pageContext.request.contextPath}/js/lib/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/ServerAPICall.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/serializeObjectJSON.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/json2.js"></script>
<script>
var contextPath = $("#contextPath").val();
//아이디 검사
function fnFindId() {
	
	var memberName = $("#memberName").val();
	var email = $("#email").val();
	
	if (!memberName.length > 0) {
		openAlertDialog('이름을 입력하세요.');
		return;
	} else if (!email.length > 0) {
		openAlertDialog('이메일을 입력하세요.');
		return;
	} else {
		var url = contextPath + "/front/findId";
		
		var data = '{"memberName":"' + memberName + '","email":"' + email + '"}';
		var returnData = serverAPICall("POST", url, data);

		if (returnData.result == true) {
			openAlertDialog("등록 성공");
		} else {
			openAlertDialog("등록 실패");
		}
	}

	return result;
}
</script>

<%@include file="../common/alertDialog.jsp"%>