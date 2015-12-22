<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/style.css"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.1.min.js"></script>
</head>

<body>
<div id="memjoinWrap">
	<div id="header">
    	<ul class="gnb">
        	<li><a href="${pageContext.request.contextPath}/">홈페이지 가기</a></li>
        	<li><a href="${pageContext.request.contextPath}/admin">관리자 로그인 페이지 가기</a></li>
        </ul>
    </div>
    <div id="hTop">
    	<h1 class="logo"><img src="${pageContext.request.contextPath}/resources/admin/images/logo.gif" width="141" height="50"  alt="logo"/></h1>
        <p class="tbg"><img src="${pageContext.request.contextPath}/resources/admin/images/joinTop.gif" width="1000" height="140"  alt="joinTop"/></p>
    </div>
    <div id="joinAreaBg">
    	<div class="joinArea">
        	<h2 class="title">사용자 중복</h2>
        	<div class="agreeArea">
                <p class="agtitle">귀하는 '${operator.id}' 아이디로 이미 가입이 되어있습니다.</p>
            </div>
            
            <p class="loginbtn">
            	<input name="Btn_Login" type="button" class="login_btn" value="로그인" onclick="location.href='${pageContext.request.contextPath}/admin'" />  
				<input name="Btn_Login" type="button" class="login_btn" value="비밀번호 찾기" onclick="location.href='${pageContext.request.contextPath}/admin/operatorFind'" />
			</p>
			
        </div>  
    </div>
    
    <div id="footer">
    	<p><img src="${pageContext.request.contextPath}/resources/admin/images/copyright.gif" width="811" height="47"  alt="copyright"/></p>
    </div>
</div>
</body>
</html>