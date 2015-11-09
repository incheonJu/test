var user = user || {};

user.ajax = (function($){
	var ajaxXhr = "";
	var dataLength = "";
	var baseUrl = "/kor/";
	
	var init = function(){
		ajaxXhr = "";
	};

	// Histroy 연혁 가져오기
	var getHistory = function(_context, _param, _callback){
		init();
		var url = baseUrl+_context+_param;
		
		ajaxXhr = $.getJSON(url, function(d){
			_callback(d.object);
		});
	};
	
	var test = function(){
		alert('asefiojasepofjpaosej');
	};
		
	/* Public */
	return {
			getHistory : getHistory
		,	test : test
	}
})($);