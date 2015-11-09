<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta name="author" content="" />
	<meta name="description" content="" />
	<meta name="keywords" content="금호폴리켐,KUMHOPOLYCHEM,금호석유화학,EPDM,TPV,KEPA" />
	<title>금호폴리켐</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/reset.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/layout.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/common.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/main.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/board.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/sub.css" />
	<script type="text/javascript" src="/resources/js/user/kor/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/resources/js/user/kor/jquery.tinyscrollbar.js"></script>
	<script type="text/javascript" src="/resources/js/user/kor/common.js"></script>
	<script type="text/javascript" src="/resources/js/user/kor/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/resources/js/common/common.js"></script>
</head>
<script>
	function goLanguage(lang) {

		setCookie('goLanguage', lang, 1);

		var tempUrl	= "";
		tempUrl = location.protocol + "//" + location.host + location.pathname + location.search;

		tempUrl = tempUrl.replace("/kor/", "/"+lang+"/");
		location.href = tempUrl;
	}

	//쿠키 생성
	function setCookie(cName, cValue, cDay){
		var expire = new Date();
		expire.setDate(expire.getDate() + cDay);
		cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
		if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
		//GMT : 그리니치 표준시
		//alert(expire.toGMTString());
		document.cookie = cookies;
	}
</script>