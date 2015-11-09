<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:import url="../../layout/admin/common/header" />
<c:import url="../../layout/admin/common/top" />
<c:import url="../../layout/admin/inquiry/left" />
<c:set var="mode" value="${inquiry == null ? '/admin/inquiry/insert' : '/admin/inquiry/update'}" />
<form method="post" name="frmEdit" action="${mode}">
<input type="hidden" name="iiId" value="${inquiry.iiId}" />
<input type="hidden" name="answererId" value="${loginUserIDX}" />
<input type="hidden" name="attachFilePath" value="${inquiry.attachFilePath}" />
<div id="area_base">
	<table class="uiTable write">
		<colgroup>
			<col style="width:130px" />
			<col />
		</colgroup> 
		<tbody>
			<tr>
				<th>국가구분</th>
				<td>
					<span class="uiInput text">
						<c:choose>
							<c:when test="${inquiry.iicCd == '100'}">
							영업문의(국내)
							</c:when>
							<c:when test="${inquiry.iicCd == '200'}">
							영업문의(해외)
							</c:when>
							<c:when test="${inquiry.iicCd == '300'}">
							채용문의
							</c:when>
							<c:otherwise>
							기타
							</c:otherwise>
						</c:choose>
					</span>
					<%-- <span class="uiSelect">
						<select name="iicCd">
							<option value="">선택하세요</option>
							<option value="100"></option>
							<option value="200"></option>
							<option value="300"></option>
							<option value="400"></option>
							<!-- <option value="">선택하세요</option>
							<option value="100">영업문의 : Polymerics/Speceial MDI</option>
							<option value="200">영업문의 : Modified/Monomeris</option>
							<option value="300">영업문의 : 수출</option>
							<option value="400">기술문의(기술팀) : 일반적인 기술문의</option>
							<option value="500">기술문의(연구팀) : 자동차시트</option>
							<option value="600">기술문의(연구팀) : CASE</option>
							<option value="700">채용문의</option> -->
						</select>
						<script>document.frmEdit.iicCd.value = "${inquiry.iicCd}";</script>
					</span> --%>
				</td>
			</tr>
			<tr>
				<th>파트구분</th>
				<td>
					<span class="uiInput text">
						<c:choose>
							<c:when test="${inquiry.iicSubCd == '200'}">
								Polymeric MDI
							</c:when>
							<c:when test="${inquiry.iicSubCd == '210'}">
								Phthaloyl chloride Series
							</c:when>
							<c:when test="${inquiry.iicSubCd == '220'}">
								Modified MDI
							</c:when>
							<c:when test="${inquiry.iicSubCd == '230'}">
								Monomeric MDI
							</c:when>
							<c:when test="${inquiry.iicSubCd == '240'}">
								Special MDI
							</c:when>
							
							<c:when test="${inquiry.iicSubCd == '300'}">
								북미
							</c:when>
							<c:when test="${inquiry.iicSubCd == '310'}">
								유럽
							</c:when>
							<c:when test="${inquiry.iicSubCd == '320'}">
								오세아니아
							</c:when>
							<c:when test="${inquiry.iicSubCd == '330'}">
								중동
							</c:when>
							<c:when test="${inquiry.iicSubCd == '340'}">
								중국
							</c:when>
							<c:when test="${inquiry.iicSubCd == '350'}">
								기타
							</c:when>
							<c:when test="${data.iicSubCd == '360'}">
								남미
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</span>
				</td>
			</tr>
			<tr>
				<th>고객명(회사명)</th>
				<td>
					<span class="uiInput text">
						${inquiry.name}
						<%-- <input name="name" type="text" value="${inquiry.name}" />
						<label for="name">이름을 입력해주시기 바랍니다.</label> --%>
					</span>
				</td>
			</tr>
			<%-- <tr>
				<th>연락처(핸드폰)</th>
				<td>
					<span class="uiInput text">
						${inquiry.pho1Num}-${inquiry.pho2Num}-${inquiry.pho3Num}
					</span>
				</td>
			</tr> --%>
			<%-- <tr>
				<th>연락처(집/회사)</th>
				<td>
					<span class="uiInput text">
						${inquiry.tel1Num}-${inquiry.tel2Num}-${inquiry.tel3Num}
					</span>
				</td>
			</tr> --%>
			<%-- <tr>
				<th>주소</th>
				<td>
					<span class="uiInput text">
						${inquiry.zip1Num}-${inquiry.zip2Num}<br/>${inquiry.addr1}${inquiry.addr2}
					</span>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<span class="uiInput text">
						${inquiry.email}@${inquiry.emailHost}
					</span>
				</td>
			</tr> --%>
			<tr>
				<th>제목</th>
				<td>
					<span class="uiInput text">
						${inquiry.title}
					</span>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div id="area_memo">
	<table class="uiTable write">
		<colgroup>
			<col style="width:130px"/>
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="uiTextArea sizeFull" maxlength="200">${inquiry.news}</textarea>
				</td>
			</tr>
			<%-- <tr>
				<th>답변</th>
				<td>
					<textarea class="uiTextArea sizeFull" name="answerContent">${inquiry.answerContent}</textarea>
				</td>
			</tr> --%>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${inquiry.attachFilePath != '' && inquiry.attachFilePath != null}">
						<a href="/download${inquiry.attachFilePath}" class="uiButton"><span>다운로드</span></a>
					</c:if>
					<%-- <span class="uiInput text">${inquiry.attachFilePath}</span> --%>
				</td>
			</tr>
			<tr>
				<th>답변 담당자</th>
				<td>${inquiry.inchargeName}
					<%-- <c:choose>
						<c:when test="${fn:length(inCharge) == 0}">
							-
						</c:when>
						<c:otherwise>
							<c:forEach var="data" items="${inCharge}">
								<span>[${data.deptName}]${data.name}</span>
							</c:forEach>
						</c:otherwise>
					</c:choose> --%>
				</td>
			</tr>
			<%-- <tr>
				<th>답변완료 여부</th>
				<td>
					<span class="uiInput text">
						<input name="answerYn" type="radio" value="Y" /> 답변완료
						<input name="answerYn" type="radio" value="N" /> 미완료
					</span>
				</td>
			</tr> --%>
			<input type="hidden" name="answerYn" value="Y" />
		</tbody>
	</table>
</div>
</form>
<div id="single_btn">
	<table>
		<tr>
			<td height="20">&nbsp;</td>
		</tr>
		<tr>
			<td align="left">
				<a class="uiButton" href="javascript:history.go(-1);"><span>목록</span></a>
			</td>
			<%-- <td align="right">
				<c:if test="${inquiry == null}">
					<a class="uiButton" id="submit_btn"><span>등록</span></a>
				</c:if>
				<c:if test="${inquiry != null}">
					<a class="uiButton" id="submit_btn"><span>수정</span></a>
				</c:if>
			</td> --%>
		</tr>
	</table>
</div>
<script>
	$(document).ready(function() {
		var f = document.frmEdit;
		/* var init = function(_answerYn){
			common.commonModule.checkedRadio(f.answerYn, _answerYn);			
		}; */
		$("#submit_btn").bind("click", function(){
			/* if(!common.commonModule.isCheck(f.iicCd, "문의파트를 하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.name, "고객명(회사명)을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.pho1Num, "연락처(핸드폰)를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.pho2Num, "연락처(핸드폰)를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.pho3Num, "연락처(핸드폰)를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.tel1Num, "연락처(집/회사)를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.tel2Num, "연락처(집/회사)를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.tel3Num, "연락처(집/회사)를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.email, "이메일주소를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.emailHost, "이메일주소를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.title, "제목을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.news, "내용 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.answerContent, "답변을 입력하십시오.", "")) { return; }
			f.submit();
			*/
		});
		
		//	init("${inquiry.answerYn}");
	});
</script>
<c:import url="../../layout/admin/common/footer" />