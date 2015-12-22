// 서버 API 통신 메소드
function serverAPICall(type, url, data) {
	var returnData = null;

	$.ajax({
		type : type,
		async : false,
		url : url,
		contentType : "application/xml",
		data : data,
		dataType : "xml",
		error : function(xhr, textStatus, errorThrown) {
			returnData = textStatus + errorThrown;
		},
		success : function(json) {
			returnData = json;
		}
	});
	
	return returnData;
}