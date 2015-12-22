<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<security:authentication property="name" var="headerLoginID"/>

                <div class="leftMenu h310">
                    <h2 class="title"><img src="${pageContext.request.contextPath}/resources/images/member/leftTitle.gif" width="180" height="100" alt="회원메뉴" /></h2>
                    <div class="snb">
                    <c:if test="${headerLoginID == 'anonymousUser'}">
	                    <ul class="member">
	                        <li><a id="joinA" href="${pageContext.request.contextPath}/user/Member/member_join_step01">회원가입</a></li>
	                        <li><a id="loginA" href="${pageContext.request.contextPath}/user/Member/member_login">로그인</a></li>
	                        <li><a id="searchA" href="${pageContext.request.contextPath}/user/Member/member_idpwsearch">아이디/비밀번호 찾기</a></li>
	                    </ul>
					</c:if>
					<c:if test="${headerLoginID != 'anonymousUser'}">
	                    <ul class="member2">
	                		<li><a id="infoA" href="${pageContext.request.contextPath}/user/Member/member_info">회원정보수정</a></li>
	                	</ul>
					</c:if>
					</div>
                </div>
                
<script>
$(function(){
	var strJoinIndexUrl = "/user/Member/member_join_";
	var strLoginIndexUrl = "/user/Member/member_login";
	var strSearchIndexUrl = "/user/Member/member_idpwsearch";
	var strSearchIndexUrl_1 = "/user/Member/member_idresult";
	var strSearchIndexUrl_2 = "/user/Member/member_pwresult";
	var strInfoIndexUrl = "/user/Member/member_info";
	
	if (location.href.indexOf(strJoinIndexUrl) > 0) $("#joinA").addClass("on01");
	if (location.href.indexOf(strLoginIndexUrl) > 0) $("#loginA").addClass("on02");
	if (location.href.indexOf(strSearchIndexUrl) > 0) $("#searchA").addClass("on03");
	if (location.href.indexOf(strSearchIndexUrl_1) > 0) $("#searchA").addClass("on03");
	if (location.href.indexOf(strSearchIndexUrl_2) > 0) $("#searchA").addClass("on03");
	if (location.href.indexOf(strInfoIndexUrl) > 0) $("#infoA").addClass("on01");
});
</script>