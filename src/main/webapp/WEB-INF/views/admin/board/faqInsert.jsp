<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="stitle">
	<h3>FAQ 등록</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="faq" action="${pageContext.request.contextPath}/admin/board/faqInsertProcess">
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">제목</th>
				<td colspan="3">
					<input name="faqTitle" id="faqTitle" size="100" maxlength="100" />
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
					<input type="hidden" name="faqContents" id="faqContents"/>
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
		$("#faq").submit();
	}
}

//*************************************************** FCK 에디터 입력 내용 가져오기.
function getContents(){
	var editor = CKEDITOR.instances.fckEditor_contents;
	
	var data = editor.getData();
	return data;
}

</script>
