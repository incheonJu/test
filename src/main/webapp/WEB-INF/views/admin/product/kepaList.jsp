<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form method="post" name="frmEdit" action="${pageContext.request.contextPath}/admin/productKEPA/update" enctype="multipart/form-data">
<input type="hidden" id="kepaSeq" name="productKEPA.seq" value="${productKEPA.seq == null ? 0 : productKEPA.seq}" />
<input type="hidden" id="kepaDtlSeq" name="kepaDtlSeq" value="${productKEPA_DTL_SingleInfo.seq == null ? 0 : productKEPA_DTL_SingleInfo.seq}" />
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
						<input type="checkbox" id="allchecked" class="exposureLang"/>
						<label for="allchecked">전체</label>
						<input name="langKorYn" class="exposureLang" id="langKorYn" type="checkbox" value="Y" ${productKEPA.langKorYn} />
						<label for="langKorYn">국문</label>
						<input name="langEngYn" class="exposureLang" id="langEngYn" type="checkbox" value="Y" ${productKEPA.langEngYn} />
						<label for="langEngYn">영문</label>
						<input name="langChnYn" class="exposureLang" id="langChnYn" type="checkbox" value="Y" ${productKEPA.langChnYn} />
						<label for="langChnYn">중문</label>
						<input name="langJpnYn" class="exposureLang" id="langJpnYn" type="checkbox" value="Y" ${productKEPA.langJpnYn} />
						<label for="langJpnYn">일문</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>노출 여부<span style="color:red;"> * </span></th>
				<td>
					<input id="exposureY" name="exposureYn" type="radio" value="N" />
					<label for="exposureY">미노출</label>
					<input id="exposureN" name="exposureYn" type="radio" value="Y" />
					<label for="exposureN">노출</label>
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>
					<span class="uiInput text size300">
						<fmt:formatDate value="${productKEPA.createDt}" pattern="yyyy-MM-dd"/>
					</span>
				</td>
			</tr>
			</tbody>
		</table>

		<table class="uiTable write">
			<colgroup>
				<col style="width:150px" />
				<col style="width:250px" />
				<col style="width:100px" />
				<col style="width:70px" />
				<col />
			</colgroup>
			<tr name="add_product_kepa_tr">
				<th style="background-color:#888888;">제품 추가</th>
				<td >
					<span class="uiInput text size200">
						<input type="text" id="add_productName" name="add_productName" value="" maxlength="20" />
					</span>
				</td>
				<th style="background-color:#888888;">출력순서</th>
				<td >
					<span class="uiInput text size50">
						<input type="text" id="add_productOrder" name="add_productOrder" class="onlyNum" value="" maxlength="2" />
					</span>
				</td>
				<td >
					<span style="margin-left:50px;">
						<a id="_kepa" name="addButton" href="javascript:" class="uiButton"><span>등록</span></a>
					</span>
				</td>
			</tr>
			<c:if test="${productKEPA_DTL != null}">
			<c:forEach var="data" items="${productKEPA_DTL}" varStatus="i">
				<tr>
					<th>제품명</th>
					<td>
					<span class="uiInput text size200">
						<input type="text" name="productName" value="${data.productName}" maxlength="20" />
					</span>
					</td>
					<th>출력순서</th>
					<td>
					<span class="uiInput text size50">
						<input type="text" name="productOrder" value="${data.productOrder}" maxlength="2" />
					</span>
					</td>
					<td>
					<span style="margin-left:50px;">
						<a onclick="delButton('${data.seq}');" class="uiButton"><span>삭제</span></a>
					</span>
					</td>
				</tr>
				<input type="hidden" name="seq" value="${data.seq}"/>
			</c:forEach>
			</c:if>
			</tbody>
		</table>

		<div class="uiTabmenu2">
			<ul>
				<c:if test="${productKEPA_DTL != null}">
				<c:forEach var="data" items="${productKEPA_DTL}" varStatus="i">
					<li><input name="radio_kepa" id="radio${i.index}" value="${data.seq}" type="radio"><label for="radio${i.index}" style="line-height:30px" >${data.productName}</label></li>
				</c:forEach>
				</c:if>
			</ul>
		</div>

		<div>
			<div id="area_kepa_kor" style="margin-top:20px;">
				<strong>====국문====</strong>
				<table class="uiTable write">
					<colgroup>
						<col style="width:30%"/>
						<col style="width:30%"/>
						<col style="width:40%"/>
					</colgroup>
					<thead>
					<tr>
						<th>Physical properties</th>
						<th>Value</th>
						<th>Test method</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesKor1" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesKor1}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueKor1" type="text" value="${productKEPA_DTL_SingleInfo.valueKor1}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodKor1" type="text" value="${productKEPA_DTL_SingleInfo.testMethodKor1}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesKor2" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesKor2}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueKor2" type="text" value="${productKEPA_DTL_SingleInfo.valueKor2}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodKor2" type="text" value="${productKEPA_DTL_SingleInfo.testMethodKor2}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesKor3" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesKor3}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueKor3" type="text" value="${productKEPA_DTL_SingleInfo.valueKor3}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodKor3" type="text" value="${productKEPA_DTL_SingleInfo.testMethodKor3}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesKor4" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesKor4}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueKor4" type="text" value="${productKEPA_DTL_SingleInfo.valueKor4}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodKor4" type="text" value="${productKEPA_DTL_SingleInfo.testMethodKor4}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesKor5" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesKor5}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueKor5" type="text" value="${productKEPA_DTL_SingleInfo.valueKor5}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodKor5" type="text" value="${productKEPA_DTL_SingleInfo.testMethodKor5}" />
							</span>
						</td>
					</tr>
					</tbody>
				</table>
			</div>

			<div id="area_kepa_eng" style="margin-top:20px;">
				<strong>====영문====</strong>
				<table class="uiTable write">
					<colgroup>
						<col style="width:30%"/>
						<col style="width:30%"/>
						<col style="width:40%"/>
					</colgroup>
					<thead>
					<tr>
						<th>Physical properties</th>
						<th>Value</th>
						<th>Test method</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesEng1" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesEng1}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueEng1" type="text" value="${productKEPA_DTL_SingleInfo.valueEng1}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodEng1" type="text" value="${productKEPA_DTL_SingleInfo.testMethodEng1}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesEng2" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesEng2}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueEng2" type="text" value="${productKEPA_DTL_SingleInfo.valueEng2}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodEng2" type="text" value="${productKEPA_DTL_SingleInfo.testMethodEng2}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesEng3" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesEng3}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueEng3" type="text" value="${productKEPA_DTL_SingleInfo.valueEng3}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodEng3" type="text" value="${productKEPA_DTL_SingleInfo.testMethodEng3}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesEng4" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesEng4}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueEng4" type="text" value="${productKEPA_DTL_SingleInfo.valueEng4}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodEng4" type="text" value="${productKEPA_DTL_SingleInfo.testMethodEng4}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesEng5" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesEng5}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueEng5" type="text" value="${productKEPA_DTL_SingleInfo.valueEng5}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodEng5" type="text" value="${productKEPA_DTL_SingleInfo.testMethodEng5}" />
							</span>
						</td>
					</tr>
					</tbody>
				</table>
			</div>

			<div id="area_kepa_chn" style="margin-top:20px;">
				<strong>====중문====</strong>
				<table class="uiTable write">
					<colgroup>
						<col style="width:30%"/>
						<col style="width:30%"/>
						<col style="width:40%"/>
					</colgroup>
					<thead>
					<tr>
						<th>Physical properties</th>
						<th>Value</th>
						<th>Test method</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesChn1" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesChn1}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueChn1" type="text" value="${productKEPA_DTL_SingleInfo.valueChn1}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodChn1" type="text" value="${productKEPA_DTL_SingleInfo.testMethodChn1}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesChn2" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesChn2}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueChn2" type="text" value="${productKEPA_DTL_SingleInfo.valueChn2}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodChn2" type="text" value="${productKEPA_DTL_SingleInfo.testMethodChn2}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesChn3" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesChn3}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueChn3" type="text" value="${productKEPA_DTL_SingleInfo.valueChn3}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodChn3" type="text" value="${productKEPA_DTL_SingleInfo.testMethodChn3}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesChn4" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesChn4}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueChn4" type="text" value="${productKEPA_DTL_SingleInfo.valueChn4}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodChn4" type="text" value="${productKEPA_DTL_SingleInfo.testMethodChn4}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesChn5" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesChn5}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueChn5" type="text" value="${productKEPA_DTL_SingleInfo.valueChn5}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodChn5" type="text" value="${productKEPA_DTL_SingleInfo.testMethodChn5}" />
							</span>
						</td>
					</tr>
					</tbody>
				</table>
			</div>

			<div id="area_kepa_jpn" style="margin-top:20px;">
				<strong>====일문====</strong>
				<table class="uiTable write">
					<colgroup>
						<col style="width:30%"/>
						<col style="width:30%"/>
						<col style="width:40%"/>
					</colgroup>
					<thead>
					<tr>
						<th>Physical properties</th>
						<th>Value</th>
						<th>Test method</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesJpn1" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesJpn1}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueJpn1" type="text" value="${productKEPA_DTL_SingleInfo.valueJpn1}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodJpn1" type="text" value="${productKEPA_DTL_SingleInfo.testMethodJpn1}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesJpn2" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesJpn2}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueJpn2" type="text" value="${productKEPA_DTL_SingleInfo.valueJpn2}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodJpn2" type="text" value="${productKEPA_DTL_SingleInfo.testMethodJpn2}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesJpn3" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesJpn3}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueJpn3" type="text" value="${productKEPA_DTL_SingleInfo.valueJpn3}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodJpn3" type="text" value="${productKEPA_DTL_SingleInfo.testMethodJpn3}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesJpn4" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesJpn4}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueJpn4" type="text" value="${productKEPA_DTL_SingleInfo.valueJpn4}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodJpn4" type="text" value="${productKEPA_DTL_SingleInfo.testMethodJpn4}" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="uiInput text sizeFull">
								<input name="physicalPropertiesJpn5" type="text" value="${productKEPA_DTL_SingleInfo.physicalPropertiesJpn5}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="valueJpn5" type="text" value="${productKEPA_DTL_SingleInfo.valueJpn5}" />
							</span>
						</td>
						<td>
							<span class="uiInput text sizeFull">
								<input name="testMethodJpn5" type="text" value="${productKEPA_DTL_SingleInfo.testMethodJpn5}" />
							</span>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div>
			<table>
				<tr>
					<td height="20">&nbsp;</td>
				</tr>
				<tr>
					<td align="right">
						<a class="uiButton" name="updateButton"><span>확인</span></a>
						<!--
						<a class="uiButton" name="cancelButton"><span>취소</span></a>
						-->
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>

<script>
	var f = document.frmEdit;
	$( document ).ready(function() {
		common.commonModule.checkedRadio(f.exposureYn, '${productKEPA.exposureYn}');
		if ( $("input[name='radio_kepa']").length > 0  ) {
				common.commonModule.checkedRadio(document.frmEdit.radio_kepa, "${productKEPA_DTL_SingleInfo.seq}");
		}

		formChange($("input[name='radio_kepa']:checked").val());
	});

	$("#allchecked").on('click', function(){
		common.commonModule.allCheck("langKorYn", this);
		common.commonModule.allCheck("langEngYn", this);
		common.commonModule.allCheck("langChnYn", this);
		common.commonModule.allCheck("langJpnYn", this);
	});

	$(".exposureLang").bind("click", function(){
		formChange($("input[name='radio_kepa']:checked").val());
	});



	//등록버튼 클릭시
	$("a[name='addButton']").on('click', function(){

		var add_productNameCheck = false;

		if($("input[name='add_productName']").val() == ""){
			alert("제품명을 입력하십시오.");
			$("input[name='add_productName']").focus();
			return;
		}

		if($("input[name='add_productOrder']").val() == "")  {
			alert("출력순서를 입력하십시오.");
			$("input[name='add_productOrder']").focus();
			return;
		}else if($("input[name='add_productOrder']").val() == "0"){
			alert("0은 입력할 수 없습니다.");
			$("input[name='add_productOrder']").val("");
			$("input[name='add_productOrder']").focus();
			return;
		}

		var addProductName = $("#add_productName").val();
		var addOrder = $("#add_productOrder").val();
		var kepaSeq = $("#kepaSeq").val();

		var url = "/admin/productKEPA/insert?addProductName=" + addProductName + "&addOrder=" + addOrder + "&kepaSeq=" + kepaSeq;
		$(location).attr("href", url);

	});

	function delButton(_delProductSeq) {

		var url = "/admin/productKEPA/delete?delProductSeq=" + _delProductSeq;
		$(location).attr("href", url);
	}

	//확인버튼 클릭시
	$("a[name='updateButton']").on('click', function(){
		if(!common.commonModule.isCheck(f.exposureYn, "노출 여부를 선택하십시오.", "")) { return; }
		
		$( "form[name='frmEdit']" ).submit();
	});

	$("input[name='radio_kepa']").on('change', function(){
		//$('#productSeq').val($(this).val());
		var kepaSeq = $('#kepaSeq').val();
		var productSeq = $("input[name='radio_kepa']:checked").val();
		var url = "/admin/productKEPA/list?&seq="+kepaSeq + "&productSeq=" + productSeq;
		$(location).attr("href", url);

	});

	var formChange = function(){
		$(".exposureLang").each(function(index) {
			if($(this).is(":checked") == true){
				if(index == 1) {
					$("#area_kepa_kor").show();
				}else if(index == 2) {
					$("#area_kepa_eng").show();
				}else if(index == 3) {
					$("#area_kepa_chn").show();
				}else if(index == 4) {
					$("#area_kepa_jpn").show();
				}
			}else{
				$("#allchecked").attr("checked", false);  //국문, 영문, 중문 한개라도 체크 안될시 전체 체크박스 체크 해제
				if(index == 1) {
					$("#area_kepa_kor").hide();
				}else if(index == 2) {
					$("#area_kepa_eng").hide();
				}else if(index == 3) {
					$("#area_kepa_chn").hide();
				}else if(index == 4) {
					$("#area_kepa_jpn").hide();
				}
			}
		});
		// 국문, 영문, 중문, 일문 선택시 전체 체크박스 체크
		if(
				$("input:checkbox[id='langKorYn']").is(":checked")  &&  $("input:checkbox[id='langEngYn']").is(":checked")
				&&  $("input:checkbox[id='langChnYn']").is(":checked")  &&  $("input:checkbox[id='langJpnYn']").is(":checked")  ){

			$("#allchecked").attr("checked", true);
		}

	};
</script>