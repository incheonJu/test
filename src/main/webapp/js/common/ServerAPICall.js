// 서버 API 통신 메소드
function serverAPICall(type, url, data) {
	var returnData = null;

	$.ajax({
		type : type,
		async : false,
		url : url,
		contentType : "application/json",
		data : data,
		dataType : "json",
		error : function(xhr, textStatus, errorThrown) {
			console.log(xhr + textStatus + errorThrown)
			returnData = textStatus;
		},
		success : function(json) {
			returnData = json;
		}
	});
	
	return returnData;
}

function serverAPICallTest(type, url, contentType) {
	var returnData = null;
	
	$.ajax({
        url : "resources/navermap_point_proxy.jsp?query=인천%20연수구%20동춘동", 
        type : "GET",
        dataType : "xml", 
        error : function(xhr, textStatus, errorThrown) {
        	console.log(xhr);
			console.log(errorThrown);
		},
        success : function(result){
        	console.log(result);
        }
	});

/*	$.ajax({
		type : type,
		async : false,
		url : url,
		contentType : contentType,
		error : function(xhr, textStatus, errorThrown) {
			returnData = textStatus;
		},
		success : function(json) {
			returnData = json;
		}
	});*/
	
	return returnData;
}