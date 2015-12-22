<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="stitle">
	<h3>게시판 등록</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="board" action="${pageContext.request.contextPath}/front/board/boardInsertProcess" enctype="multipart/form-data">
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">제목</th>
				<td colspan="3">
					<input name="boardTitle" id="boardTitle" size="100" maxlength="100" />
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">내용</th>
				<td colspan="3">
					<textarea name="fckEditor_contents" cols="67" rows="5" id="fckEditor_contents" rows="10"></textarea>
					<!-- Fck Editor -->
					<script type="text/javascript">
						var data = "";
						data = decodeURIComponent(data);
						$("#fckEditor_contents").val(data);
						CKEDITOR.replace( 'fckEditor_contents', {width: 700, height: 400});
					</script>
					<input type="hidden" name="boardContents" id="boardContents"/>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">비고</th>
				<td colspan="3">
					<textarea name="fckEditor_etc" cols="67" rows="5" id="fckEditor_etc" rows="10"></textarea>
					<!-- Fck Editor -->
					<script type="text/javascript">
						var data = "";
						data = decodeURIComponent(data);
						$("#fckEditor_etc").val(data);
						CKEDITOR.replace( 'fckEditor_etc', {width: 700, height: 100});
					</script>
					<input type="hidden" name="boardEtc" id="boardEtc"/>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">첨부파일<br/><a href="javascript:fnAddFile();">[파일추가]</a></th>
				<td colspan="3">
					<ul id="fileUL">
						<li><input name="uploadfiles" type="file" class="inputfile" id="uploadfiles0" size="50" onchange="javascript:fnCheckFileSize('uploadfiles0');"/> (파일 최대 크기 20MB)</li>
					</ul>
				</td>
			</tr>
		</table>
		<p class="joinBtn">
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_add.gif" onclick="fnSubmitFormData()"  alt="등록"/>
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_cancel.gif" onclick="history.back();"  alt="취소"/>
		</p>
	</sf:form>
</div>
<img id="myImage" src="" style="display:none;">
<script type="text/javascript">
function fnCheckFromData()
{		
	if (!$('#boardTitle').val().length > 0)
	{
		alert("제목을 입력해 주세요.");
		$('#boardTitle').focus();
		return false;
	}
	else if (!getContents().length >0){
		alert("내용을 입력하세요.");
		CKEDITOR.instances.fckEditor_contents.focus();
		return false;
	}
	else if (!getContents() == ""){
		var data = getContents();
		data = data.replace(/\n/g, "");
		data = encodeURIComponent(data);
		
		$("#boardContents").val(data);
	}
	if (!getEtc() == ""){
		var data = getEtc();
		data = data.replace(/\n/g, "");
		data = encodeURIComponent(data);
		
		$("#boardEtc").val(data);
	}
	
	return true;
}

function fnSubmitFormData()
{
	if (fnCheckFromData())
	{	
		$("#board").submit();
	}
}

function fnAddFile(){
	if ($("input[name=uploadfiles]").length > 9) {
		alert('최대 파일 첨부개수는 10개입니다.');
		return;
	}
	$("#fileUL").append("<li><input name=\"uploadfiles\" type=\"file\" class=\"inputfile\" id=\"uploadfiles"+$("input[name=uploadfiles]").length+"\" size=\"50\" onchange=\"javascript:fnCheckFileSize('uploadfiles"+$("input[name=uploadfiles]").length+"');\"/></li>");	
}

//*************************************************** FCK 에디터 입력 내용 가져오기.
function getContents(){
	var editor = CKEDITOR.instances.fckEditor_contents;
	
	var data = editor.getData();
	return data;
}

function getEtc(){
	var editor = CKEDITOR.instances.fckEditor_etc;
	
	var data = editor.getData();
	return data;
}

</script>
<script src="${pageContext.request.contextPath}/js/common/fileSizeCheck.js"></script>