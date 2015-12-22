<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div class="stitle">
	<h3>FAQ 수정</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="faq" action="${pageContext.request.contextPath}/admin/board/faqUpdateProcess">
	<input type="hidden" name="faqSeq" value="${faq.faqSeq}"/>
	<input type="hidden" name="page" value="${page}"/>
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">제목</th>
				<td colspan="3">
					<input id="faqTitle" name="faqTitle" size="100" maxlength="100" value="${faq.faqTitle}" />
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">내용</th>
				<td colspan="3">
					<textarea name="fckEditor_contents" cols="67" rows="5" id="fckEditor_contents" rows="10"></textarea>
					<!-- Fck Editor -->
					<script type="text/javascript">
						var data = "${faq.faqContents}";
						data = decodeURIComponent(data);
						$("#fckEditor_contents").val(data);
						CKEDITOR.replace( 'fckEditor_contents', {width: 700, height: 400});
					</script>
					<input type="hidden" id="faqContents" name="faqContents">
				</td>
			</tr>
		</table><br/>
		<p class="joinBtn">
		<security:authorize ifAnyGranted="ROLE_OPER" >
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_edit.gif" onclick="fnSubmitFormData();"  alt="수정"/>
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_del.gif" onclick="$('#deleteDialog').dialog('open');"  alt="삭제"/>
		</security:authorize>
		<img id="listButton" src="${pageContext.request.contextPath}/img/admin/button/btn_list.gif" width="57" height="23"
				onclick="window.location.href = '${pageContext.request.contextPath}/admin/board/faqList?page=${page}&searchString=${searchString}';"  alt="목록"/>
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
$(function() {

	$("#modifyDialog").dialog({
		width : 340,
		autoOpen : false,
		modal : true,
		resizable : true,
		buttons : {
			확인 : function() {
				$("#faq").submit();
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
				$(location).attr('href', '${pageContext.request.contextPath}/admin/board/faqDelete/${faq.faqSeq}');
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
	if (!$('#faqTitle').val().length > 0)
	{
		alert("제목을 입력해 주세요.");
		$('#faqTitle').focus();
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
		
		$("#faqContents").val(data);
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


//*************************************************** FCK 에디터 입력 내용 가져오기.
function getContents(){
	var editor = CKEDITOR.instances.fckEditor_contents;
	
	var data = editor.getData();
	return data;
}

</script>
