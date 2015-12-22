<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div class="stitle">
	<h3>Q&A</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="qna" action="${pageContext.request.contextPath}/front/board/qnaPwdConfirm">
	<input type="hidden" name="qnaSeq" id="qnaSeq" value="${qna.qnaSeq}"/>
	<input type="hidden" name="page" value="${page}"/>
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">비밀번호</th>
				<td colspan="2">
					<Input Type='password' name="createPwd" id="createPwd" Size='30' MaxLength='6'>
				</td>
			</tr>
		</table><br/>
		<p class="joinBtn">
		<img src="${pageContext.request.contextPath}/img/front/button/btn_ok.gif" onclick="fnSubmitFormData();"  alt="확인"/> 
		<img id="listButton" src="${pageContext.request.contextPath}/img/front/button/btn_list.gif" width="57" height="23" 
				onclick="window.location.href = '${pageContext.request.contextPath}/front/board/qnaList?page=${page}&searchString=${searchString}';"  alt="목록"/>
		</p>
	</sf:form>
</div>

<script>
function fnSubmitFormData()
{
	function fnCheckFromData()
	{		
		
		var pwd = $('#createPwd');
				
		if (pwd.val().trim().length <= 0)
		{
			alert("비밀번호를 입력해 주세요");
			pwd.focus();
			return false;
		}
		return true;
	}
	
	if (fnCheckFromData())
	{	
		$("#qna").submit();
	}
}

function openAlertDialog(msg){
	$("#alertMessage").empty();
	$("#alertMessage").append("<b>" + msg + "<b>");
	$("#alertDialog").dialog("open");
}
</script>
