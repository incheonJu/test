var common = common || {};

common.commonModule = (function(){
	/* Private */
	var oEditors = [];
	var arrEditor = [];
	var trim = function(_val){
		if(_val != undefined ){
			var val = _val.replace(/^\s+|\s+$/gm,'')
		}
		return val;
	};
	
	// 이미지 미리보기(Html5용)
	var setPreview = function(_img, _targetObj, _targetName){
		var isIE = (navigator.appName=="Microsoft Internet Explorer");  
		var path = _img.value;
		var ext = path.substring(path.lastIndexOf('.') + 1).toLowerCase();
		
		if(ext == "gif" || ext == "jpeg" || ext == "jpg" ||  ext == "png" ){       
			if(isIE) {  
				$('#'+ previewName).attr('src', path);  
			} else {
				if (_img.files[0]){  
					var reader = new FileReader();  
					reader.onload = function (e){
						if(_targetName != null){
							$("#"+_targetObj).append("<li style=\"background:url(\""+e.target.result+"\") 50% 0 no-repeat;\">"+_targetName+"</li>");
						} else {
							if(_targetObj != "structurePath"){
								$("."+_targetObj).css({"background-image":"url("+e.target.result+")"});
							} else {
								$("#"+_targetObj).attr("src", e.target.result);
							}
						}
					};
					reader.readAsDataURL(_img.files[0]);  
				}
			} 
		}
	};
	
	// 파일 확장자 체크
	var isFileExt = function(_obj){
		var result = false;
		var fileExt = _obj.value;
		var regex = "\.(bmp|jpg|jpeg|gif|pdf|hwp|xls|doc|hwp)$";
		if((new RegExp(regex, "i")).test( _obj.value)) return true;
		
		openAlert("업로드가 불가능 파일입니다.");
		return false;
		/*
		var enableUploadFileExt = new Array("bmp","jpg","jpeg","gif","pdf","hwp","xls","doc","hwp");
		
		
		fileExt = fileExt.slice(fileExt.indexOf(".")+1).toLowerCase();
		for(var i=0; i<enableUploadFileExt.length; i++){
			if(enableUploadFileExt[i] == fileExt){
				result = true;
			} else {
				result = false;
			}
		}*/
	};
	
	// 파일 크기 체크
	var fileSizeCheck = function(_obj, _maxSize){
		
	};
			
	// Timestamp to Date
	var dateformat = function(_timestamp, _format){
		var sysdate = new Date(_timestamp);
		
		var year = sysdate.getFullYear();
		var month = sysdate.getMonth()+1;
		var day = sysdate.getDate();
		var hour = sysdate.getHours();
		var minute = sysdate.getMinutes();
		var second = sysdate.getSeconds();
		
		if (_format == null) _format = "yyyy-MM-dd";
		
		_format = _format.replace("yyyy", year);

		_format = (month < 10) ? _format.replace("MM", "0" + month) : _format.replace("MM", month);

		_format = _format.replace("M", month);

		_format = (day < 10) ? _format.replace("dd", "0" + day) : _format.replace("dd", day);

		_format = _format.replace("d", day);

		_format = (hour < 10) ? _format.replace("HH", "0" + hour) : _format.replace("HH", hour);

		_format = (minute < 10) ? _format.replace("mm", "0" + minute) : _format.replace("mm", minute);

		_format = (second < 10) ? _format.replace("ss", "0" + second) : _format.replace("ss", second);

		return _format;
	};
	
	// Textarea 글자수 제한
	var isCheckStrLen = function(_obj, _maxLength){
		var i;
		var temp;
		var tempStr;
		var msgLength;
		
		msgLength = _maxLength * 2;
		
		i = _obj.value.length;
		tempStr = "";
		
		if(i != 0){
			for(k=0; k<i; k++){
				temp = _obj.value.charAt(k);
				if(escape(temp).length > 4){
					msgLength -= 2;
				} else {
					msgLength--;
				}
				if(msgLength < 0){
	                alert("총 영문 "+(_maxLength*2)+"자 한글 " + _maxLength + "자 까지 작성하실 수 있습니다.");
	                _obj.value = tempStr;
	                break;
	            } else {
	            	tempStr += temp;
	            }
			}
		}
	};
	
	// 네이버 스마트에디터 내용 확인
	var getEditorContent = function(_content){
		return oEditors.getById[_content].getIR()
	};
	
	var setEditorContent = function(_content, _data){
		oEditors.getById["_content"].exec("PASTE_HTML", [_data]);
	};

	// 네이버 스마트에디터2.0 적용
	var setEditor = function(_arr){
		arrEditor = _arr;
		for(var i=0; i<_arr.length; i++){
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors,
			    elPlaceHolder: _arr[i],
			    sSkinURI: "/resources/js/common/smarteditor/se2.3/SmartEditor2Skin.html",
			    htParams : {
					bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
					fOnBeforeUnload : function(){
					}
				},
				fOnAppLoad : function(){
					//예제 코드
					//oEditors.getById[_arr[i]].exec("PASTE_HTML", [_data[i]]);
				},
			    fCreator : "createSEditor2",
				id : _arr[i]+"_iframe"



			});
		}
	};

	var setEditorResultObject = function(){
		return oEditors;
	};

	// Alert 출력
	var openAlert = function(_msg){
		alert(_msg);
	};
	
	// Log 출력
	var log = function(_msg){
		console.log(_msg);
	};
	
	// 영문/숫자만 받기 (onkeypress 사용)
	var isNumEng = function(_obj, _event){
		if (!(_event.keyCode >=37 && _event.keyCode<=40)) {
			var value = _obj.value;
			_obj.value = value.replace(/[^a-z0-9]/gi,'');
	    } 
	};
	
	// Radio값 선택된 값 Return
	var checkedRadioValue = function(_obj){
		var result = "";
		var obj = _obj;
		var length = obj.length;
		for(var i=0; i<length; i++){
			if(obj[i].checked == true){
				result = obj[i].value; 
			}
		}
		return result;
	};
	
	// value 값에 따른 checked
	var checkedRadio = function(_obj, _value){
		var obj = _obj;
		var length = obj.length; //라디오버튼이 2개 이하일시 undefined
		if(_value == ""){
			obj[0].checked = true;
		} else {
			if(length > 1) {
				for (var i = 0; i < length; i++) {
					if (obj[i].value == _value) {
						obj[i].checked = true;
					} else {
						obj[i].checked = false;
					}
				}
			}else{
				if (obj.value == _value) {
					obj.checked = true;
				} else {
					obj.checked = false;
				}
			}
		}
	};
	
	// 에디터인지 확인
	var isCheckSmartEditor = function(_name){
		var result = false;
		var editorId = _name+"_editor";
		for(var i=0; i<arrEditor.length; i++){
			if(arrEditor[i] == editorId){
				result = true;
			}
		}
		return result; 
	};
	
	// 유효성 검사
	var isCheck = function(_obj, _text, _checkData, _objFocus){
		console.dir(_obj);
		var obj = _obj;
		var result = false;
		if(isCheckSmartEditor(_obj.name)){
			var editorId = _obj.name+"_editor";
			var content = trim(getEditorContent(editorId));
			if(content == _checkData || content == "<p><br></p>"){
				openAlert(_text);
				result = false;
			} else {
				_obj.value = content;
				result = true;
			}
		} else {

			if(trim(obj.value) == _checkData) {
				openAlert(_text);
				if(_objFocus == null){
					if(typeof obj.focus != "undefined"){ 
						obj.focus(); 
					}
				} else {
					_objFocus.focus();
				}
				result = false;
			} else {
				result = true;
			}
			
			if(obj.className == "onlyNum"){
				if(isNaN(trim(obj.value))){
					openAlert("해당 입력란에는 숫자만 입력이 가능합니다.");
					obj.focus(); 
					result = false;
				}
			}
		}
		return result;
	};
	
	// 체크박스 전체선택 및 해제
	var allCheck = function(_name, _obj){
		var obj = document.getElementsByName(_name);
		var objCnt = obj.length;
		var isChecked = _obj.checked; 
				
		for(var i=0; i<objCnt; i++){
			if(isChecked){
				obj[i].checked = true;
			} else {
				obj[i].checked = false;
			}
		}
	};

	// 체크된 데이터의 PK값을 '','' 형태로 만든 후 _id에 입력
	var bindCheckedData = function(_name, _id, _form){
		var obj = document.getElementsByName(_name);
		var objCnt = obj.length;
		var result = "";
		for(var i=0; i<objCnt; i++){
			if(obj[i].checked){
				result += "'"+obj[i].value+"',";
			}
		}
		if(result == "") { 
			alert('삭제할 대상을 선택하십시오.');
			document.getElementById(_id).value = "";
			return false;  
		} else {
			if(confirm('삭제하시겠습니까?')){
				document.getElementById(_id).value = result.substring(0, result.length-1);
				_form.submit();
			}
		}
	};
		
	/* Public */
	return {
			isCheck : isCheck
		,	allCheck : allCheck
		,	bindCheckedData : bindCheckedData
		,	checkedRadio : checkedRadio
		,	getEditorContent : getEditorContent
		,	checkedRadioValue : checkedRadioValue
		,	isNumEng : isNumEng
		,	setEditor : setEditor
		,	openAlert : openAlert
		,	isCheckStrLen : isCheckStrLen
		,	dateformat : dateformat
		,	isFileExt : isFileExt
		,	setPreview : setPreview
		,   setEditorResultObject : setEditorResultObject
	}
})();