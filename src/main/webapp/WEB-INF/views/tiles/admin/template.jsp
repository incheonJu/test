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
		<!-- TOP -->
		<div id="headerBg">
			<tiles:insertAttribute name="header" />
		</div>
		<!-- //TOP END -->
	
		<!-- CONTENT -->
	    <div id="contentBg">
	        <div id="contentArea">
	        	<div id="leftMenu">
	        		<tiles:insertAttribute name="left"/>
	        	</div>
		        <div id="content">
		        	<tiles:insertAttribute name="body" />
		        </div>
	        </div>
		</div>
		
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>