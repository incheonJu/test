<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="stitle">
	<h3>Q&A 상세</h3>
</div>

<div id="scArea">
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">이름</th>
				<td colspan="3">
					${qna.createName}
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">이메일</th>
				<td colspan="3">
					${qna.createEmail}
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">전화번호</th>
				<td colspan="3">
					${qna.createTel1} - ${qna.createTel2} - ${qna.createTel3} 
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">공개여부</th>
				<td colspan="3">
					${qna.openYn}
				</td>
			</tr>
			<tr>
				<th width="15%" scope="col">제목</th>
				<td colspan="3">
					${qna.qnaTitle}
				</td>
			</tr>
			 
			<tr>
				<th width="15%" scope="col">내용</th>
				<td colspan="3">
					<div id="qnaContents" class="conTxt"/>
					<!-- Fck Editor -->
					<script type="text/javascript">
					$(function() {
						$("#qnaContents").append(decodeURIComponent("${qna.qnaContents}"));
					});
					</script>
				</td>
			</tr>
			<c:if test="${qna.replyQna != null}">
			
			<tr>
				<th width="15%" scope="col">답글제목</th>
				<td colspan="3">
					${qna.replyQna.qnaTitle}
				</td>
			</tr>
			 
			<tr>
				<th width="15%" scope="col">답글내용</th>
				<td colspan="3">
					<div id="qnaReplyContents" class="conTxt"/>
					<!-- Fck Editor -->
					<script type="text/javascript">
					$(function() {
						$("#qnaReplyContents").append(decodeURIComponent("${qna.replyQna.qnaContents}"));
					});
					</script>
				</td>
			</tr>
			</c:if>
		</table>
		<p class="joinBtn">
			<img id="listButton" src="${pageContext.request.contextPath}/img/front/button/btn_list.gif" width="57" height="23" 
				onclick="window.location.href = '${pageContext.request.contextPath}/front/board/qnaList?page=${page}&searchString=${searchString}';"  alt="목록"/>
		</p>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/form_function.js"></script>
<script type="text/javascript">

//*************************************************** FCK 에디터 입력 내용 가져오기.
function getContents(){
	var editor = CKEDITOR.instances.fckEditor_contents;
	
	var data = editor.getData();
	return data;
}

</script>
