// 공통 이벤트 바인딩
$(document).ready(function() {
	// 숫자만 받기
	$(".onlyNum").bind("keyup", function(){
		$(this).val($(this).val().replace(/[^0-9]/gi, ""));
	});
	
	// 영문/숫자만 받기
	$(".onlyEng").bind("keyup", function(){
		common.commonModule.isNumEng(this, event);
	});
		
	// 달력 생성
	$(".datepicker_calendar").datepicker({
		inline: true, 
		dateFormat: "yy-mm-dd",    	/* 날짜 포맷 */ 
		prevText: "prev", 
		nextText: "next", 
		showButtonPanel: true,    	/* 버튼 패널 사용 */ 
		changeMonth: true,        	/* 월 선택박스 사용 */ 
		changeYear: true,        	/* 년 선택박스 사용 */ 
		showOtherMonths: true,    	/* 이전/다음 달 일수 보이기 */ 
		selectOtherMonths: true,    /* 이전/다음 달 일 선택하기 */ 
		showOn: "both",
		buttonImage: "/resources/image/common/ico_calendar.gif",
		buttonImageOnly: true,
		minDate: "-30y",
		closeText: "닫기", 
		currentText: "오늘", 
		showMonthAfterYear: true,        /* 년과 달의 위치 바꾸기 */
		
		/* 한글화 */ 
		monthNames : ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"], 
		monthNamesShort : ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"], 
		dayNames : ["일", "월", "화", "수", "목", "금", "토"],
		dayNamesShort : ["일", "월", "화", "수", "목", "금", "토"],
		dayNamesMin : ["일", "월", "화", "수", "목", "금", "토"],
		showAnim: "slideDown"
	});
	
	var selectedTab = function(_url){
		var arrLeft = ["left_notice","left_store","left_history","left_socialContributionNews",
		               "left_inquiry",
		               "left_operator","left_main","left_popup",
		               "left_productEPDM","left_productKEPA",
		               "left_chemistryDictionary","left_handbook"];

		var url = _url.pathname.split("/");
		var left = "left_"+url[2];
		for(var i=0; i<arrLeft.length; i++){
			if(left == arrLeft[i]){
				$("#"+arrLeft[i]).addClass("over");
				$("#"+arrLeft[i]+"_depth2").addClass("over");
				$('ul[name="'+arrLeft[i]+'_depth2' + '"]').css("display", "block");
			} else {
				$("#"+arrLeft[i]).removeClass("over");
			}
		}
	}(window.location);
	
	// 달력 아이콘 위치 지정
	$('img.ui-datepicker-trigger').attr("align", "absmiddle");
	$('img.ui-datepicker-trigger').attr("style", "margin-left:5px");
	
	// 숫자/영문자 ime-mode disabled
	$(".onlyEng").attr("style", "ime-mode:disabled;");
});