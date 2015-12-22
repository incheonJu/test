<%
/**************************************************************************************************************************
* Program Name  : SIREN24 아이핀 서비스 요청 페이지(데이터 암호화) Sample (JSP)
* File Name     : ipin_request_seed.jsp
* Comment       : 
* History       : 
*
**************************************************************************************************************************/
%>

<%
    response.setHeader("Pragma", "no-cache" );
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-store");
    response.setHeader("Cache-Control", "no-cache" );
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import ="java.util.*"%>
<html>
<head>
<title>SIREN24 아이핀 서비스 </title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">


<%
	// 서버 경로 설정
	String contextFullPath = "http://";
	String serverName = request.getServerName();
	int serverPort = request.getServerPort();
	String contextPath = request.getContextPath();
	
	contextFullPath += serverName;
	if (serverPort != 0)
	{
	    contextFullPath += ":" + Integer.toString(serverPort);
	}
	/* if (!"".equals(contextPath))
	{
		contextFullPath += "/" + contextPath;
	} */
	//
	java.util.Random ran = new Random();
	//랜던 문자 길이
	int numLength = 16;
	String randomStr = "";
	
	for (int i = 0; i < numLength; i++) {
		//0 ~ 9 랜덤 숫자 생성
		randomStr += ran.nextInt(10);
	}
	
	String reqNum = randomStr;
	
	Cookie c = new Cookie("reqNum", reqNum);
	c.setMaxAge(1800);  // <==초단위로 설정됩니다.
	response.addCookie(c);	

    String id          = "";														//회원사 ID
    //String reqNum      = "";														//요청번호
    String retUrl      = "";														//결과 수신 URL
    String srvNo       = "";														//서비스번호
	String exVar       = "0000000000000000";                                       // 복호화용 임시필드

    id   = "QHT002";
    //reqNum   = request.getParameter("reqNum").trim();
    retUrl   = "23" + contextFullPath + "/member/ipinPopupSeed.jsp";
    //srvNo   = "002001";		//***** localhost:8080 용
    srvNo   = "001001";	//***** 실서버용

    // 암호화 모듈 선언

	com.sci.v2.ipin.secu.SciSecuManager seed  = new com.sci.v2.ipin.secu.SciSecuManager();

	// 1차 암호화
	String encStr = "";
	String reqInfo      = reqNum+"/"+id+"/"+srvNo+"/"+exVar;  // 데이터 암호화
	encStr              = seed.getEncPublic(reqInfo);

	// 위변조 검증 값 등록
	com.sci.v2.ipin.secu.hmac.SciHmac hmac = new com.sci.v2.ipin.secu.hmac.SciHmac();
	String hmacMsg = hmac.HMacEncriptPublic(encStr);

	// 2차 암호화
	reqInfo  = seed.getEncPublic(encStr + "/" + hmacMsg + "/" + "00000000");  //2차암호화

%>

		</head>
		<!--실명확인팝업 요청 form --------------------------->
		<form name="reqCBAForm" method="post" action="">  
			<input type="hidden" name="reqInfo" value = "<%=reqInfo%>">                                                                   <!--실명확인 회원사 아이디-->
			<input type="hidden" name="retUrl"  value = "<%=retUrl%>"> <!--실명확인 결과수신 URL-->
		</form>

		</BODY>
		</HTML>
		
<script language=javascript>  
<!--
	document.reqCBAForm.action = 'https://ipin.siren24.com/i-PIN/jsp/ipin_j10.jsp';
	document.reqCBAForm.submit();

//-->
</script>