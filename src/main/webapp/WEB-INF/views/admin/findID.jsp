<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/style.css" />

</head>

<body>
	<div id="loginWrap">
		<div id="header">
			<ul class="gnb">
				<li><a href="${pageContext.request.contextPath}/">홈페이지 가기</a></li>
				<li><a href="${pageContext.request.contextPath}/admin">관리자 로그인 페이지 가기</a></li>
			</ul>
		</div>
		<div id="hTop">
			<h1 class="logo">
				<img src="${pageContext.request.contextPath}/resources/admin/images/logo.gif" width="141" height="50"  alt="logo"/>
			</h1>
			<p class="tbg">
				<img src="${pageContext.request.contextPath}/resources/admin/images/loginTop.gif" width="1000" height="140"  alt="loginTop"/>
			</p>
		</div>
		<div id="loginAreaBg">
			<div class="loginArea">
				<br/>
				<div class="loginBx">
					<div class="loginboxarea">
						<p class="title">
							<img src="${pageContext.request.contextPath}/resources/admin/images/id_title.gif" width="320" height="130" alt="아이디 찾기" />
						</p>
						<div class="textArea">
							<c:if test="${not empty operator}">
								회원님의 ID는 <b>'${operator.id}'</b> 입니다.<br/>
								비밀번호를 찾으시려면, 하단의 비밀번호 찾기 버튼을 클릭해주세요.
							</c:if>
							<c:if test="${empty operator}">
								가입 이력이 없습니다.<br/>
								하단의 회원 가입하기 버튼을 이용하여 가입 후 이용해주세요.
							</c:if>
						</div>
						<p class="loginbtn">
							<input name="Btn_Login" type="button" class="login_btn" value="비밀번호 찾기" onclick="location.href='${pageContext.request.contextPath}/admin/findOperator'" />
						</p>
					</div>
				</div>
				<div class="memjoinBtn">
					<p class="joinbtn">
						<input name="Btn_Login" type="button" class="join_btn" value="회원가입하기" onclick="location.href='${pageContext.request.contextPath}/admin/auth'" />
					</p>
				</div>
			</div>
		</div>

		<div id="footer">
			<p>
				<img src="${pageContext.request.contextPath}/resources/admin/images/copyright.gif" width="811" height="47"  alt="copyright"/>
			</p>
		</div>
	</div>
</body>
</html>