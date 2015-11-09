<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:set var="mode" value="${popup == null ? '/admin/popup/insert' : '/admin/popup/update'}" />
<form method="post" name="frmEdit" action="${mode}">
<input type="hidden" name="seq" value="${popup.seq}" />
<input type="hidden" name="delYn" value="N"/>
<input type="hidden" name="useYn" value="Y"/>
<%-- <input type="hidden" name="content" value="${popup.content}" /> --%>
<input type="hidden" name="content" value="" />
<input type="hidden" name="positionCd" value="000" />
<div id="area_base">
	<table class="uiTable write">
		<colgroup>
			<col style="width:150px" />
			<col />
		</colgroup> 
		<tbody>
			<tr>
				<th>제목<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="title" type="text" value="${popup.title}" maxlength="20" />
						<label for="title">최대 20자까지 가능합니다.</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>기간 설정<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input id="startDt" name="startDt" class="datepicker_calendar" type="text" value="${popup.startDt}" readonly />
						~
						<input id="endDt" name="endDt" class="datepicker_calendar" type="text" value="${popup.endDt}" readonly />
					</span>
				</td>
			</tr>
			<tr>
				<th>내용<span style="color:red;"> * </span></th>
				<td>
					<textarea id="content_editor" class="uiTextArea sizeFull" maxlength="250">${popup.content}</textarea>
					<label for="content">최대 250자까지 가능합니다.</label>
				</td>
			</tr>
			<tr>
				<th>사이즈<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						w <input id="widthNum" name="widthNum" type="text" class="onlyNum" value="${popup.widthNum}" />
						&nbsp;
						h <input id="heightNum" name="heightNum" type="text" class="onlyNum" value="${popup.heightNum}" />
						<label for="heightNum">숫자만 입력 가능합니다.</label>
					</span>
				</td>
			</tr>
			<!-- <tr>
				<th>포지션 설정</th>
				<td>
					<input name="positionCd" type="radio" value="100" />
					<label>상단좌측</label>
					<input name="positionCd" type="radio" value="200" />
					<label>상단중앙</label>
					<input name="positionCd" type="radio" value="300" />
					<label>상단우측</label>
				</td>
			</tr> -->
			<tr>
				<th>링크버튼 활성 여부<span style="color:red;"> * </span></th>
				<td>
					<input name="linkYn" type="radio" value="Y" />
					<label >활성</label>
					<input name="linkYn" type="radio" value="N" />
					<label >비활성</label>
				</td>
			</tr>
			<tr id="linkTitle">
				<th>링크이름<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="linkTitle" type="text" value="${popup.linkTitle}" maxlength="10" />
						<label >최대 10자까지 가능합니다.</label>
					</span>
				</td>
			</tr>
			<tr id="linkUrl">
				<th>URL<span style="color:red;"> * </span></th>
				<td>	
					<span class="uiInput text sizeHalf">
						<input name="linkUrl" type="text" value="${popup.linkUrl}" style="width:400px;" />
					</span>
				</td>
			</tr>
			<tr>
				<th>노출부문<span style="color:red;"> * </span></th>
				<td>
					<input name="exposureCd" type="radio" value="100" />
					<label >국문</label>
					<input name="exposureCd" type="radio" value="200" />
					<label >영문</label>
					<input name="exposureCd" type="radio" value="400" />
					<label >중문</label>
					<input name="exposureCd" type="radio" value="300" />
					<label >일문</label>
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
				<a class="uiButton" href="javascript:history.go(-1);"><span>목록</span></a>
			</td>
			<td align="right">
				<c:if test="${popup == null}">
					<a class="uiButton" id="submit_btn"><span>등록</span></a>
				</c:if>
				<c:if test="${popup != null}">
					<a class="uiButton" id="submit_btn"><span>수정</span></a>
				</c:if>
			</td>
		</tr>
	</table>
</div>
<script>
	$(document).ready(function() {
		var f = document.frmEdit;
		var langCount = {"100" : "${langCnt.KOR_CNT}",
						 "200" : "${langCnt.ENG_CNT}",
						 "300" : "${langCnt.CHN_CNT}",
						 "400" : "${langCnt.JPN_CNT}"};
		var init = function(_linkYn, _exposureCd){
			var arrSmart = ["content_editor"];
			common.commonModule.checkedRadio(f.linkYn, _linkYn);
			common.commonModule.checkedRadio(f.exposureCd, _exposureCd);
			
			common.commonModule.setEditor(arrSmart);
			
			linkYn(_linkYn);
		};
		
		var linkYn = function(_value){
			if(_value == "N"){
				$("#linkTitle").hide();
				$("#linkUrl").hide();
			} else {
				$("#linkTitle").show();
				$("#linkUrl").show();				
			}
		};
		
		$("input[name=linkYn]").bind("click", function(){
			linkYn($(this).val());
		});
		
		$("#submit_btn").bind("click", function(){
			/* if(langCount[common.commonModule.checkedRadioValue(f.exposureCd)] >= 3){
				alert('팝업 등록은 언어당 3개까지 등록이 가능합니다.');
				return false;
			} */
			if(!common.commonModule.isCheck(f.title, "제목을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.startDt, "기간을 설정하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.endDt, "기간을 설정하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.content, "내용을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.widthNum, "Width 크기를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.heightNum, "Height 크기를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.linkYn, "링크버튼 활성 여부를 선택하십시오.", "")) { return; }
			if(common.commonModule.checkedRadioValue(f.linkYn) == "Y"){
				if(!common.commonModule.isCheck(f.linkTitle, "링크이름을 입력하십시오.", "")) { return; }
				if(!common.commonModule.isCheck(f.linkUrl, "링크URL을 입력하십시오.", "")) { return; }	
			}
			if(!common.commonModule.isCheck(f.exposureCd, "노출부문을 선택하십시오.", "")) { return; }
			f.submit();
		});
				
		init("${popup.linkYn}", "${popup.exposureCd}");
	});
</script>