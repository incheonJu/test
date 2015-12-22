<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div class="stitle">
	<h3>게시판 수정</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="board" action="${pageContext.request.contextPath}/admin/board/boardUpdateProcess" enctype="multipart/form-data">
	<input type="hidden" name="boardSeq" value="${board.boardSeq}"/>
	<input type="hidden" name="page" value="${page}"/>
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">제목</th>
				<td colspan="3">
					<input id="boardTitle" name="boardTitle" size="100" maxlength="100" value="${board.boardTitle}" />
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">내용</th>
				<td colspan="3">
					<textarea name="fckEditor_contents" cols="67" rows="5" id="fckEditor_contents" rows="10"></textarea>
					<!-- Fck Editor -->
					<script type="text/javascript">
						var data = "${board.boardContents}";
						data = decodeURIComponent(data);
						$("#fckEditor_contents").val(data);
						CKEDITOR.replace( 'fckEditor_contents', {width: 700, height: 400});
					</script>
					<input type="hidden" id="boardContents" name="boardContents">
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">비고</th>
				<td colspan="3">
					<textarea name="fckEditor_etc" cols="67" rows="5" id="fckEditor_etc" rows="10"></textarea>
					<!-- Fck Editor -->
					<script type="text/javascript">
						var data = "${board.boardEtc}";
						data = decodeURIComponent(data);
						$("#fckEditor_etc").val(data);
						CKEDITOR.replace( 'fckEditor_etc', {width: 700, height: 100});
					</script>
					<input type="hidden" id="boardEtc" name="boardEtc">
				</td>
			</tr>
			
			<c:forEach var="boardFile" items="${board.boardFileList}" varStatus="status">
				<tr>
					<c:if test="${status.count == 1}">
						<th width="15%" scope="col" rowspan="${board.boardFileList.size()}">첨부파일<br/><br/>(파일 최대 크기 20MB)</th>
						<td colspan="2" width="250">
					</c:if>
					<c:if test="${status.count != 1}">
						<td colspan="2" width="250">
					</c:if>
						<c:if test="${(boardFile.fileName != null) && (boardFile.fileName != '')}">
							<a href="${pageContext.request.contextPath}/download/Image/board/${boardFile.fileName}" target="_blank">${boardFile.fileName}</a> <input type="checkbox" value="${boardFile.fileSeq}" name="fileDel" id="fileDel${boardFile.fileSeq}" onclick="fnFileDelClick(this,'${boardFile.fileSeq}');"/>삭제
						</c:if>
						</td>
						<td colspan="1">
							<input name="fileUpdate" type="file" class="inputfile" id="fileUpdate${boardFile.fileSeq}" size="50" onchange="fnFileUpload('${boardFile.fileSeq}');"/> 
							<input name="fileUpdateSeq" type="hidden" class="inputfile" id="fileUpdateSeq${boardFile.fileSeq}" size="50" />
						</td>
				</tr>
			</c:forEach>
			<tr>
				<th width="15%" scope="col">
					<a href="javascript:fnAddFile();">[파일추가]</a>
				</th>
				<td colspan="2" width="250">
					<ul id="fileUL">
					</ul>
				</td>	
			</tr>
		</table><br/>
		<p class="joinBtn">
		<security:authorize ifAnyGranted="ROLE_OPER" >
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_edit.gif" onclick="fnSubmitFormData();"  alt="수정"/>
		</security:authorize>
		<img id="listButton" src="${pageContext.request.contextPath}/img/admin/button/btn_list.gif" width="57" height="23"
				onclick="window.location.href = '${pageContext.request.contextPath}/admin/board/boardList?page=${page}&searchString=${searchString}';"  alt="목록"/>
		</p>
	</sf:form>
</div>

<!-- 메세지 알림 Dialog -->
<div id="modifyDialog" title="수정 알림">
	<table class="table_mem">
		<tr>
			<th height="50">해당 게시물를 수정하시겠습니까?</th>
		</tr>
	</table>
</div>
	
<!-- 1차 처리자 제외하고 수정 권한 막기 -->
<security:authorize ifNotGranted="ROLE_OPER" >
	<script type="text/javascript">
		$('input').attr("disabled",true);
		$("select").attr("disabled",true);
		
		var editor;
		CKEDITOR.on( 'instanceReady', function( ev ) 
		{
			editor = ev.editor;

			console.log(CKEDITOR.instances.fckEditor_contents);
			editor.setReadOnly( true );
		});
	</script>
</security:authorize>

<script type="text/javascript">
$(function() {

	$("#modifyDialog").dialog({
		width : 340,
		autoOpen : false,
		modal : true,
		resizable : true,
		buttons : {
			확인 : function() {
				$("#board").submit();
			},
			취소 : function() {
				$("#modifyDialog").dialog("close");
			}
		}
	});
});

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
	
	return true;
}

function fnSubmitFormData()
{
	if (fnCheckFromData())
	{	
		$('#modifyDialog').dialog('open');
	}
}

/**
 * 최대 10개의 파일을 입력폼을 추가한다.
 */
function fnAddFile(){
	
	if ($("input[name=uploadfiles]").length + $("input[name=fileUpdate]").length > 9) {
		alert('최대 파일 첨부개수는 10개입니다.');
		return;
	}
	$("#fileUL").append("<li><input name=\"uploadfiles\" type=\"file\" class=\"inputfile\" id=\"uploadfiles"+$("input[name=uploadfiles]").length+"\" size=\"50\" onchange=\"javascript:fnCheckFileSize('uploadfiles"+$("input[name=uploadfiles]").length+"');\"/></li>");	
}

/**
 * 첨부파일 수정에서 삭제버튼  클릭시 수정file입력폼을 리셋한다.
 */
function fnFileDelClick(object, fileSeq){
	if (object.checked == true){
		$('#fileUpdate'+fileSeq).val("");
		$('#fileUpdateSeq'+fileSeq).val("");
	}
}

/**
 * 첨부파일 수정에서 파일 선택시 삭제 체크를 제거하고 fileUpdateSeq 수정할 정보를 세팅한다.
 */
function fnFileUpload(fileSeq){
	$('#fileDel'+fileSeq).attr("checked",false);
	$('#fileUpdateSeq'+fileSeq).val(fileSeq+'^'+$('#fileUpdate'+fileSeq).val());
}


//*************************************************** FCK 에디터 입력 내용 가져오기.
function getContents(){
	var editor = CKEDITOR.instances.fckEditor_contents;
	
	var data = editor.getData();
	return data;
}

</script>
<script src="${pageContext.request.contextPath}/js/common/fileSizeCheck.js"></script>