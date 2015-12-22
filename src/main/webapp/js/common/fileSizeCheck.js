var maxFileSize = 20971520;
var maxFileSizeDesc = 20;

function fnCheckFileSize(elementId){
	var fileSize = $('#' + elementId)[0].files[0].size;
	if (fileSize >= maxFileSize){
		alert("파일 크기가 "+maxFileSizeDesc+"MB를 초과했습니다.");
		$('#' + elementId).val("");
	}
}
