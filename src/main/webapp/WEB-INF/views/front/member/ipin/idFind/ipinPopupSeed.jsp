<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%
	response.setHeader("Cache-Control","no-cache");     
	response.setHeader("Pragma","no-cache");
%>
<%
	String param = "";
	String retInfo    = request.getParameter("retInfo").trim();
	param= "?retInfo="+retInfo;
%>
<html>
<head>
<title>EIP Template</title>
<script language="JavaScript">
	function end() {
		window.opener.location.href = '${pageContext.request.contextPath}/member/idFind/ipinResultSeed.jsp<%=param%>';
		self.close();
	}
</script>
</head>
<body onload="javascript:end()">
</body>
</html>