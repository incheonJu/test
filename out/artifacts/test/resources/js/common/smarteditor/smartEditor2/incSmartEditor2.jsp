		<script type="text/javascript" src="/common/smartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
		<script type="text/javascript" src="/common/smartEditor2/js/customEditor.js" charset="utf-8"></script>
		<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:300px; display:none;"></textarea>
		<!--textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:412px; min-width:610px; display:none;"></textarea-->

		<div>
			<!--
			<input type="button" value="첨부파일 추가" onclick="window.open('/common/smartEditor2/addAttachFile.asp','attachFilePopup','width=500, height=500')"/>
			-->
			<div>
				<select id="uploadImageFile" name="uploadImageFile" style="width:0px; height:0px;" multiple></select>
				<!--
				<input type="button" value="첨부파일 삭제" onclick="AttachFileDel()"/>
				-->
			</div>
		</div>
<!--
		<p>
			<input type="button" onclick="pasteHTML('ㅁㄴㅇㄻㄴㅇㄹ');" value="본문에 내용 넣기" />
			<input type="button" onclick="showHTML();" value="본문 내용 가져오기" />
			<input type="button" onclick="submitContents(this);" value="서버로 내용 전송" />
			<input type="button" onclick="setDefaultFont();" value="기본 폰트 지정하기 (궁서_24)" />
		</p>
-->		
		<script type="text/javascript">
		var oEditors = [];

		// 추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1",
			sSkinURI: "/common/smartEditor2/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function(){
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				
				//에디터 로딩 후 처리
				afterInitEditor();
			},
			fCreator: "createSEditor2"
		});

		function pasteHTML2() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
		}

		function pasteHTML(htmlString) {
			oEditors.getById["ir1"].exec("PASTE_HTML", [htmlString]);
		}

		function pasteHtmlMsg(msg){
			alert(msg);
		}
		
		//웹에디터 내용 넣기
		function showHtmlContents() {
			var sHTML = oEditors.getById["ir1"].getIR();
			//alert(sHTML);
			$("textarea[name='context']").val(sHTML);
		}

		//내용을 웹에디터에 넣기
		function showHtmlEditor() {
			pasteHTML($("textarea[name='context']").val());
		}
			
		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
			
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
			
			try {
				elClickedObj.form.submit();
			} catch(e) {}
		}

		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
		}
		</script>