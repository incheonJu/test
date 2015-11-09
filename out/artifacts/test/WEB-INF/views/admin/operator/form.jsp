<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="mode" value="${operator == null ? '/admin/operator/insert' : '/admin/operator/update'}" />
<form method="post" name="frmEdit" action="${mode}">
<input type="hidden" name="seq" value="${operator.seq}" />
<input type="hidden" name="chkYN" value="${operator == null ? 'N' : 'Y'}" />
<div id="area_base">
	<table class="uiTable write">
		<colgroup>
			<col style="width:130px" />
			<col />
		</colgroup> 
		<tbody>
			<tr>
				<th>이름(국문)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="nameKor" type="text" value="${operator.nameKor}" maxlength="10" />
						<label for="nameKor">국문 이름을 입력해 주시기 바랍니다.</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>이름(영/중문)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="nameEng" type="text" value="${operator.nameEng}" />
						<label for="nameEng">Hong Gil Dong 형태로 입력 해주시기 바랍니다.</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>이메일<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input id="email" name="email" type="text" class="onlyEng" value="${operator.email}" <c:if test="${operator != null}"> readonly </c:if> />
						@
						<input name="emailHost" type="text" value="${operator == null ? 'polychem.co.kr' : operator.emailHost}" readonly />
						<label id="label_duplication">이메일은 아이디로 사용 됩니다.</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>패스워드<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="password" type="password" maxlength="20" value="${operator.password}" />
						<label for="password"><c:if test="${not empty operator.password }">패스워드 변경시에만 입력 하세요.&nbsp;</c:if>패스워드는 최대 8자 이상, 20자 미만만 가능합니다.</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>팀(국문)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="deptName" type="text" value="${operator.deptName}" />
					</span>
				</td>
			</tr>
			<tr>
				<th>팀(영/중문)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="deptNameEng" type="text" value="${operator.deptNameEng}" />
					</span>
				</td>
			</tr>
			<tr>
				<th>Tel(국내)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="tel1Kor" type="text" class="onlyNum" value="${operator.tel1Kor}" maxlength="4" />
						<input name="tel2Kor" type="text" class="onlyNum" value="${operator.tel2Kor}" maxlength="4" />
						<input name="tel3Kor" type="text" class="onlyNum" value="${operator.tel3Kor}" maxlength="4" />
						<label for="tel3Kor">숫자만 입력 가능합니다</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>Tel(해외)<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput text">
						<input name="tel1Eng" type="text" class="onlyNum" value="${operator.tel1Eng}" maxlength="4" />
						<input name="tel2Eng" type="text" class="onlyNum" value="${operator.tel2Eng}" maxlength="4" />
						<input name="tel3Eng" type="text" class="onlyNum" value="${operator.tel3Eng}" maxlength="4" />
						<label for="tel3Eng">숫자만 입력 가능합니다</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>구분<span style="color:red;"> * </span></th>
				<td>
					<span class="uiSelect">
						<select id="typeCd" name="typeCd">
							<option value="">선택하세요</option>
							<option value="100">제품 관리자</option>
							<option value="200">컨텐츠 관리자</option>
							<option value="300">제품구입처 관리자</option>
							<option value="400">문의 관리자</option>
							<!-- 000 일시에 슈퍼관리자 -->
						</select>
					</span>
				</td>
			</tr>
			<sec:authorize ifAnyGranted="ROLE_ADMIN">
				<!--제품관리 목록 checkbox 선택여부 -->
				<input type="hidden" name="epdmYn" value="${operator.epdmYn == 'checked' ? 'Y' : 'N'}" />
				<input type="hidden" name="tpv_kepaYn" value="${operator.tpv_kepaYn == 'checked' ? 'Y' : 'N'}" />

				<!--컨텐츠 관리 목록 checkbox 선택여부 -->
				<input type="hidden" name="socialContributionNewsYn" value="${operator.socialContributionNewsYn == 'checked' ? 'Y' : 'N'}" />
				<input type="hidden" name="noticeYn" value="${operator.noticeYn == 'checked' ? 'Y' : 'N'}" />

				<input type="hidden" name="note" value="${operator.note}" />
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_SUPER_ADMIN">
			<tr id="product_list">
				<th>제품 관리 목록<span style="color:red;"> * </span></th>
				<div>
				<td>
					<span class="uiInput check">
						<input name="epdmYn" id="epdmYn" type="checkbox" value="Y" ${operator.epdmYn} />
						<label for="epdmYn">EPDM</label>
						<input name="tpv_kepaYn" id="tpv_kepaYn" type="checkbox" value="Y" ${operator.tpv_kepaYn} />
						<label for="tpv_kepaYn">TPV/KEPA</label>
					</span>
				</td>
			</tr>
			<tr id="content_list">
				<th>컨텐츠 관리 목록<span style="color:red;"> * </span></th>
				<div>
					<td>
				<span class="uiInput check">
					<input name="socialContributionNewsYn" id="socialContributionNewsYn" type="checkbox" value="Y" ${operator.socialContributionNewsYn} />
					<label for="socialContributionNewsYn">사회공헌소식지관리</label>
					<input name="noticeYn" id="noticeYn" type="checkbox" value="Y" ${operator.noticeYn} />
					<label for="noticeYn">공지사항관리</label>
				</span>
					</td>
			</tr>
			<tr id="productSale_list">
				<th>제품구입처 선택<span style="color:red;"> * </span></th>
				<div>
					<td>
						<span class="uiSelect">
							<select id="productSaleCd" name="productSaleCd">
								<option value="">선택</option>
								<option value="310">국내영업팀</option>
								<option value="320">해외영업팀</option>
								<option value="330">기술문의</option>
								<option value="340">납품문의</option>
								<option value="350">채용문의</option>
							</select>&nbsp;

							<select id="productSaleDtlCd" name="productSaleDtlCd">
								<option value="">선택</option>
								<option name="320" value="321">아시아</option>
								<option name="320" value="322">미주, 유럽</option>
								<option name="330" value="331">EPDM 문의</option>
								<option name="330" value="332">TPV/KEPA 문의</option>
							</select>&nbsp;
						</span>
					</td>
			</tr>
			</sec:authorize>
		</tbody>
	</table>
</div>
<sec:authorize ifAnyGranted="ROLE_SUPER_ADMIN">
<div id="area_memo">
	<table class="uiTable write">
		<colgroup>
			<col style="width:130px"/>
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>추가 메모</th>
				<td>
					<textarea class="uiTextArea sizeFull" name="note" maxlength="200">${operator.note}</textarea>
					<label for="testLabel1">최대 200자 까지 가능 합니다.</label>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</sec:authorize>
</form>
<div id="single_btn">
	<table>
		<tr>
			<td height="20">&nbsp;</td>
		</tr>
		<tr>
			<sec:authorize ifAnyGranted="ROLE_SUPER_ADMIN">
			<td align="left">
				<a class="uiButton" href="javascript:history.go(-1);"><span>목록</span></a>
			</td>
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_SUPER_ADMIN, ROLE_ADMIN">
			<td align="right">
				<c:if test="${operator == null}">
					<a class="uiButton" id="submit_btn"><span>등록</span></a>
				</c:if>
				<c:if test="${operator != null}">
					<a class="uiButton" id="submit_btn"><span>수정</span></a>
				</c:if>
			</td>
			</sec:authorize>
		</tr>
	</table>
</div>
<script>
	$(document).ready(function() {
		var f = document.frmEdit;
		var operator = "${operator}";
		var init = function(_typeCd, _productSaleCd, _productSaleDtlCd){
			typeCode($.trim(_typeCd));
			productSaleChange($.trim(_productSaleCd));

			f.typeCd.value = $.trim(_typeCd);
			
			<sec:authorize ifAnyGranted="ROLE_SUPER_ADMIN">
				f.productSaleCd.value = $.trim(_productSaleCd);
				f.productSaleDtlCd.value = $.trim(_productSaleDtlCd);

			</sec:authorize>
		};
		
		var typeCode = function(_value){
			if(_value == "100"){
				$("#product_list").show();
				$("#content_list").hide();
				$("#productSale_list").hide();
			} else if(_value == "200"){
				$("#product_list").hide();
				$("#content_list").show();
				$("#productSale_list").hide();
			}else if(_value == "300"){
				$("#product_list").hide();
				$("#content_list").hide();
				$("#productSale_list").show();
			} else if(_value == "400"){
				$("#product_list").hide();
				$("#content_list").hide();
				$("#productSale_list").hide();
			} else {
				$("#product_list").hide();
				$("#content_list").hide();
				$("#productSale_list").hide();
			}
		};

		var productSaleChange = function(_value){
			$("#productSaleDtlCd").val(""); //제품 구입처 상세 셀렉트박스 초기화
			var html = "";
			if(_value == "320"){
				$("#productSaleCd").show();
				$("option[name='320']").show(); //해외영업팀(320)
				$("option[name='330']").hide(); //기술문의(330)
				$("#productSaleDtlCd").show();
			} else if(_value == "330"){
				$("#productSaleCd").show();
				$("option[name='320']").hide(); //해외영업팀(320)
				$("option[name='330']").show(); //기술문의(330)
				$("#productSaleDtlCd").show();
			} else {
				$("#productSaleDtlCd").hide();
			}
		};

		var divisionValueReset = function(){
			$("input:checkbox[id='epdmYn']").attr("checked", false);
			$("input:checkbox[id='tpv_kepaYn']").attr("checked", false);
			$("input:checkbox[id='socialContributionNewsYn']").attr("checked", false);
			$("input:checkbox[id='noticeYn']").attr("checked", false);
			$("#productSaleCd option:selected").val("");
			$("#productSaleDtlCd option:selected").val("");
		};

		$("#submit_btn").bind("click", function(){
			if(!common.commonModule.isCheck(f.nameKor, "이름(국문)을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.nameEng, "이름(영문)을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.email, "이메일을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.emailHost, "이메일을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.chkYN, "중복된 메일계정입니다.", "N", f.email)) { return; }
			if(!common.commonModule.isCheck(f.password, "패스워드를 입력하십시오.", "")) { return; }
			if(f.password.value.length <= 7){ alert('비밀번호는 8자 이상 20자 사이까지 가능합니다.'); f.password.focus(); return false; }
			if(!common.commonModule.isCheck(f.deptName, "팀(국문)을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.deptNameEng, "팀(영/중문)을 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.tel1Kor, "국내전화번호를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.tel2Kor, "국내전화번호를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.tel3Kor, "국내전화번호를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.tel1Eng, "해외전화번호를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.tel2Eng, "해외전화번호를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.tel3Eng, "해외전화번호를 입력하십시오.", "")) { return; }
			if(!common.commonModule.isCheck(f.typeCd, "구분을 선택하십시오.", "")) { return; }
			
			<sec:authorize ifAnyGranted="ROLE_SUPER_ADMIN">
			if(f.typeCd.value == "300"){
				if(!common.commonModule.isCheck(f.productSaleCd, "제품구입처를 선택하십시오.", "")) {
					return;
				}else if(f.productSaleCd.value == "320" || f.productSaleCd.value == "330"){
					if(!common.commonModule.isCheck(f.productSaleDtlCd, "제품구입처 상세를 선택하십시오.", "")) {
						return;
					}
				}
			}
			</sec:authorize>
			f.submit();
		});
		
		$("#email").on({
			"keyup" : function(){
				if(operator == ""){
					var email = $(this).val();
					var emailHost = f.emailHost.value;
					var url = "/admin/operator/checkId?email="+email+"&host="+emailHost;
					if(email. length > 0) {
						$.ajax({
							type: "GET"
							, async: false
							, url: url
							, dataType: "json"
							, error: function (xhr, textStatus, errorThrown) {
								alert('통신 장애가 발생하였습니다. 관리자에게 하시기 바랍니다.');
								f.chkYN.value = 'N';
							}
							, success: function (d) {
								if (d == true) {
									$("#label_duplication").html("<span  style='color:red'>중복된 메일계정입니다.</span>");
									f.chkYN.value = 'N';
								} else {
									$("#label_duplication").html("<span style='color:blue'>사용할 수 있는 메일계정입니다.</span>");
									f.chkYN.value = 'Y';
								}
							}
						});
					}
				}
			}
		});
				
		$("#typeCd").bind("change", function(){
			divisionValueReset();
			typeCode($(this).val());	
		});

		$("#productSaleCd").bind("change", function(){
			productSaleChange($(this).val());
		});

		init("${operator.typeCd}", "${operator.productSaleCd}", "${operator.productSaleDtlCd}");
	});
</script>