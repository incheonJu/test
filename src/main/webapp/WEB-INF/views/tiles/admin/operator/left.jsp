<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div id="leftMenu">
	<security:authorize ifAnyGranted="ROLE_OPER" >
		<h2 class="title">처리자 관리</h2>
	</security:authorize>
	<ul class="smenu">
		<security:authorize ifAnyGranted="ROLE_OPER" >
			<li><a href="${pageContext.request.contextPath}/admin/operator/operatorList" >처리자 관리</a></li>
		</security:authorize>
	</ul>
</div>
