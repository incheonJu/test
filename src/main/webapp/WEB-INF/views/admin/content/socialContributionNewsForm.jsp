<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="mode" value="${socialContributionNews == null ? '/admin/socialContributionNews/insert' : '/admin/socialContributionNews/update'}" />
<form method="post" name="frmEdit" action="${mode}" enctype="multipart/form-data">
<input type="hidden" name="seq" value="${socialContributionNews.seq == null ? 0 : socialContributionNews.seq}" />
<input type="hidden" name="topImgPath" value="${socialContributionNews.topImgPath}" />
<input type="hidden" name="listImgPath" value="${socialContributionNews.listImgPath}" />
<input type="hidden" name="contentJpn" value="" />
<input type="hidden" name="contentKor" value="" />
<input type="hidden" name="contentEng" value="" />
<input type="hidden" name="contentChn" value="" />
<div id="area_base">
	<table class="uiTable write">
		<colgroup>
			<col style="width:130px" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>다국어 노출<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput check">
						<input type="checkbox" id="allchecked" name="allchecked"/>
						<label for="allchecked">전체</label>
						<input name="langKorYn" class="exposureLang" id="langKorYn" type="checkbox" value="Y" ${socialContributionNews.langKorYn} />
						<label for="langKorYn">국문</label>
						<input name="langEngYn" class="exposureLang" id="langEngYn" type="checkbox" value="Y" ${socialContributionNews.langEngYn} />
						<label for="langEngYn">영문</label>
						<input name="langChnYn" class="exposureLang" id="langChnYn" type="checkbox" value="Y" ${socialContributionNews.langChnYn} />
						<label for="langChnYn">중문</label>
						<input name="langJpnYn" class="exposureLang" id="langJpnYn" type="checkbox" value="Y" ${socialContributionNews.langJpnYn} />
						<label for="langJpnYn">일문</label>
					</span>
				</td>
			</tr>

			<tr id="titleKor">
				<th>제목(국문)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="titleKor" type="text" value="${socialContributionNews.titleKor}" maxlength="100" style="width:900px;" />
						<label>최대 30자 까지 가능합니다.</label>
					</span>
				</td>
			</tr>
			<tr id="titleEng">
				<th>제목(영문)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="titleEng" type="text" value="${socialContributionNews.titleEng}" maxlength="100" style="width:900px;" />
						<label>최대 30자 까지 가능합니다.</label>
					</span>
				</td>
			</tr>
			<tr id="titleChn">
				<th>제목(중문)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="titleChn" type="text" value="${socialContributionNews.titleChn}" maxlength="100" style="width:900px;" />
						<label>최대 30자 까지 가능합니다.</label>
					</span>
				</td>
			</tr>
			<tr id="titleJpn">
				<th>제목(일문)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="titleJpn" type="text" value="${socialContributionNews.titleJpn}" maxlength="100" style="width:900px;" />
						<label>최대 30자 까지 가능합니다.</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>상단이미지<%-- <span style="color:red;"> * </span> --%></th>
				<td>
					<span class="uiInput file">
						<input type="file" id="topImg" name="topImg" />
						<input type="text" name="topImgAlt" value="${socialContributionNews.topImgAlt}"  />
						<c:if test="${socialContributionNews.topImgPath != '' && socialContributionNews.topImgPath != null}">
							<a href="/download${socialContributionNews.topImgPath}" class="uiButton"><span>${socialContributionNews.topImgName} 다운로드</span></a>
						</c:if>
						<label>이미지크기(711*415)</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>리스트이미지<%-- <span style="color:red;"> * </span> --%></th>
				<td>
					<span class="uiInput file">
						<input type="file" id="listImg" name="listImg" />
						<input type="text" name="listImgAlt" value="${socialContributionNews.listImgAlt}"  />
						<c:if test="${socialContributionNews.listImgPath != '' && socialContributionNews.listImgPath != null}">
							<a href="/download${socialContributionNews.listImgPath}" class="uiButton"><span>${socialContributionNews.listImgName} 다운로드</span></a>
						</c:if>
						<label>이미지크기(711*415)</label>
					</span>
				</td>
			</tr>

			<tr id="summaryKor">
				<th>뉴스 요약(국문)<span style="color:red;"> * </span></th>
				<td>
					<textarea class="uiTextArea sizeFull" name="summaryKor" maxlength="200">${socialContributionNews.summaryKor}</textarea>
					<label>최대 200자 까지 가능 합니다.</label>
				</td>
			</tr>
			<tr id="summaryEng">
				<th>뉴스 요약(영문)<span style="color:red;"> * </span></th>
				<td>
					<textarea class="uiTextArea sizeFull" name="summaryEng" maxlength="200">${socialContributionNews.summaryEng}</textarea>
					<label>최대 200자 까지 가능 합니다.</label>
				</td>
			</tr>
			<tr id="summaryChn">
				<th>뉴스 요약(중문)<span style="color:red;"> * </span></th>
				<td>
					<textarea class="uiTextArea sizeFull" name="summaryChn" maxlength="200">${socialContributionNews.summaryChn}</textarea>
					<label>최대 200자 까지 가능 합니다.</label>
				</td>
			</tr>
			<tr id="summaryJpn">
				<th>뉴스 요약(일문)<span style="color:red;"> * </span></th>
				<td>
					<textarea class="uiTextArea sizeFull" name="summaryJpn" maxlength="200">${socialContributionNews.summaryJpn}</textarea>
					<label>최대 200자 까지 가능 합니다.</label>
				</td>
			</tr>

			<tr id="contentKor">
				<th>내용(국문)<span style="color:red;"> * </span></th>
				<td>
					<textarea class="uiTextArea sizeFull" id="contentKor_editor" rows="5" cols="100" style="width:100%; height:200px; display:none;">${socialContributionNews.contentKor}</textarea>
				</td>
			</tr>
			<tr id="contentEng">
				<th>내용(영문)<span style="color:red;"> * </span></th>
				<td>
					<textarea class="uiTextArea sizeFull" id="contentEng_editor" rows="5" cols="100" style="width:100%; height:200px; display:none;">${socialContributionNews.contentEng}</textarea>
				</td>
			</tr>
			<tr id="contentChn">
				<th>내용(중문)<span style="color:red;"> * </span></th>
				<td>
					<textarea class="uiTextArea sizeFull" id="contentChn_editor" rows="5" cols="100" style="width:100%; height:200px; display:none;">${socialContributionNews.contentChn}</textarea>
				</td>
			</tr>
			<tr id="contentJpn">
				<th>내용(일문)<span style="color:red;"> * </span></th>
				<td>
					<textarea class="uiTextArea sizeFull" id="contentJpn_editor" rows="5" cols="100" style="width:100%; height:200px; display:none;">${socialContributionNews.contentJpn}</textarea>
				</td>
			</tr>

			<tr>
				<th>노출 여부<span style="color:red;"> * </span></th>
				<td>
					<input name="listExposureYn" id="listExposureN" type="radio" value="N" />
					<label for="listExposureN">미노출</label>
					<input name="listExposureYn" id="listExposureY" type="radio" value="Y" />
					<label for="listExposureY">노출</label>
				</td>
			</tr>
			<tr>
				<th>상단 노출 여부<span style="color:red;"> * </span></th>
				<td>
					<input name="topExposureYn" id="topExposureN" type="radio" value="N" />
					<label for="topExposureN">미노출</label>
					<input name="topExposureYn" id="topExposureY" type="radio" value="Y" />
					<label for="topExposureY">노출</label>
				</td>
			</tr>


			<tr>
				<th>게시일<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input type="text" name="releaseDt" class="datepicker_calendar" value="${socialContributionNews.releaseDt}" readonly />
					</span>
				</td>
			</tr>

			<tr>
				<th>등록일</th>
				<td>
					<span class="uiInput text">
						<fmt:formatDate value="${socialContributionNews.createDt}" pattern="yyyy-MM-dd"/>
					</span>
				</td>
			</tr>
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
				<a class="uiButton" href="${pageContext.request.contextPath}/admin/socialContributionNews/list?page=${page}&list_exposure_yn=${list_exposure_yn}&top_exposure_yn=${top_exposure_yn}&keyfield=${keyfield}&keyword=${keyword}"><span>목록</span></a>
			</td>
			<td align="right">
				<c:if test="${socialContributionNews == null}">
					<a class="uiButton" id="submit_btn"><span>등록${paging.currentPage}</span></a>
				</c:if>
				<c:if test="${socialContributionNews != null}">
					<a class="uiButton" id="submit_btn"><span>수정</span></a>
				</c:if>
			</td>
		</tr>
	</table>
</div>
<script>
	$(document).ready(function() {
		var f = document.frmEdit;
		var arrSmart = ["contentKor_editor", "contentEng_editor", "contentChn_editor", "contentJpn_editor"];

		var init = function(_topExposureYn, _listExposureYn){

			common.commonModule.checkedRadio(f.topExposureYn, _topExposureYn);
			common.commonModule.checkedRadio(f.listExposureYn, _listExposureYn);
			common.commonModule.setEditor(arrSmart); //스마트에디터 셋팅

			formChange($("#langKorYn").is(":checked"), 0);
			formChange($("#langEngYn").is(":checked"), 1);
			formChange($("#langChnYn").is(":checked"), 2);
			formChange($("#langJpnYn").is(":checked"), 3);

		};

		//다국어 노출 체크시 하단 내용 노출 여부
		var formChange = function(_checked, _order){
			var checkedResult = _checked;
			var arrayNumber = _order;
			var title = ["titleKor", "titleEng", "titleChn", "titleJpn"];
			var summary = ["summaryKor", "summaryEng", "summaryChn", "summaryJpn"];
			var content = ["contentKor", "contentEng", "contentChn", "contentJpn"];
			var arrSmart_iframe = ["contentKor_editor_iframe", "contentEng_editor_iframe", "contentChn_editor_iframe", "contentJpn_editor_iframe"];

			if(checkedResult){

				$("#"+title[arrayNumber]).show();
				$("#"+summary[arrayNumber]).show();
				$("#"+content[arrayNumber]).show();

				//익스에서 hide -> show 될 경우
				$("#"+arrSmart_iframe[arrayNumber]).css("height", "255px");
				//iframe height 0px으로 바뀌므로 강제 height 설정
				if(common.commonModule.setEditorResultObject().length > 1 ) {
					common.commonModule.setEditorResultObject().getById[arrSmart[arrayNumber]].exec("CHANGE_EDITING_MODE", ["WYSIWYG"]);
				}
			} else {
				/*
				$("textarea[name="+title[arrayNumber]+"]").text("");
				$("textarea[name="+summary[arrayNumber]+"]").html("");
				if(common.commonModule.setEditorResultObject().length > 1 ){
					common.commonModule.setEditorResultObject().getById[arrSmart[arrayNumber]].exec("SET_CONTENTS", [""]);
				}
				*/
				$("#"+title[arrayNumber]).hide();
				$("#"+summary[arrayNumber]).hide();
				$("#"+content[arrayNumber]).hide();

				$("#allchecked").attr("checked", false);  //국문, 영문, 중문 한개라도 체크 안될시 전체 체크박스 체크 해제
			}

			// 국문, 영문, 중문, 일문 선택시 전체 체크박스 체크
			if(
					    $("input:checkbox[id='langKorYn']").is(":checked")  &&  $("input:checkbox[id='langEngYn']").is(":checked")
					&&  $("input:checkbox[id='langChnYn']").is(":checked")  &&  $("input:checkbox[id='langJpnYn']").is(":checked")  ){

				$("#allchecked").attr("checked", true);
			}

		};

		$("#allchecked").bind("click", function(){
			common.commonModule.allCheck("langKorYn", this);
			common.commonModule.allCheck("langEngYn", this);
			common.commonModule.allCheck("langChnYn", this);
			common.commonModule.allCheck("langJpnYn", this);

			if($(this).is(":checked")){
				formChange(true, 0);
				formChange(true, 1);
				formChange(true, 2);
				formChange(true, 3);
			} else {
				formChange(false, 0);
				formChange(false, 1);
				formChange(false, 2);
				formChange(false, 3);
			}

		});

		$("#langKorYn").bind("click", function(){
			formChange($(this).is(":checked"), 0);
		});
		$("#langEngYn").bind("click", function(){
			formChange($(this).is(":checked"), 1);
		});
		$("#langChnYn").bind("click", function(){
			formChange($(this).is(":checked"), 2);
		});
		$("#langJpnYn").bind("click", function(){
			formChange($(this).is(":checked"), 3);
		});
		$("#submit_btn").bind("click", function(){
			var exposureLang = 0;
			for(var i=0; i<$(".exposureLang").length; i++){
				if($(".exposureLang")[i].checked){
					exposureLang++;
				}
			}
			if(exposureLang == 0){ alert("다국어 노출을 선택하십시오."); return; }
			/* if(f.topImgPath.value == ""){ if(!common.commonModule.isCheck(f.topImg, "상단이미지를 등록하십시오.", "")) { return; } }
			if(f.listImgPath.value == ""){ if(!common.commonModule.isCheck(f.listImg, "리스트이미지를 등록하십시오.", "")) { return; } } */
			if(!common.commonModule.isCheck(f.topImgAlt, "상단 ALT 태그를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.topExposureYn, "상단 노출 여부를 선택하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.listExposureYn, "리스트 노출 여부를 선택하십시오.", "")) { return; }
			if($("#langKorYn").is(":checked")){
				if(!common.commonModule.isCheck(f.titleKor, "제목(국문)을 입력하십시오.", "")) { return; }
				if(!common.commonModule.isCheck(f.summaryKor, "뉴스 요약(국문)을 입력하십시오.", "")) { return; }
				if(!common.commonModule.isCheck(f.contentKor, "내용(국문)을 입력하십시오.", "")) { return; }
			}
			if($("#langEngYn").is(":checked")){
				if(!common.commonModule.isCheck(f.titleEng, "제목(영문)을 입력하십시오.", "")) { return; }
				if(!common.commonModule.isCheck(f.summaryEng, "뉴스 요약(영문)을 입력하십시오.", "")) { return; }
				if(!common.commonModule.isCheck(f.contentEng, "내용(영문)을 입력하십시오.", "")) { return; }
			}
			if($("#langChnYn").is(":checked")){
				if(!common.commonModule.isCheck(f.titleChn, "제목(중문)을 입력하십시오.", "")) { return; }
				if(!common.commonModule.isCheck(f.summaryChn, "뉴스 요약(중문)을 입력하십시오.", "")) { return; }
				if(!common.commonModule.isCheck(f.contentChn, "내용(중문)을 입력하십시오.", "")) { return; }
			}
			if($("#langJpnYn").is(":checked")){
				if(!common.commonModule.isCheck(f.titleJpn, "제목(일문)을 입력하십시오.", "")) { return; }
				if(!common.commonModule.isCheck(f.summaryJpn, "뉴스 요약(일문)을 입력하십시오.", "")) { return; }
				if(!common.commonModule.isCheck(f.contentJpn, "내용(일문)을 입력하십시오.", "")) { return; }
			}
			if(!common.commonModule.isCheck(f.releaseDt, "게시일을 등록하십시오.", "")) { return; }


			f.submit();
		});
		init("${socialContributionNews.topExposureYn}", "${socialContributionNews.listExposureYn}");
	});
</script>