<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="stitle">
	<h3>상세코드 등록</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="detailCode" action="${pageContext.request.contextPath}/admin/code/detailCodeInsertProcess">
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">그룹코드</th>
				<td colspan="3">
				<select name="grpCd" id="grpCd" style="width: 300px;">
					<c:forEach var="masterCode" items="${masterCodeList}">
					<option value="${masterCode.grpCd}">${masterCode.grpCd}.${masterCode.grpCdNm}</option>
					</c:forEach>
				</select> 
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">* 상세코드</th>
				<td colspan="3">
					<input id="dtlsCd" name="dtlsCd" size="5" maxlength="5" />
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">* 사용여부</th>
				<td colspan="3">
					<input type="radio" name="useYn" class="chkbox" id="useYn" value="Y" checked> <label for="userYn">  사용  </label>
					<input type="radio" name="useYn" class="chkbox" id="useYn" value="N"> <label for="userYn">  사용안함  </label>
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">* 상세코드명</th>
				<td colspan="3">
					<input id="dtlsCdNm" name="dtlsCdNm" size="100" maxlength="100" />
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">상세코드설명</th>
				<td colspan="3">
					<input id="dtlsCdDesc" name="dtlsCdDesc" size="100" maxlength="1000" />
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">우선순위</th>
				<td colspan="3">
					<input id="prrtRnk" name="prrtRnk" size="3" maxlength="3" />
				</td>
			</tr>
		</table>
		<p class="joinBtn">
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_add.gif" onclick="fnSubmitFormData()"  alt="등록"/>
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_cancel.gif" onclick="history.back();"  alt="취소"/>
		</p>
	</sf:form>
</div>

<script type="text/javascript">
function fnCheckFromData()
{	
	if (!$('#grpCd').val().length > 0)	{
		alert("그룹코드을 입력해 주세요.");
		$('#grpCd').focus();
		return false;
	}else if (!$('#dtlsCd').val().length > 0)	{
		alert("상세코드을 입력해 주세요.");
		$('#dtlsCd').focus();
		return false;
	}  else if($('#useYn:checked') == undefined) {
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
		$("#detailCode").submit();
	}
}

</script>
