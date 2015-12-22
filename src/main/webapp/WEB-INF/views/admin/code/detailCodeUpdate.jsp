<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div class="stitle">
	<h3>상세코드 수정</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="detailCode" action="${pageContext.request.contextPath}/admin/code/detailCodeUpdateProcess">
	<input type="hidden" name="grpCd" value="${detailCode.grpCd}">
	<input type="hidden" name="dtlsCd" value="${detailCode.dtlsCd}">
	<input type="hidden" name="page" value="${page}">
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">그룹코드.명</th>
				<td colspan="3">
					${detailCode.grpCd}.${detailCode.masterCode.grpCdNm}
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">상세코드</th>
				<td colspan="3">
					${detailCode.dtlsCd}
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">* 사용여부</th>
				<td colspan="3">
					<input type="radio" name="useYn" class="chkbox" id="useYn" value="Y"> <label for="userYn">  사용  </label>
					<input type="radio" name="useYn" class="chkbox" id="useYn" value="N"> <label for="userYn">  사용안함  </label>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">* 상세코드명</th>
				<td colspan="3">
					<input id="dtlsCdNm" name="dtlsCdNm" size="100" maxlength="100" value="${detailCode.dtlsCdNm}"/>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">그룹코드설명</th>
				<td colspan="3">
					<input id="dtlsCdDesc" name="dtlsCdDesc" size="100" maxlength="1000" value="${detailCode.dtlsCdDesc}"/>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">우선순위</th>
				<td colspan="3">
					<input id="prrtRnk" name="prrtRnk" size="3" maxlength="3" value="${detailCode.prrtRnk}"/>
				</td>
			</tr>
		</table>
		<br/>
		<p class="joinBtn">
		<security:authorize ifAnyGranted="ROLE_OPER" >
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_edit.gif" onclick="fnSubmitFormData();"  alt="수정"/>
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_del.gif" onclick="$('#deleteDialog').dialog('open');"  alt="삭제"/>
		</security:authorize>
		<img id="listButton" src="${pageContext.request.contextPath}/img/admin/button/btn_list.gif" width="57" height="23"
				onclick="window.location.href = '${pageContext.request.contextPath}/admin/code/detailCodeList?page=${page}&searchString=${searchString}';"  alt="목록"/>
		</p>
	</sf:form>
</div>

<!-- 메세지 알림 Dialog -->
<div id="modifyDialog" title="수정 알림">
	<table class="table_mem">
		<tr>
			<th height="50">해당 상세코드를 수정하시겠습니까?</th>
		</tr>
	</table>
</div>
	
<div id="deleteDialog" title="삭제 확인">
	<table class="table_mem">
		<tr>
			<th height="50">해당 상세코드를 삭제하시겠습니까?</th>
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

	$("input:radio[name='useYn']:radio[value='${detailCode.useYn}']").attr("checked",true);
	
	
	$("#modifyDialog").dialog({
		width : 340,
		autoOpen : false,
		modal : true,
		resizable : true,
		buttons : {
			확인 : function() {
				$("#detailCode").submit();
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
				$(location).attr('href', '${pageContext.request.contextPath}/admin/code/detailCodeDeleteProcess?grpCd=${detailCode.grpCd}&dtlsCd=${detailCode.dtlsCd}');
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
	if($('#useYn:checked') == undefined) {
		alert("사용여부을 입력해 주세요.");
		$('#useYn').focus();
		return false;
	} else if (!$('#dtlsCdNm').val().length > 0)	{
		alert("상세코드명을 입력해 주세요.");
		$('#dtlsCdNm').focus();
		return false;
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

</script>
