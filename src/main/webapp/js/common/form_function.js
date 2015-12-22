// 숫자만 입력 받음
function NumberOnly(event, obj) {
    // 8 :backspace
    // 9 :tab
    // 46 : del
    // 48 ~ 57 :number
    var event = event || window.event;

    var code = event.keyCode;

    if (!((code >= 48 && code <= 57) || (code == 46) || (code == 9) || (code == 8) || (code >= 96 && code <= 105) || (code == 13))) {
        //alert("숫자만 입력 가능합니다.");
        obj.focus();
        if (event.preventDefault) {
            event.preventDefault();
        } else {
            event.returnValue = false;
        }
    }
}

// 영문/숫자만 입력받기.
function NoHanGle(event, obj){
    if (!(event.keyCode >=37 && event.keyCode<=40)) {
        var inputVal = $(obj).val();
        $(obj).val(inputVal.replace(/[^a-z0-9]/gi,''));
    }
}

//사업자번호 중복 체크
function checkCrn(){
		var crn1 = $("#crn1");
		var crn2 = $("#crn2");
		var crn3 = $("#crn3");
		var crn = crn1.val() + crn2.val() + crn3.val();
		if (crn.length == 10 ){
			var resultData = null;
			
			$.ajax({
				type : "GET",
				async : false,
				url : "${pageContext.request.contextPath}" + "/api/organ/crnDupCheck/" + crn,
				contentType : "application/json",
				dataType : "json",
				error : function(xhr, textStatus, errorThrown) {
					openAlertDialog("통신 에러 발생" + textStatus);
				},
				success : function(json) {
					resultData = json;
				}
			});
			
			if (resultData.result == false){
				$("#crnResult").html("");
				$("#crnResult").css("color", "red");
				$("#crnResult").html("사업자등록번호 중복");
				$("#crnDup").val(true);
			}
			else{
				$("#crnResult").html("");
				$("#crnResult").css("color", "#787878");
				$("#crnResult").html("사업자등록번호 사용가능");
				$("#crnDup").val(false);
			}
		} else {
			$("#crnResult").html("");
			$("#crnResult").css("color", "red");
			$("#crnResult").html("사업자등록번호 사용불가");
			$("#crnDup").val(true);
		}
}

//휴대 번호 검사.
function checkPhoneNumber(telId1, telId2, telId3) {
	if (!$('#'+telId1).val().length > 0) {
		openAlertDialog("전화번호를 입력하세요.");
		focus = $('#'+telId1);
		return false;
	} else if (!$('#'+telId2).val().length > 0) {
		openAlertDialog("전화번호를 입력하세요.");
		focus = $('#'+telId2);
		return false;
	} else if (!$('#'+telId3).val().length > 0) {
		openAlertDialog("전화번호를 입력하세요.");
		focus = $('#'+telId3);
		return false;
	} else {
		return true;
	}
}

//우편번호 검사.
function checkZipCode(zipCodeId, zipCodeId1, zipCodeId2){
	var zipCode = $('#'+zipCodeId);
	var zipCode1 = $('#'+zipCodeId1);
	var zipCode2 = $('#'+zipCodeId2);
	
	if (!zipCode1.val().length > 0 || !zipCode2.val().length > 0){
		openAlertDialog("우편번호를 검색해주세요.");
		return false;
	}
	else{
		zipCode.val(zipCode1.val() + "-" + zipCode2.val());
		return true;
	}
}

//이메일 검사.
function checkEmail(emailId, emailId1, emailId2) {
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var email = $('#'+emailId1).val() + "@" + $("#"+emailId2).val();

	if (!regEmail.test(email)) {
		openAlertDialog("이메일을 입력하세요.");
		focus = $("#"+emailId1);
		return false;
	} else {
		$("#"+emailId).val(email);
		return true;
	}
}


//이메일 형식체크
function fnCheckEmail(email) {
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if (!regEmail.test(email)) {
		return false;
	} else {
		return true;
	}
}


//이메일 선택
function emailSelect(emailId2, emailSelectId)
{
	var varEmailSelect = $("#"+emailSelectId+" option:selected").val();
	
	if(varEmailSelect == "00")
	{
		$("#"+emailId2).removeAttr("readonly");
		$("#"+emailId2).val("");
	}
	else
	{
		$("#"+emailId2).attr("readonly",true);
		$("#"+emailId2).val(varEmailSelect);
	}
}