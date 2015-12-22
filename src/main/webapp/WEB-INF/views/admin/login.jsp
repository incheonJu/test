<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/admin/style.css" />
<link href="${pageContext.request.contextPath}/js/lib/jqueryUI/css/cupertino/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="login-wrap">
			EIP 처리자 로그인
		<div class="loginArea">
			<s:url var="authUrl" value="/admin/j_spring_security_check" />
			<form name="form1" id="loginForm" method="post" action="${authUrl}">
				<div class="inputArea">
					<div class="inputBox">
						<label for="Ls_Uid" class="lbl">아 이 디</label> <input value="testtest" type="text" name="j_username" id="id" class="intBox" onkeydown="if(event.keyCode==13) Sendit();" /> <br/>
						<label for="Ls_Pwd" class="lbl">비밀번호</label> <input value="111111" type="password" name="j_password" id="pw" class="intBox" onkeydown="if(event.keyCode==13) Sendit();" />
					</div>
				</div>
				<p class="logbtn">
					<input name="Btn_Login" type="button" id="Btn_Login"
						onclick="Sendit()" value="로그인" />
				</p>
				<br/>
				<br/> <input type="button" name="button" id="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/admin/operator/register'" />
				<input type="button" name="button" id="button" value="아이디/비밀번호 찾기" onclick="location.href='${pageContext.request.contextPath}/admin/operator/findOperator'" />
			</form>
		</div>
	</div>

	<!-- 메세지 알림 Dialog -->
	<div id="alertDialog" title="알림">
		<table class="table_search">
			<tr>
				<th height="50">
					<div id="alertMessage"></div>
				</th>
			</tr>
		</table>
	</div>

	<script
		src="${pageContext.request.contextPath}/js/lib/jquery-1.10.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/jquery-ui.js"></script>
	<script type="text/javascript" language="javascript">
		$(function() {

			$("#alertDialog").dialog({
				width : 500,
				autoOpen : false,
				modal : true,
				resizable : true,
				buttons : {
					확인 : function() {
						$("#alertDialog").dialog("close");
					}
				}
			});

			if ('${message}' != "") {
				openAlertDialog('${message}');
			}

			<c:if test="${not empty param.error}">
			if ("<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />" == "Bad credentials") {
				openAlertDialog("로그인 실패! 아이디 혹은 패스워드를 확인하세요!");
			} else {
				openAlertDialog("<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />");
			}
			</c:if>
		});

		//	로그인
		function Sendit() {
			var id = $("#id");
			var pw = $("#pw");

			if (!id.val().length > 0) {
				alert("아이디를 입력하세요.");
				id.focus();
			}
			else {
				$("#loginForm").submit();
			}
		}

		// 알림 Dialog 처리.
		function openAlertDialog(msg) {
			$("#alertMessage").empty();
			$("#alertMessage").append("<b>" + msg + "<b>");
			$("#alertDialog").dialog("open");

		}
	</script>
</body>
</html>