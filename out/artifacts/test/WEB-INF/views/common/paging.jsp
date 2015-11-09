<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<table>
	<tbody>
		<tr>
			<td align="left">
				<a class="uiButton neg" id="check_dels"><span>삭제</span></a>
			</td>
			<td align="center">
				<div class="uiPaging">	
					<a class="arrow first" href="${param.queryStr}&page=1"><span>첫 페이지</span></a>
					<c:choose>
						<c:when test="${paging.currentPage == 1}">
						<a class="arrow prev" href="${param.queryStr}&page=1"><span>이전페이지</span></a>
						</c:when>
						<c:otherwise>
						<a class="arrow prev" href="${param.queryStr}&page=${paging.currentPage - 1}"><span>이전페이지</span></a>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
						<c:if test="${paging.currentPage == i}">
							<strong>${i}</strong>
						</c:if>
						<c:if test="${paging.currentPage != i && i != 0}">
							<a href="${param.queryStr}&page=${i}">${i}</a>
						</c:if>
					</c:forEach>
					<c:choose>
						<c:when test="${paging.totalPageSize == paging.currentPage}">
							<a class="arrow next" href="${param.queryStr}&page=${paging.totalPageSize}"><span>다음페이지</span></a>
						</c:when>
						<c:otherwise>
							<a class="arrow next" href="${param.queryStr}&page=${paging.currentPage+1}"><span>다음페이지</span></a>
						</c:otherwise>
					</c:choose>
					<a class="arrow last" href="${param.queryStr}&page=${paging.totalPageSize}"><span>마지막 페이지</span></a>
				</div>
			</td>
			<td align="right">
				<c:if test="${param.currentPage != null && param.currentPage == '/admin/handbook/list'}">
					<a class="uiButton" href="file"><span>카테고리 파일 등록</span></a>
				</c:if>
				<sec:authorize ifAnyGranted="ROLE_SUPER_ADMIN, ROLE_ADMIN">
					<a class="uiButton" id="reg_button" href="reg"><span>등록</span></a>
				</sec:authorize>
			</td>
		</tr>
	</tbody>
</table>