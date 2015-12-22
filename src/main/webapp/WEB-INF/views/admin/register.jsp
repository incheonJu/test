<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>처리자 회원 가입</title>
	<link href="${pageContext.request.contextPath}/js/lib/jqueryUI/css/custom-theme/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/form_function.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/jquery-ui.js"></script>
	<style type="text/css">
		.searchZipCodeList{height: 22px ;}
	</style>
</head>

<body>
	    <div id="joinAreaBg">
	    	<div class="joinArea">
	        	<h2 class="title">처리자 회원가입 </h2>
					<sf:form id="operatorForm" modelAttribute="operator" action="${pageContext.request.contextPath}/admin/operator/operRegister">
						<table class="table_mem">
							<tr>
								<th width="15%" scope="col">* 아이디</th>
								<td colspan="3">
									<sf:input path="operId" size="30" maxlength="32" style="ime-mode:disabled;" onkeyup="NoHanGle(event, this);checkID()" />
									<input type="hidden" id="isCheckID" value="false" >
									<span id="idCheckResult">아이디는 6글자 이상, 12글자 이하입니다.</span>
								</td>
							</tr>
							<tr>
								<th scope="col">* 이름</th>
								<td colspan="3">
									<sf:input path="operName" size="30" maxlength="6"/>
								</td>
							</tr>
							<tr>
								<th scope="col">* 비밀번호</th>
								<td colspan="3">
									<sf:password path="operPwd" size="30" maxlength="100" onkeyup="checkPwd()"/><span id="idPwdResult">비밀번호는 6글자 이상입니다.</span>
								</td>
							</tr>
							<tr>
								<th scope="col">* 비밀번호 확인</th>
								<td colspan="3">
									<input type="password" id="operPwd2" size="30" maxlength="100" onkeyup="checkPwd2()"/><span id="idPwdConfrimResult"></span>
								</td>
							</tr>
							<tr>
								<th scope="col">* 이메일</th>
								<td colspan="3">
									<sf:hidden path="email"/>
									<Input Type='Text' id="email1" value='' Size='30' MaxLength='20'> @ <Input Type='Text' id="email2" value='' Size='30' MaxLength='20'>
									<select id="emailSelect" name='Ls_Email3' style='width: 130px;'">
										<option value=''>선택하십시오.</option>
										<option value='00'>직접입력</option>
										<option value='gmail.com'>gmail.com</option>
										<option value='chol.com'>chol.com</option>
										<option value='dreamwiz.com'>dreamwiz.com</option>
										<option value='empal.com'>empal.com</option>
										<option value='freechal.com'>freechal.com</option>
										<option value='hanafos.com'>hanafos.com</option>
										<option value='hanmail.net'>hanmail.net</option>
										<option value='hanmir.com'>hanmir.com</option>
										<option value='hotmail.com'>hotmail.com</option>
										<option value='korea.com'>korea.com</option>
										<option value='nate.com'>nate.com</option>
										<option value='naver.com'>naver.com</option>
										<option value='netian.com'>netian.com</option>
										<option value='paran.com'>paran.com</option>
										<option value='sayclub.com'>sayclub.com</option>
										<option value='yahoo.co.kr'>yahoo.co.kr</option>
										<option value='yahoo.com'>yahoo.com</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="col">* 전화번호</th>
								<td colspan="3">
									<select name='tel1' id="tel1" style='width: px;'>
										<option value=''>선택</option>
										<option value='010'>010</option>
										<option value='011'>011</option>
										<option value='0130'>0130</option>
										<option value='016'>016</option>
										<option value='017'>017</option>
										<option value='018'>018</option>
										<option value='019'>019</option>
										<option value='02'>02</option>
										<option value='031'>031</option>
										<option value='032'>032</option>
										<option value='033'>033</option>
										<option value='041'>041</option>
										<option value='042'>042</option>
										<option value='043'>043</option>
										<option value='0502'>0502</option>
										<option value='0505'>0505</option>
										<option value='051'>051</option>
										<option value='052'>052</option>
										<option value='053'>053</option>
										<option value='054'>054</option>
										<option value='055'>055</option>
										<option value='061'>061</option>
										<option value='062'>062</option>
										<option value='063'>063</option>
										<option value='064'>064</option>
										<option value='070'>070</option>
									</select> - 
									<input name="tel2" id="tel2" type="text" maxlength="4" size="10" onKeyDown="NumberOnly(event,this);" /> - 
									<input name="tel3" id="tel3" type="text" maxlength="4" size="10" onKeyDown="NumberOnly(event,this);" />
								</td>
							</tr>
							<tr>
								<th scope="col">휴대번호</th>
								<td colspan="3">
									<select name='mobile1' id="mobile1" style='width: px;'>
										<option value=''>선택</option>
										<option value='010'>010</option>
										<option value='011'>011</option>
										<option value='0130'>0130</option>
										<option value='016'>016</option>
										<option value='017'>017</option>
										<option value='018'>018</option>
										<option value='019'>019</option>
										<option value='02'>02</option>
										<option value='031'>031</option>
										<option value='032'>032</option>
										<option value='033'>033</option>
										<option value='041'>041</option>
										<option value='042'>042</option>
										<option value='043'>043</option>
										<option value='0502'>0502</option>
										<option value='0505'>0505</option>
										<option value='051'>051</option>
										<option value='052'>052</option>
										<option value='053'>053</option>
										<option value='054'>054</option>
										<option value='055'>055</option>
										<option value='061'>061</option>
										<option value='062'>062</option>
										<option value='063'>063</option>
										<option value='064'>064</option>
										<option value='070'>070</option>
									</select> - 
									<input name="mobile2" id="mobile2" type="text" maxlength="4" size="10" onKeyDown="NumberOnly(event,this);" /> - 
									<input name="mobile3" id="mobile3" type="text" maxlength="4" size="10" onKeyDown="NumberOnly(event,this);" />
								</td>
							</tr>
							<tr>
								<th scope="col">FAX</th>
								<td colspan="3">
									<select name='fax1' id="fax1" style='width: px;'>
										<option value=''>선택</option>
										<option value='010'>010</option>
										<option value='011'>011</option>
										<option value='0130'>0130</option>
										<option value='016'>016</option>
										<option value='017'>017</option>
										<option value='018'>018</option>
										<option value='019'>019</option>
										<option value='02'>02</option>
										<option value='031'>031</option>
										<option value='032'>032</option>
										<option value='033'>033</option>
										<option value='041'>041</option>
										<option value='042'>042</option>
										<option value='043'>043</option>
										<option value='0502'>0502</option>
										<option value='0505'>0505</option>
										<option value='051'>051</option>
										<option value='052'>052</option>
										<option value='053'>053</option>
										<option value='054'>054</option>
										<option value='055'>055</option>
										<option value='061'>061</option>
										<option value='062'>062</option>
										<option value='063'>063</option>
										<option value='064'>064</option>
										<option value='070'>070</option>
									</select> - 
									<input name="fax2" id="fax2" type="text" maxlength="4" size="10" onKeyDown="NumberOnly(event,this);" /> - 
									<input name="fax3" id="fax3" type="text" maxlength="4" size="10" onKeyDown="NumberOnly(event,this);" />
								</td>
							</tr>
							<tr>
								<th scope="col">* 우편번호</th>
								<td colspan="3">
									<sf:hidden path="zipCode"/>
									<input name="Ls_Post1" type="text" maxlength="3" readonly="readonly" id="zipCode1" size="5" onKeyDown="NumberOnly(event,this);" /> - 
									<input name="Ls_Post2" type="text" maxlength="3" readonly="readonly" id="zipCode2" size="5" onKeyDown="NumberOnly(event,this);" /> 
									<img src="${pageContext.request.contextPath}/img/admin/button/btn_post.gif" width="59" height="23" alt="우편번호" onclick="fnPostSearchOpen('zipCode', 'zipCode1', 'zipCode2', 'addr1', 'addr2')" />
								</td>
							</tr>
							<tr>
								<th scope="col">* 주소</th>
								<td colspan="3">
									<sf:input path="addr1" size="60" maxlength="100" readonly="true" />
								</td>
							</tr>
							<tr>
								<th scope="col">&nbsp;</th>
								<td colspan="3">
									<sf:input path="addr2" size="60" maxlength="100" />
								</td>
							</tr>
						</table>
						<p class="joinBtn">
							<img src="${pageContext.request.contextPath}/img/admin/button/btn_add.gif" width="49" height="23" onclick="submitFormData()"  alt="등록"/>
							<img src="${pageContext.request.contextPath}/img/admin/button/btn_cancel.gif" width="57" height="23" onclick="$(location).attr('href', '${pageContext.request.contextPath}/admin')"  alt="취소"/>
						</p>
					</sf:form>
				</div>
			</div>
	
	<!-- CONTENT END -->
	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/ServerAPICall.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/serializeObjectJSON.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/json2.js"></script>
<script type="text/javascript">
	
	var focus;
	var	zipCodeMod; 
	
	$(function() {
		
		emailSelect('email2', 'emailSelect');
		
		// Jq UI Button Setting
		$('.searchButton').button({
			icons: {
				primary: "ui-icon-zoomin"
			}
		});
		
		$('.addButton').button({
			icons: {
				primary: "ui-icon-plusthick"
			}
		});
	
		$('#emailSelect').change(function() {
			emailSelect('email2', 'emailSelect')
		});
	
		$('#operPwd').change(function() {
			checkPwd2();
		});
	
		$(document).on("keyup", "input:text[numberOnly]", function() {
			$(this).val($(this).val().replace(/[^0-9]/gi, ""));
		});
		$(document).on("keyup", "input:text[datetimeOnly]", function() {
			$(this).val($(this).val().replace(/[^0-9:\-]/gi, ""));
		});
	});
	

	// 아이디 검사
	function checkID() {
		var id = $("#operId").val();
		var isCheckID = $('#isCheckID');
		var result = false;

		if (id.length < 6 || id.length > 12)
		{
			$("#idCheckResult").html("아이디는 6글자 이상, 12글자 이하입니다.");
			$("#idCheckResult").css("color", "red");
			focus = $("#id");
			isCheckID.val(false);
		}
		else if (id.length > 0) {
			$.ajax({
				type : "GET",
				async : false,
				url : "${pageContext.request.contextPath}" + "/admin/operator/checkID/" + id,
				contentType : "application/json",
				dataType : "json",
				error : function(xhr, textStatus, errorThrown) {
					$("#idCheckResult").html("통신 에러 발생" + textStatus);
					$("#idCheckResult").css("color", "red");
					focus = $("#id");
					result = false;
					isCheckID.val(false);
				},
				success : function(json) {
					var code = json["msgCode"];
					var msg = json["message"];
					var object = json.object;

					if (code == "100") {
						$("#idCheckResult").html("사용 가능한 아이디 입니다.");
						$("#idCheckResult").css("color", "blue");
						result = true;
						isCheckID.val(true);
					} else if (code == "201") {
						$("#idCheckResult").html("해당 아이디가 존재합니다.");
						$("#idCheckResult").css("color", "red");
						focus = $("#id");
						
						result = false;
						isCheckID.val(false);
					} else {
						$("#idCheckResult").html("요청 작업 실패");
						$("#idCheckResult").css("color", "red");
						focus = $("#id");
						
						result = false;
						isCheckID.val(false);
					}
				}
			});
		}

		return result;
	}
	
	// 패스워드 검사.
	function checkPwd() {
		var pw = $('#operPwd').val();
		
		if (pw.length < 6) {
			$("#idPwdResult").html("비밀번호는 6글자 이상입니다.");
			$("#idPwdResult").css("color", "red");
			focus = $("#operPwd");
			return false;
		} else {
			$("#idPwdResult").html("사용가능한 비밀번호 입니다.");
			$("#idPwdResult").css("color", "blue");
			return true;
		}
	}
	
	function checkPwd2() {
		var pw = $('#operPwd').val();
		var pw2 = $('#operPwd2').val();
		
		if (pw.length > 0 && pw2.length > 0) {
			if (pw != pw2) {
				$("#idPwdConfrimResult").html("비밀번호가 일치하지 않습니다.");
				$("#idPwdConfrimResult").css("color", "red");
				focus = $("#operPwd2");
				return false;
			} else {
				$("#idPwdConfrimResult").html("비밀번호 확인되었습니다.");
				$("#idPwdConfrimResult").css("color", "blue");
				return true;
			}
		} 
		return false;
	}
	
	
	function checkFromData() {
		if ($('#isCheckID').val() == "false") 
		{
			openAlertDialog("아이디 중복확인을 해주세요!");
			focus = $("#operId");
			return false;
		} else if ($('#operName').trim().val().length <= 0) {
			openAlertDialog("이름을 입력해 주세요.");
			focus = $('#operName');
			return false;
		} else if (!checkPwd() || !checkPwd2()) {
			openAlertDialog("비밀번호을 확인해 주세요.");
			return false;
		} else if (!checkEmail('email', 'email1', 'email2')) {  //checkEmail(emailId, emailId1, emailId2)
			openAlertDialog("이메일을 입력해 주세요.");
			return false;
		} else if (!checkPhoneNumber('tel1','tel2','tel3')) { //checkPhoneNumber(telId1, telId2, telId3) 
			openAlertDialog("전화번호을 입력해 주세요.");
			return false;
		} else if (!checkZipCode('zipCode','zipCode1','zipCode2')){ //checkZipCode(zipCodeId, zipCodeId1, zipCodeId2)
			openAlertDialog("우편번호를 검색해 주세요.");
			return false;
		} 
			
		return true;
	}

	
	// 회원가입 폼 전송.
	function submitFormData() {
		if (checkFromData()) {
			$("#operatorForm").submit();
		}
	}
</script>

<%@include file="../common/findZip.jsp"%>
<%@include file="../common/alertDialog.jsp"%>
</body>
</html>