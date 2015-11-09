<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form method="post" name="frmDelete" action="/admin/notice/delete">
	<input type="hidden" id="arrSeq" name="arrSeq" value="" />
</form>
<form method="get" name="frmSearch" action="/admin/notice/list">
	<table>
		<tbody>
			<tr>
				<td align="left">
					<span class="uiSelect">
						<select name="list_exposure_yn" id="list_exposure_yn">
							<option value="">전체</option>
							<option value="Y">리스트 노출</option>
							<option value="N">리스트 미노출</option>
						</select>
						<select name="top_exposure_yn" id="top_exposure_yn">
							<option value="">전체</option>
							<option value="Y">상단 노출</option>
							<option value="N">상단 미노출</option>
						</select>
					</span>
				</td>
				<td align="right">
					<span class="uiSelect">
						<select name="keyfield" id="keyfield">
							<option value="">전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
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
		<col style="width:40px"/>
		<col style="width:70px"/>
		<col style="width:30px"/>
		<col style="width:30px"/>
		<col style="width:30px"/>
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
			<th>언어선택</th>
			<th>제목</th>
			<th>노출여부</th>
			<th>상단노출여부</th>
			<th>등록일</th>
			<th>수정 및 설정</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) == 0}">
			<tr>
				<td colspan="8" height="100px" align="center">데이터가 존재하지 않습니다.</td>
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
					<td>
						<c:if test="${data.langKorYn == 'Y'}">국문 </c:if>
						<c:if test="${data.langEngYn == 'Y'}">영문 </c:if>
						<c:if test="${data.langChnYn == 'Y'}">중문 </c:if>
						<c:if test="${data.langJpnYn == 'Y'}">일문 </c:if>
					</td>
					<td>
						<c:choose>
							<c:when test="${data.titleKor != ''}">
								${data.titleKor}
							</c:when>
							<c:when test="${data.titleEng != ''}">
								${data.titleEng}
							</c:when>
							<c:when test="${data.titleChn != ''}">
								${data.titleChn}
							</c:when>
							<c:otherwise>
								${data.titleJpn}
							</c:otherwise>
						</c:choose>

					</td>
					<td>
						<c:choose>
							<c:when test="${data.listExposureYn == 'Y'}">노출</c:when>
							<c:otherwise>미노출</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${data.topExposureYn == 'Y'}">노출</c:when>
							<c:otherwise>미노출</c:otherwise>
						</c:choose>
					</td>
					<td><fmt:formatDate value="${data.createDt}" pattern="yyyy-MM-dd"/></td>
					<td class="agC"><a href="get/${data.seq}?page=${paging.currentPage}&list_exposure_yn=${list_exposure_yn}&top_exposure_yn=${top_exposure_yn}&keyfield=${keyfield}&keyword=${keyword}">수정</a></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<c:import url="../../common/paging.jsp">
	<c:param name="queryStr" value="/admin/notice/list?top_exposure_yn=${top_exposure_yn}&list_exposure_yn=${list_exposure_yn}&keyfield=${keyfield}&keyword=${keyword}" />
</c:import>
<script>
	$(document).ready(function() {
		var searchForm = document.frmSearch;

		searchForm.list_exposure_yn.value = "${list_exposure_yn}";
		searchForm.top_exposure_yn.value = "${top_exposure_yn}";
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