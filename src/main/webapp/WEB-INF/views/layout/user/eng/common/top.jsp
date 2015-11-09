<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta http-equiv="News-Type" news="text/html; charset=utf-8" />
<meta http-equiv="News-Script-Type" news="text/javascript" />
<meta http-equiv="News-Style-Type" news="text/css" />
<meta name="author" news="" />
<meta name="description" news="" />
<meta name="keywords" news="" />
<meta http-equiv="X-UA-Compatible" news="IE=9" />
<title>KUMHO MITSUI CHEMICALS</title>
<link rel="stylesheet" type="text/css" href="/resources/eng/css/sub.css" />
<script type="text/javascript" src="/resources/eng/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/eng/js/jquery.tinyscrollbar.js"></script>
<script type="text/javascript" src="/resources/eng/js/common.js"></script>
<script type="text/javascript" src="/resources/js/common/common.js"></script>
<script type="text/javascript" src="/resources/js/common/ajax-user.js"></script>
<script type="text/javascript">
window.onload = function(){
	// gnb 현재 활성화 메뉴 표시
	var arrURL = location.pathname.split("/");
	var depth01 = 0;
	var depth02 = 1;
	var depth03 = "";
	switch(arrURL[2]){
		case "recruit":
			depth01 = "2";
			if(arrURL[3] == "talented"){
				depth02 = "0";
			} else {
				depth02 = "1";
			}
		break;
		case "news":
			depth01 = "3";
			depth02 = "0";
		break;
		case "inquiry":
			depth01 = "3";
			depth02 = "1";
		break;
		case "store":
			depth01 = "3";
			depth02 = "2";
		break;
		case "management":
			depth01 = "4";
			switch(arrURL[3]){
				case "ethic":
					depth02 = "0";
				break;
				case "quality":
					depth02 = "1";
				break;
				case "env":
					depth02 = "2";
				break;
				case "social":
					depth02 = "3";
				break;
			}
		break;
		case "intro":
			depth01 = "0";
			switch(arrURL[3]){
				case "overview":
					depth02 = "0";
					break;
				case "greeting":
					depth02 = "1";
					break;
				case "vision":
					depth02 = "2";
					break;
				case "ci":
					depth02 = "3";
					break;
				case "history":
					depth02 = "4";
					break;
				case "partners":
					depth02 = "5";
					break;
				case "workplace":
					depth02 = "6";
					break;
			}
		break;
		case "product":
			depth01 = "1";
			switch(arrURL[3]){
			case "ORI400":
				depth02 = "0";
				break;
			case "ORI300":
				depth02 = "2";
				break;
			case "ORI200":
				depth02 = "1";
				break;
			case "ORI100":
				depth02 = "3";
				break;
			case "ORI500":
				depth02 = "4";
				depth03 = "0";
				break;
			case "pc":
				depth02 = "4";
				if(arrURL[4] == "4"){
					depth03 = "1";
				} else {
					depth03 = "2";	
				}
				break;
			}
		break;
		case "progress":
			depth01 = "1";
			depth02 = "5";
		break;
		
		case "workplace":
			depth01 = "1";
			depth02 = "6";
			break;
			
		case "pu":
			depth01 = "1";
			depth02 = "6";
			depth03 = "0";
		break;
		
		case "ts":
			depth01 = "1";
			depth02 = "6";
			depth03 = "1";
		break;
		case "handle":
			depth01 = "1";
			depth02 = "7";
		break;
	}
	
	if(depth03 == ""){
		gnb({
			depth01: depth01,
			depth02: depth02
		});
	} else {
		gnb({
			depth01: depth01,
			depth02: depth02,
			depth03: depth03
		});
	}
	tblSlide();
};
var MAIN_PAGE = false;
</script>

<%@ include file="header" %>