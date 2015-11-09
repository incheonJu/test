<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="currentDate" class="java.util.Date" />
<fmt:formatDate var="toDay" value="${currentDate}" pattern="yyyy-MM-dd" />
<c:set var="korCnt" value="0"/>
<c:set var="engCnt" value="0"/>
<c:set var="chnCnt" value="0"/>
<c:set var="jpnCnt" value="0"/>
<form method="post" name="frmDelete" action="/admin/popup/delete">
	<input type="hidden" id="arrSeq" name="arrSeq" value="" />
</form>
<form method="get" name="frmSearch" action="/admin/popup/list">
	<table>
		<tbody>
			<tr>
				<td align="left">
					<span class="uiSelect">
						<select name="exposureCd">
							<option value="">전체</option>
							<option value="100">국문</option>
							<option value="200">영문</option>
							<option value="400">중문</option>
							<option value="300">일문</option>
						</select>
					</span>
				</td>
				<td align="right">
					<span class="uiSelect">
						<select name="keyfield" id="keyfield">
							<option value="">전체</option>
							<option value="title">제목</option>
						</select>
					</span>
					<span class="uiInput text">
						<input type="text" id="keyword" name="keyword" value="${keyword}" />
					</span>&nbsp;
					<a class="uiButton" id="btnSearch" onclick="document.frmSearch.submit();"><span>검색</span></a>
				</td>
			</tr>
		</tbody>
	</table>
</form>
<table class="uiTable list">
	<colgroup>
		<col style="width:10px"/>
		<col style="width:20px"/>
		<col style="width:60px"/>
		<col style="width:50px"/>
		<col style="width:50px"/>
		<col style="width:60px"/>
		<col style="width:40px"/>
	</colgroup>
	<thead>
		<tr>
			<th>
				<span class="uiInput check">
					<input id="allcheck" type="checkbox" />
				</span>
			</th>
			<th>No</th>
			<th>제목</th>
			<th>노출부문</th>
			<th>기간</th>
			<th>완료여부</th>
			<th>수정 및 설정</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) == 0}">
			<tr>
				<td colspan="7" height="100px" align="center">데이터가 존재하지 않습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="data" items="${list}" varStatus="status">
				<tr>
					<td>
						<span class="uiInput check">
							<input name="seq" type="checkbox" value="${data.seq}" />
						</span>
					</td>
					<td>${data.seq}</td>
					<td>${data.title}</td>
					<td>
						<c:choose>
							<c:when test="${data.exposureCd == '100'}">국문</c:when>
							<c:when test="${data.exposureCd == '200'}">영문</c:when>
							<c:when test="${data.exposureCd == '400'}">중문</c:when>
							<c:otherwise>일문</c:otherwise>
						</c:choose>
					</td>
					<td>${data.startDt} ~ ${data.endDt}</td>
					<td>
						<c:choose>
							<c:when test="${toDay < data.startDt}">
							대기
							</c:when>
							<c:when test="${toDay >= data.startDt && toDay <= data.endDt}">
								<c:choose>
									<c:when test="${data.rank < 3}">
									진행																	
									</c:when>
									<c:otherwise>
									종료
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
							종료
							</c:otherwise>
						</c:choose>
					</td>
					<td class="agC"><a href="get/${data.seq}">수정</a></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<c:import url="../../common/paging.jsp">
	<c:param name="queryStr" value="/admin/popup/list?exposureCd=${exposureCd}&keyfield=${keyfield}&keyword=${keyword}" />
</c:import>
<script>
	$(document).ready(function() {
		var searchForm = document.frmSearch;
		
		searchForm.exposureCd.value = "${exposureCd}";
		searchForm.keyfield.value = "${keyfield}";		
		searchForm.keyword.value = "${keyword}";
		
		$("#allcheck").bind("click", function(){
			common.commonModule.allCheck("seq", this);
		});
		
		$("#check_dels").bind("click", function(){
			common.commonModule.bindCheckedData("seq", "arrSeq", document.frmDelete);
		});
	});
</script>