<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<tiles:insertAttribute name="meta" />
</head>
<body>
<div id="wrap">
	<!-- TOP -->
	<div id="headerBg">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
	</div>
	<!-- //TOP END -->

	<!-- CONTENT -->
    <div id="contentBg">
        <div id="contentWrap">
	        <tiles:insertAttribute name="body" />
        </div>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</div>

<!-- 퀵 메뉴 -->
<div id="quickMenu">
	<div class="lmnu">
		<ol>
	        <li class="top"><a href="#" title="TOP">TOP</a></li>
        </ol>
    </div>
</div>
<!-- //퀵 메뉴 -->

</body>
</html>