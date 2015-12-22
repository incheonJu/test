<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<tiles:insertAttribute name="meta" />
</head>
<body>
	<div id="wrap">
    <!-- 헤더 -->
    <div id="headerBg">
        <div id="header">
        	<tiles:insertAttribute name="header" />
        </div>
    </div>
    <!-- //헤더 --> 
    
    <!-- 컨텐츠 -->
    <div id="contentBg">
    	<div id="contentWrap">
    	 	 <div id="leftArea">
    	 	 	<tiles:insertAttribute name="left" />
    	 	 </div>
        	<tiles:insertAttribute name="body" />
        </div>
    </div>
    <!-- //컨텐츠 --> 
    
    <!-- 푸터 -->
    <div id="footer">
        <tiles:insertAttribute name="footer" />
	</div>
	<!-- //푸터 --> 
</div>
</body>
</html>