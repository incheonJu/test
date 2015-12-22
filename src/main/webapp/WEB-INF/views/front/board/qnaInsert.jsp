<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="stitle">
	<h3>Q&A 등록</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="qna" action="${pageContext.request.contextPath}/front/board/qnaInsertProcess">
		<table class="table_mem">
			<input type="hidden" name="createId" value="${loginMemberInfo.memberId}"/>
			<tr>
				<th width="15%" scope="col">이름</th>
				<td colspan="3">
					<Input Type='Text' name="createName" id="createName" value='${loginMemberInfo.memberName}' Size='30' MaxLength='6'>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">이메일</th>
				<td colspan="3">
				
					<c:set var="arrEmail" value="${fn:split(loginMemberInfo.email,'@')}"/>
                    <c:set var="strEmail1" value="${arrEmail[0]}" />
                    <c:set var="strEmail2" value="${arrEmail[1]}" />
                  <input type="hidden" name="createEmail" id="createEmail"/>
					<Input Type='Text' id="Ls_Email1" value='${strEmail1}' Size='30' MaxLength='20'> @ <Input Type='Text' id="Ls_Email2" value='${strEmail2}' Size='30' MaxLength='20'>
					<select id="Ls_Email3" name='Ls_Email3' style='width: 130px;'>
						<option value=''>선택하십시오.</option>
						<option value='00'>직접입력</option>
						<option value='gmail.com'>gmail.com</option>
						<option value='chol.com'>chol.com</option>
						<option value='dreamwiz.com'>dreamwiz.com</option>
						<option value='empal.com'>empal.com</option>
						<option value='freechal.com'>freechal.com</option>
						<option value='hanafos.com'>hanafos.com</option>
						<option value='hanmail.net'>hanmail.net</option>
						<option value='hanmir.com'>hanmir.com</option>
						<option value='hotmail.com'>hotmail.com</option>
						<option value='korea.com'>korea.com</option>
						<option value='nate.com'>nate.com</option>
						<option value='naver.com'>naver.com</option>
						<option value='netian.com'>netian.com</option>
						<option value='paran.com'>paran.com</option>
						<option value='sayclub.com'>sayclub.com</option>
						<option value='yahoo.co.kr'>yahoo.co.kr</option>
						<option value='yahoo.com'>yahoo.com</option>
					</select>
					<script>
					$('#Ls_Email3').val('${strEmail2}');
					
					if ($('#Ls_Email3').val() == null)
					{
						$('#Ls_Email3').val('00');
					}
				</script>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">전화번호</th>
				<td colspan="3">
					<select name='createTel1' id="createTel1" style='width: px;'>
						<option value=''>선택</option>
						<option value='010'>010</option>
						<option value='011'>011</option>
						<option value='0130'>0130</option>
						<option value='016'>016</option>
						<option value='017'>017</option>
						<option value='018'>018</option>
						<option value='019'>019</option>
						<option value='02'>02</option>
						<option value='031'>031</option>
						<option value='032'>032</option>
						<option value='033'>033</option>
						<option value='041'>041</option>
						<option value='042'>042</option>
						<option value='043'>043</option>
						<option value='0502'>0502</option>
						<option value='0505'>0505</option>
						<option value='051'>051</option>
						<option value='052'>052</option>
						<option value='053'>053</option>
						<option value='054'>054</option>
						<option value='055'>055</option>
						<option value='061'>061</option>
						<option value='062'>062</option>
						<option value='063'>063</option>
						<option value='064'>064</option>
						<option value='070'>070</option>
					</select> - 
					<input name="createTel2" id="createTel2" type="text" maxlength="4" size="10" onKeyDown="NumberOnly(event,this);" value="${loginMemberInfo.tel2}"/> - 
					<input name="createTel3" id="createTel3" type="text" maxlength="4" size="10" onKeyDown="NumberOnly(event,this);" value="${loginMemberInfo.tel3}"/>
					
					<script type="text/javascript">
						$("#createTel1").val('${loginMemberInfo.tel1}');
					</script>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">공개여부</th>
				<td colspan="3">
					<input type="radio" name="openYn" id="openYn" class="chkbox" value="Y" checked>
					<label for="openYn">공개</label>&nbsp;&nbsp;
					<input type="radio" name="openYn" id="openYn" class="chkbox" value="N">
					<label for="openYn">비공개</label>&nbsp;&nbsp; 
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">비밀번호</th>
				<td colspan="3">
					<input type="password" name="createPwd" id="createPwd" value=""> 
				</td>
			</tr>
			
			<tr>
				<th width="15%" scope="col">제목</th>
				<td colspan="3">
					<input name="qnaTitle" id="qnaTitle" size="100" maxlength="100" />
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
					<input type="hidden" name="qnaContents" id="qnaContents"/>
				</td>
			</tr>
			
		</table>
		<p class="joinBtn">
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_add.gif" onclick="fnSubmitFormData()"  alt="등록"/>
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_cancel.gif" onclick="history.back();"  alt="취소"/>
		</p>
	</sf:form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/form_function.js"></script>
<script type="text/javascript">

$(function() {
	emailSelect();
	
	$("#Ls_Email3").change(function(){
		emailSelect();
	});
});

//이메일 선택
function emailSelect()
{
	var varEmailSelect = $("#Ls_Email3 option:selected").val();
	
	if(varEmailSelect == "00")
	{
		$("#Ls_Email2").removeAttr("readonly");
		$("#Ls_Email2").val("${strEmail2}");
	}
	else
	{
		$("#Ls_Email2").attr("readonly",true);
		$("#Ls_Email2").val(varEmailSelect);
	}
}

function fnCheckFromData()
{		
	
	var name = $('#createName');
	var email1 = $('#Ls_Email1');
	var email2 = $('#Ls_Email2');
	var tel1 = $('#createTel1');
	var tel2 = $('#createTel2');
	var tel3 = $('#createTel3');
	var createPwd = $('#createPwd');
	var openYn = $("#openYn:checked").val();
	
	if (name.val().trim().length <= 0)
	{
		alert("이름을 입력해 주세요");
		name.focus();
		return false;
	}
	else if (email1.val().trim().length <= 0 || email2.val().trim().length <= 0)
	{
		alert("이메일을 입력해 주세요");	
		email1.focus();
		return false;
	}
	else if (tel1 == null || tel1.val() == null  || (tel1.val().trim().length <= 0 || tel2.val().trim().length <= 0 || tel3.val().trim().length <= 0))
	{
		alert("전화번호를 입력해 주세요.");
		tel1.focus();
		return false;
	}
	if (openYn == 'N' && (createPwd.val() == null || createPwd.val().trim().length <= 0 )){
		alert("비공개인경우 비밀번호를 입력해 주세요.");
		$('#createPwd').focus();
		return false;
		
	}
	if (!$('#qnaTitle').val().length > 0)
	{
		alert("제목을 입력해 주세요.");
		$('#qnaTitle').focus();
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
		
		$("#qnaContents").val(data);
	}
	
	var email = $("#Ls_Email1").val() + "@" + $("#Ls_Email2").val();
	$("#createEmail").val(email);
	
	return true;
}

function fnSubmitFormData()
{
	if (fnCheckFromData())
	{	
		$("#qna").submit();
	}
}


//*************************************************** FCK 에디터 입력 내용 가져오기.
function getContents(){
	var editor = CKEDITOR.instances.fckEditor_contents;
	
	var data = editor.getData();
	return data;
}

</script>
