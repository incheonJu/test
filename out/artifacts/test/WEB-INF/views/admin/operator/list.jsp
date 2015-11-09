<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form method="post" name="frmDelete" action="/admin/operator/delete">
	<input type="hidden" id="arrSeq" name="arrSeq" value="" />
</form>
<form method="get" name="frmSearch" action="/admin/operator/list">
	<table>
		<tbody>
			<tr>
				<td align="left">
					<span class="uiSelect">
						<select name="operator_kind" id="operator_kind">
							<option value="">전체</option>
							<option value="100">제품 관리자</option>
							<option value="200">컨텐츠 관리자</option>
							<option value="300">제품구입처 관리자</option>
							<option value="400">문의 관리자</option>
						</select>
					</span>
				</td>
				<td align="right">
					<span class="uiSelect">
						<select name="keyfield" id="keyfield">
							<option value="">선택</option>
							<option value="name">이름</option>
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
		<col style="width:10px;"/>
		<col style="width:20px;"/>
		<col style="width:60px"/>
		<col style="width:50px"/>
		<col style="width:50px"/>
		<col style="width:50px"/>
		<col style="width:50px"/>
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
			<th>구분</th>
			<th>팀</th>
			<th>이름</th>
			<th>전화번호</th>
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
						<c:choose>
							<c:when test="${data.typeCd == '100'}">
								제품 관리자
							</c:when>
							<c:when test="${data.typeCd == '200'}">
								컨텐츠 관리자
							</c:when>
							<c:when test="${data.typeCd == '300'}">
								제품구입처 관리자
							</c:when>
							<c:when test="${data.typeCd == '400'}">
								문의 관리자
							</c:when>
						</c:choose>
					</td>
					<td>${data.deptName}(${data.deptNameEng})</td>
					<td>${data.nameKor}</td>
					<td>${data.tel1Kor}-${data.tel2Kor}-${data.tel3Kor}</td>
					<td><fmt:formatDate value="${data.createDt}" pattern="yyyy-MM-dd"/></td>
					<td class="agC"><a href="get/${data.seq}?page=${paging.currentPage}&operator_kind=${operator_kind}&keyfield=${keyfield}&keyword=${keyword}">수정</a></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<c:import url="../../common/paging.jsp">
	<c:param name="queryStr" value="/admin/operator/list?operator_kind=${operator_kind}&keyfield=${keyfield}&keyword=${keyword}" />
</c:import>
<script>
	$(document).ready(function() {
		var searchForm = document.frmSearch;
		
		searchForm.operator_kind.value = "${operator_kind}";
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