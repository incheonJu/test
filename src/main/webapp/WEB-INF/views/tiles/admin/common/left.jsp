<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!-- Left 영역 -->
<div id="leftMenu">
	<h2 class="title">메인화면</h2>
	<ul class="smenu">
		<security:authorize ifAnyGranted="ROLE_OPER" >
			<li><a href="${pageContext.request.contextPath}/admin/member/memberList">회원 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/operator/operatorList" >처리자 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/board/boardList">게시판 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/code/masterCodeList">코드 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/statistics/visitStatisticsList">통계 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/system/systemLogList">시스템 관리</a></li>
			</security:authorize>
	</ul>
</div>
<!-- //Left 영역 -->