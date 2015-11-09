<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<form method="post" name="frmDelete" action="/admin/inquiry/delete">
	<input type="hidden" id="arrSeq" name="arrSeq" value="" />
</form>
<form method="get" name="frmSearch" action="/admin/inquiry/list">
<input type="hidden" name="keyfield" value="" />
<input type="hidden" name="keyword" value="" />
	<table>
		<tbody>
			<tr>
				<td align="left">
					<span class="uiSelect">
						<select name="inquiry_kind" id="inquiry_kind">
							<option value="">전체</option>
							<option value="100">영업문의(국내)</option>
							<option value="200">영업문의(해외)</option>
							<option value="300">채용문의</option>
							<option value="400">기타</option>
						</select>
						<select name="inquiry_sub_kind" id="inquiry_sub_kind">
							<c:choose>
								<c:when test="${inquiry_kind == '100'}">
									<option value="">전체</option>
									<option value="200">Polymeric MDI</option>
									<option value="210">Phthaloyl chloride Series</option>
									<option value="220">Modified MDI</option>
									<option value="230">Monomeric MDI</option>
									<option value="240">Special MDI</option>
								</c:when>
								<c:when test="${inquiry_kind == '200'}">
									<option value="">전체</option>
									<option value="300">북미</option>
									<option value="310">유럽</option>
									<option value="320">오세아니아</option>
									<option value="330">중동</option>
									<option value="340">중국</option>
									<option value="350">기타</option>
									<option value="360">남미</option>
								</c:when>
								<c:when test="${inquiry_kind == ''}">
									<option value="">국가구분을 선택하십시오</option>
								</c:when>
							</c:choose>
						</select>
						<input type="hidden" name="answer" value="" />
						<!-- <select name="answer" id="answer">
							<option value="">전체</option>
							<option value="Y">답변완료</option>
							<option value="N">미완료</option>
						</select> -->
					</span>
				</td>
				<td align="right">
					<%-- <span class="uiSelect">
						<select name="keyfield" id="keyfield">
							<option value="">선택</option>
							<option value="name">이름</option>
							<option value="phone">휴대번호</option>
						</select>
					</span>
					<span class="uiInput text">
						<input type="text" id="keyword" name="keyword" value="${keyword}" />
					</span>&nbsp; --%>
					<a href="javascript:void(0);" class="uiButton" id="btnSearch" onclick="document.frmSearch.submit();"><span>검색</span></a>
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
		<col style="width:50px"/>
		<col style="width:60px"/>
		<col style="width:40px"/>
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
			<th>국가구분</th>
			<th>파트구분</th>
			<th>질문</th>
			<th>등록일</th>
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
							<input name="seq" type="checkbox" value="${data.iiId}" />
						</span>
					</td>
					<td>${data.iiId}</td>
					<td>
						<c:choose>
							<c:when test="${data.iicCd == '100'}">
								영업문의(국내)
							</c:when>
							<c:when test="${data.iicCd == '200'}">
								영업문의(해외)
							</c:when>
							<c:when test="${data.iicCd == '300'}">
								채용문의
							</c:when>
							<c:otherwise>기타</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${data.iicSubCd == '200'}">
								Polymeric MDI
							</c:when>
							<c:when test="${data.iicSubCd == '210'}">
								Phthaloyl chloride Series
							</c:when>
							<c:when test="${data.iicSubCd == '220'}">
								Modified MDI
							</c:when>
							<c:when test="${data.iicSubCd == '230'}">
								Monomeric MDI
							</c:when>
							<c:when test="${data.iicSubCd == '240'}">
								Special MDI
							</c:when>

							<c:when test="${data.iicSubCd == '300'}">
								북미
							</c:when>
							<c:when test="${data.iicSubCd == '310'}">
								유럽
							</c:when>
							<c:when test="${data.iicSubCd == '320'}">
								오세아니아
							</c:when>
							<c:when test="${data.iicSubCd == '330'}">
								중동
							</c:when>
							<c:when test="${data.iicSubCd == '340'}">
								중국
							</c:when>
							<c:when test="${data.iicSubCd == '350'}">
								기타
							</c:when>
							<c:when test="${data.iicSubCd == '360'}">
								남미
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
					<td>${data.title}</td>
					<%-- <td>${data.tel1Num}-${data.tel2Num}-${data.tel3Num}</td>
					<td>${data.pho1Num}-${data.pho2Num}-${data.pho3Num}</td>
					<td>${data.email}@${data.emailHost}</td> --%>
					<td><fmt:formatDate value="${data.createDt}" pattern="yyyy-MM-dd"/></td>
					<td class="agC"><a href="get/${data.iiId}">확인</a></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<c:import url="../../common/paging.jsp">
	<c:param name="queryStr" value="/admin/inquiry/list?inquiry_kind=${inquiry_kind}&keyfield=${keyfield}&keyword=${keyword}&inquiry_sub_kind=${inquiry_sub_kind}&answer=${answer}"/>
</c:import>
<script>
	$(document).ready(function() {
		var searchForm = document.frmSearch;

		searchForm.inquiry_kind.value = "${inquiry_kind}";
		searchForm.keyfield.value = "${keyfield}";
		searchForm.keyword.value = "${keyword}";
		searchForm.inquiry_sub_kind.value = "${inquiry_sub_kind}";
		searchForm.answer.value = "${answer}";

		$("#allcheck").bind("click", function(){
			common.commonModule.allCheck("seq", this);
		});

		$("#check_dels").bind("click", function(){
			common.commonModule.bindCheckedData("seq", "arrSeq", document.frmDelete);
		});

		$("#inquiry_kind").change(function(){
			var html = "";
			if($(this).val() == "100"){
				html += "<option value=\"\">전체</option>";
				html += "<option value=\"200\">Polymeric MDI</option>";
				html += "<option value=\"210\">Phthaloyl chloride Series</option>";
				html += "<option value=\"220\">Modified MDI</option>";
				html += "<option value=\"230\">Monomeric MDI</option>";
				html += "<option value=\"240\">Special MDI</option>";

				$("#inquiry_sub_kind").html(html);
				$("#inquiry_sub_kind").show();
			} else if($(this).val() == "200"){
				html += "<option value=\"\">전체</option>";
				html += "<option value=\"300\">북미</option>";
				html += "<option value=\"310\">유럽</option>";
				html += "<option value=\"320\">오세아니아</option>";
				html += "<option value=\"330\">중동</option>";
				html += "<option value=\"340\">중국</option>";
				html += "<option value=\"350\">기타</option>";
				html += "<option value=\"360\">남미</option>";

				$("#inquiry_sub_kind").html(html);
				$("#inquiry_sub_kind").show();
			} else if($(this).val() == "300"){
				$("#inquiry_sub_kind").hide();
			} else if($(this).val() == "400"){
				$("#inquiry_sub_kind").hide();
			} else {
				html += "<option value=\"\">국가구분을 선택하십시오.</option>";
				$("#inquiry_sub_kind").html(html);
				$("#inquiry_sub_kind").show();
			}
		});

		$("#reg_button").hide();
		<sec:authorize ifAnyGranted="ROLE_ADMIN">
			$("#check_dels").hide();
		</sec:authorize>

		if("${inquiry_kind}" == "300" || "${inquiry_kind}" == "400"){ $("#inquiry_sub_kind").hide(); }
	});
</script>