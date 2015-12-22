<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-46434419-1', 'eip.kr');
  ga('send', 'pageview');
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<security:authentication property="name" var="headerLoginID"/>

            <!-- 글로벌 메뉴 -->
            <div id="gnb">
            	<!-- 운영 권한을 가진 사람만 버튼 보여줌. -->
				<security:authorize ifAnyGranted="ROLE_FRONT" >
	            	<c:if test="${headerLoginID != 'anonymousUser'}">
	            	<p class="namearea"><strong>${loginUserName}</strong>님의 방문을 환영합니다.</p>
	            	</c:if>
	            </security:authorize>
                <ul>
                    <li class="home"><a href="${pageContext.request.contextPath}/front">홈</a></li>
                    <security:authorize ifAnyGranted="ROLE_FRONT" >
	                    <c:if test="${headerLoginID != 'anonymousUser'}">
	                    <li><a href="${pageContext.request.contextPath}/front/myInfo">회원정보수정</a></li>
	                    <li><a href="${pageContext.request.contextPath}/front/logout">로그아웃</a></li>
	                    </c:if>
                    </security:authorize>
                    <security:authorize ifNotGranted="ROLE_FRONT">
	                    <li><a href="${pageContext.request.contextPath}/front/member/login">로그인</a></li>
	                    <li><a href="${pageContext.request.contextPath}/front/member/register">회원가입</a></li>
	                    <li><a href="${pageContext.request.contextPath}/front/member/findMember">아이디/비밀번호 찾기</a></li>
                    </security:authorize>
                </ul>
            </div>
            <!-- //글로벌 메뉴 --> 
            <div id="lnb">
            	<ul id="top1menu">
            		<li class="fi"><a href="${pageContext.request.contextPath}/front/board/boardList">게시판</a>
            		</li>
            	</ul>
            </div> 
            
            <!-- 콘솔 로그 막기 (익스플로러 하위버전에서 스크립트 애러 방지 -->
            <script type="text/javascript">
	            var console = console || {
	        	    log:function(){},
	        	    warn:function(){},
	        	    error:function(){}
	        	};
            </script> 
            <!-- //메인메뉴 --> 