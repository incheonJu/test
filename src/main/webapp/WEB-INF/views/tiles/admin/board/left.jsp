<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div id="leftMenu">
	<h2 class="title">게시판 관리</h2>
	<ul class="smenu">
		<security:authorize ifAnyGranted="ROLE_OPER" >
			<li><a href="${pageContext.request.contextPath}/admin/board/boardList" >게시판 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/board/faqList" >FAQ 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/board/qnaList" >Q&A 관리</a></li>
		</security:authorize>
	</ul>
</div>
