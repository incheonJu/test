<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="paging">
	<span class="p_1">
		<a class="first" href="${param.queryStr}&page=1"></a>
		<c:choose>
			<c:when test="${paging.currentPage == 1}">
				<a class="prev" href="${param.queryStr}&page=1"></a>	
			</c:when>
			<c:otherwise>
				<a class="prev" href="${param.queryStr}&page=${paging.currentPage - 1}"></a>
			</c:otherwise>
		</c:choose>
	</span>
	<span class="paging_num">
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${paging.currentPage == i}">
				<a href="javascript:void(0);" class="on">${i}</a>
			</c:if>
			<c:if test="${paging.currentPage != i && i != 0}">
				<a href="${param.queryStr}&page=${i}">${i}</a>
			</c:if>
		</c:forEach>
	</span>
	<span class="p_1">
		<c:choose>
			<c:when test="${paging.totalPageSize == paging.currentPage}">
				<a class="next" href="${param.queryStr}&page=${paging.totalPageSize}"></a>
			</c:when>
			<c:otherwise>
				<a class="next" href="${param.queryStr}&page=${paging.currentPage+1}"></a>		
			</c:otherwise>
		</c:choose>
		<a class="end" href="${param.queryStr}&page=${paging.totalPageSize}"></a>
	</span>
</div>