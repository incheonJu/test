<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div class="stitle">
	<h3>게시판 상세</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="board" action="${pageContext.request.contextPath}/admin/board/boardUpdateProcess" enctype="multipart/form-data">
	<input type="hidden" name="boardSeq" id="boardSeq" value="${board.boardSeq}"/>
	<input type="hidden" name="page" value="${page}"/>
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">제목</th>
				<td colspan="2">
					${board.boardTitle}
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">내용</th>
				<td colspan="2">
					<div id="boardContents" class="conTxt"/>
					<!-- Fck Editor -->
					<script type="text/javascript">
					$(function() {
						$("#boardContents").append(decodeURIComponent("${board.boardContents}"));
					});
					</script>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">비고</th>
				<td colspan="2">
					<div id="boardEtc" class="conTxt"/>
					<!-- Fck Editor -->
					<script type="text/javascript">
					$(function() {
						$("#boardEtc").append(decodeURIComponent("${board.boardEtc}"));
					});
					</script>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">첨부파일</th>
				<td width="250" colspan="2">
					<c:forEach var="boardFile" items="${board.boardFileList}" varStatus="status">
						<c:if test="${(boardFile.fileName != null) && (boardFile.fileName != '')}">
							<a href="${pageContext.request.contextPath}/download/Image/board/${boardFile.fileName}" target="_blank">${boardFile.fileName}</a><br/>
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col" rowspan="2">댓글</th>
				<td width="200" colspan="2">
					<ul id="boardReplyUL">
						<c:forEach var="boardReply" items="${board.boardReplyList}" varStatus="status">
							<c:if test="${(boardReply.replyContents != null) && (boardReply.replyContents != '')}">
								<li>${boardReply.replyContents} <b>${boardReply.replyNicknm}</b> <a href="javascript:fnUpdateReply('${boardReply.replySeq}');">M</a> <a href="javascript:fnDeleteReply('${boardReply.replySeq}');">D</a></li> 
							</c:if>
						</c:forEach>
					</ul>
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="replyContents" id="replyContents" rows="4" cols="50"></textarea> 				
				</td>
				<td width="200">
					<input type="hidden" name="replyPrePwd" id="replyPrePwd"/>
					<input type="hidden" name="replySeq" id="replySeq"/>
					닉네임 : <input name="replyNicknm" id="replyNicknm" size="10" maxlength="20" /><br/>
					비밀번호 : <input name="replyPwd" id="replyPwd" size="10" maxlength="20" /><br/>
					<span id="replyButton"><a href="javascript:fnSubmitReply();">[댓글등록]</a></span> 
				</td>
			</tr>
			
		</table><br/>
		<p class="joinBtn">
		<security:authorize ifAnyGranted="ROLE_OPER">
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_edit.gif" onclick="location.href='${pageContext.request.contextPath}/admin/board/boardUpdate/${board.boardSeq}';"  alt="수정"/>
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_del.gif" onclick="$('#deleteDialog').dialog('open');"  alt="삭제"/>
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
	
<div id="deleteDialog" title="삭제 확인">
	<table class="table_mem">
		<tr>
			<th height="50">해당 게시물를 삭제하시겠습니까?</th>
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

var contextPath = $("#contextPath").val();

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
	
	// 삭제 확인 Dialog 생성
	$("#deleteDialog").dialog({
		autoOpen : false,
		modal : true,
		buttons : {
			확인 : function() {
				$(location).attr('href', '${pageContext.request.contextPath}/admin/board/boardDelete/${board.boardSeq}');
				/* deleteData(); */
			},
			취소 : function() {
				$("#deleteDialog").dialog("close");
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

function fnCheckReply(){
	if (!$('#replyContents').val().length > 0)
	{
		alert("댓글을 입력해 주세요.");
		$('#replyContents').focus();
		return false;
	}
	else if (!$('#replyNicknm').val().length >0){
		alert("닉네임을 입력하세요.");
		$('#replyNicknm').focus();
		return false;
	}
	else if (!$('#replyPwd').val().length >0){
		alert("비밀번호을 입력하세요.");
		$('#replyPwd').focus();
		return false;
	}
	else return true;
}

function fnSubmitReply() {
	if (fnCheckReply()) {
		var url = contextPath + "/admin/board/boardReplyInsertProcess";
		var boardSeq = $("#boardSeq").val();
		var replyNicknm = $("#replyNicknm").val();
		var replyPwd = $("#replyPrePwd").val();
		var replyContents = $("#replyContents").val();
		
		var data = '{"boardSeq":"' + boardSeq + '","replyNicknm":"' + replyNicknm + '","replyPwd":"' + replyPwd + '", "replyContents":"' + replyContents + '"}';
		var returnData = serverAPICall("POST", url, data);

		if (returnData.result == true) {
			openAlertDialog("등록 성공");
			
			//댓글목록 reload
			fnReloadReplyList(); 
			
		} else {
			openAlertDialog("등록 실패");
		}
	}
	
}

function setReplyData(replySeq){
	var url = contextPath + "/admin/board/getBoardReply";
	var boardSeq = $("#boardSeq").val();
	var data = '{"boardSeq":"' + boardSeq + '", "replySeq":"' + replySeq + '"}';
	var returnData = serverAPICall("POST", url, data);
	
	if (returnData.result == true) {
		$("#replySeq").val(returnData.object.replySeq);
		$("#replyNicknm").val(returnData.object.replyNicknm);
		$("#replyPrePwd").val(returnData.object.replyPwd);
		$("#replyContents").val(returnData.object.replyContents);
	}
}

/**
 * 스크립트로 처리하면 오류남.
 */
function fnUpdateReply(replySeq){
	
	setReplyData(replySeq);
		
	// 버튼변경
	$("#replyButton").html("<a href=\"javascript:fnUpdateReplyProcess();\">[댓글수정]</a>");
}


/**
 * 스크립트로 처리하면 오류남.
 */
function fnDeleteReply(replySeq){
	
	setReplyData(replySeq);
	
	// 버튼변경
	$("#replyButton").html("<a href=\"javascript:fnDeleteReplyProcess();\">[댓글삭제]</a>");
}

/**
 * 
 */
function fnUpdateReplyProcess(){
	if (fnCheckReply()){
		if ( $("#replyPrePwd").val() != $("#replyPwd").val()){
			openAlertDialog("비밀번호가 일치하지 않습니다.");
			alert("비밀번호가 불일치");
			return false;
		}
		
		var url = contextPath + "/admin/board/updateBoardReplyProcess";
		var boardSeq = $("#boardSeq").val();
		var replySeq = $("#replySeq").val();
		var replyNicknm = $("#replyNicknm").val();
		var replyPwd = $("#replyPwd").val();
		var replyContents = $("#replyContents").val();
		
		var data = '{"boardSeq":"' + boardSeq + '","replySeq":"' + replySeq + '","replyNicknm":"' + replyNicknm + '","replyPwd":"' + replyPwd + '", "replyContents":"' + replyContents + '"}';
		var returnData = serverAPICall("POST", url, data);
		if (returnData.result == true) {
			
			openAlertDialog("수정 성공");
			
			//댓글목록 reload
			fnReloadReplyList();
			
		} else {
			openAlertDialog("수정 실패");
		}

	}
}


function fnDeleteReplyProcess(){
	if (fnCheckReply()){
		if ( $("#replyPrePwd").val() != $("#replyPwd").val()){
			openAlertDialog("비밀번호가 일치하지 않습니다.");
			alert("비밀번호가 불일치");
			return false;
		}
		
		var url = contextPath + "/admin/board/deleteBoardReplyProcess";
		var boardSeq = $("#boardSeq").val();
		var replySeq = $("#replySeq").val();
		
		var data = '{"boardSeq":"' + boardSeq + '","replySeq":"' + replySeq + '"}';
		var returnData = serverAPICall("POST", url, data);
		if (returnData.result == true) {
			
			openAlertDialog("삭제 성공");
			
			//댓글목록 reload
			fnReloadReplyList();
			
		} else {
			openAlertDialog("삭제 실패");
		}

	}
}

function fnReloadReplyList(){
	var url = contextPath + "/admin/board/getBoardReplyList";
	var boardSeq = $("#boardSeq").val();
	
	var data = '{"boardSeq":"' + boardSeq + '"}';
	var returnData = serverAPICall("POST", url, data);
	var boardReplyList = returnData.object;
	if (returnData.result == true) {
		
		$("#boardReplyUL").html("");
		for ( var i = 0; i < boardReplyList.length; i++) {
			$("#boardReplyUL").append("<li>" 
									+ boardReplyList[i].replyContents
									+ "<b>" 
									+ boardReplyList[i].replyNicknm
									+ "</b> <a href=\"javascript:fnUpdateReply('" 
									+ boardReplyList[i].replySeq
									+ "');\">M</a> <a href=\"javascript:fnDeleteReply('" 
									+ boardReplyList[i].replySeq
									+ "');\">D</a></li>");
		}
		
		//버튼
		$("#replyButton").html("<a href=\"javascript:fnSubmitReply();\">[댓글등록]</a>");
						
		// 댓글 입력폼 리셋
		$("#replySeq").val("");
		$("#replyNicknm").val("");
		$("#replyPrePwd").val("");
		$("#replyPwd").val("");
		$("#replyContents").val("");
	} 
	
}

//*************************************************** FCK 에디터 입력 내용 가져오기.
function getContents(){
	var editor = CKEDITOR.instances.fckEditor_contents;
	
	var data = editor.getData();
	return data;
}

function openAlertDialog(msg){
	$("#alertMessage").empty();
	$("#alertMessage").append("<b>" + msg + "<b>");
	$("#alertDialog").dialog("open");
}
</script>
