<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="tc"%>
<table width="100%">
<tr>
	<td>
	<!-- top (s) -->
	<div class="cmHead">
		<div class="cmPivot">
			<h1 class="logo" style="height:50px; padding-top:30px;">
				<!-- <a href="#"><img src="/resources/kor/images/common/header/img_logo01.gif" alt="" /></a> -->
				<p style="color:#ffffff;">금호폴리켐 관리자</p>
			</h1>
			<div class="utils">
				<div class="log"><strong>${loginUserName}</strong> 님 안녕하세요.</div>
				<ul class="stack">
					<li><a href="/admin/operator/get/${loginUserIDX}/info">정보수정</a></li>
					<li><a href="/admin/logout" onclick="return confirm('로그아웃 하시겠습니까?');ㅣ">로그아웃</a></li>
				</ul>
			</div>
			<div class="utils2">
				<tc:choose>
					<tc:when test="${loginUser.typeCd == '100'}">
						<tc:if test="${loginUser.productYn == 'Y'}">
						<a href="/admin/productEPDM/list?seq=1&type=_epm">제품관리</a>
						</tc:if>
						<tc:if test="${loginUser.contentYn == 'Y'}">
						<a href="/admin/notice/list">컨텐츠관리</a>
						</tc:if>
					</tc:when>
					<tc:when test="${loginUser.typeCd == '200'}">
						<a href="/admin/inquiry/list">문의 관리</a>
					</tc:when>
					<tc:otherwise>
						<a href="/admin/operator/list">공통 관리</a>
						<a href="/admin/productEPDM/list?seq=1&type=_epm">제품관리</a>
						<a href="/admin/notice/list">컨텐츠관리</a>
						<a href="/admin/inquiry/list">문의 관리</a>
					</tc:otherwise>
				</tc:choose>
				<!-- <a href="/admin/operator/list">공통 관리</a>
				<a href="/admin/productCategory/list">제품관리</a>
				<a href="/admin/notice/list">컨텐츠관리</a>
				<a href="/admin/inquiry/list">문의 관리</a> -->
			</div>
		</div>
	</div>
	<!-- top (e) -->
	</td>
</tr>
</table>