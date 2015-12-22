<%
/**************************************************************************************************************************
* Program Name  : SIREN24 ������ ���� ��û ������(������ ��ȣȭ) Sample (JSP)
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
<title>SIREN24 ������ ���� </title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">


<%
	// ���� ��� ����
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
	//���� ���� ����
	int numLength = 16;
	String randomStr = "";
	
	for (int i = 0; i < numLength; i++) {
		//0 ~ 9 ���� ���� ����
		randomStr += ran.nextInt(10);
	}
	
	String reqNum = randomStr;
	
	Cookie c = new Cookie("reqNum", reqNum);
	c.setMaxAge(1800);  // <==�ʴ����� �����˴ϴ�.
	response.addCookie(c);	

    String id          = "";														//ȸ���� ID
    //String reqNum      = "";														//��û��ȣ
    String retUrl      = "";														//��� ���� URL
    String srvNo       = "";														//���񽺹�ȣ
	String exVar       = "0000000000000000";                                       // ��ȣȭ�� �ӽ��ʵ�

    id   = "QHT002";
    //reqNum   = request.getParameter("reqNum").trim();
    retUrl   = "23" + contextFullPath + "/member/ipinPopupSeed.jsp";
    //srvNo   = "002001";		//***** localhost:8080 ��
    srvNo   = "001001";	//***** �Ǽ�����

    // ��ȣȭ ��� ����

	com.sci.v2.ipin.secu.SciSecuManager seed  = new com.sci.v2.ipin.secu.SciSecuManager();

	// 1�� ��ȣȭ
	String encStr = "";
	String reqInfo      = reqNum+"/"+id+"/"+srvNo+"/"+exVar;  // ������ ��ȣȭ
	encStr              = seed.getEncPublic(reqInfo);

	// ������ ���� �� ���
	com.sci.v2.ipin.secu.hmac.SciHmac hmac = new com.sci.v2.ipin.secu.hmac.SciHmac();
	String hmacMsg = hmac.HMacEncriptPublic(encStr);

	// 2�� ��ȣȭ
	reqInfo  = seed.getEncPublic(encStr + "/" + hmacMsg + "/" + "00000000");  //2����ȣȭ

%>

		</head>
		<!--�Ǹ�Ȯ���˾� ��û form --------------------------->
		<form name="reqCBAForm" method="post" action="">  
			<input type="hidden" name="reqInfo" value = "<%=reqInfo%>">                                                                   <!--�Ǹ�Ȯ�� ȸ���� ���̵�-->
			<input type="hidden" name="retUrl"  value = "<%=retUrl%>"> <!--�Ǹ�Ȯ�� ������� URL-->
		</form>

		</BODY>
		</HTML>
		
<script language=javascript>  
<!--
	document.reqCBAForm.action = 'https://ipin.siren24.com/i-PIN/jsp/ipin_j10.jsp';
	document.reqCBAForm.submit();

//-->
</script>