<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-46434419-1', 'localhost');
  ga('send', 'pageview');
</script>
<script src="${pageContext.request.contextPath}/js/common/date_function.js"></script>
<div id="header">
	<div id="headtop">
		<div class="left">
			<h1>
				<a href="${pageContext.request.contextPath}/admin/main">
				EIP
				</a>
			</h1>
			
			<span class="nm">안녕하세요! <b>${loginUserName}</b>님</span>
		</div>
		<div class="right">
			<ul id="gnb">
				<li><a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/myInfo">회원정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/">홈페이지 바로가기</a></li>
			</ul>
		</div>
	</div>
	<div id="headmn">
		<div class="timetxt" id="timeDiv"></div>
		<script type="text/javascript">
		
		    $("#timeDiv").append(getDateString());
		</script>
		
		<ul class="tmenu">
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
</div>
