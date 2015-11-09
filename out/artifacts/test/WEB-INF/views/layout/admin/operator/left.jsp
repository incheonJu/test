<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="lc"%>
<table width="100%" height="100%">
<tr valign="top">
	<td width="200px">
		<!-- left (s) -->
		<div class="cmNavi" >
			<ul class="depth1">
				<li><span class="title1">공통관리</span>
					<ul class="depth2">
						<lc:choose>
							<lc:when test="${loginUser.typeCd == '000'}">
								<li><a id="left_operator" href="/admin/operator/list" class="over">관리자 관리</a></li>
								<li><a id="left_popup" href="/admin/popup/list">팝업 관리</a></li>
							</lc:when>
							<lc:otherwise>
								<li><a id="left_operator" href="javascript:void(0);" class="over">정보수정</a></li>
							</lc:otherwise>
						</lc:choose>
					</ul>
				</li>		
			</ul>
		</div>
		<!-- left (e) -->
	</td>
	<td>
		<!-- news (s) -->
		<div class="pageTopArea">
			<h2 class="pagetitle"></h2>
			<span class="pageLocation"></span>
		</div>
		<div class="cmContent">