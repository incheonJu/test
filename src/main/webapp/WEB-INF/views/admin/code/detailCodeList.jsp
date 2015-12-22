<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<security:authentication property="authorities" var="authorities" />

<div class="stitle">
	<h3>상세코드 관리</h3>
</div>

<div id="scArea">
	<table class="table_search">
		<tr>
			<th width="15%">검색</th>
			<td width="85%">
				<select name="keyfield" id="keyfield" style="width:80px;">
					<option value="all">전체</option>
					<option value="grpCd">그룹코드</option>
					<option value="grpCdNm">그룹코드명</option>
					<option value="dtlsCd">상세코드</option>
					<option value="dtlsCdNm">상세코드명</option>
					
				</select>
			<input name="keyword" type="text" id="keyword" size="30" onkeydown = "if(event.keyCode==13) search(1);" /> 
			<img id="searchButton" src="${pageContext.request.contextPath}/img/admin/button/btn_search.gif" width="35" height="23" alt="조회" />
			</td>
		</tr>
		<tr>
			<th width="15%">그룹코드</th>
			<td width="85%">
			<select name="searchGrpCd" id="searchGrpCd" style="width: 300px;">
					<option value="">전체</option>
					<c:forEach var="masterCode" items="${masterCodeList}">
					<option value="${masterCode.grpCd}">${masterCode.grpCd}.${masterCode.grpCdNm}</option>
					</c:forEach>
			</select> 
		</tr>
	</table>
	<br/>

	<div id="jqList">
		<table id="list"></table>
		<div id="pager"></div>
	</div><br/><br/>
	<security:authorize ifAnyGranted="ROLE_OPER" >
		<p class="joinBtn">
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_add.gif" onclick="$(location).attr('href', '${pageContext.request.contextPath}/admin/code/detailCodeInsert')"  alt="등록"/>
		</p>
	</security:authorize>
</div>


<!-- 메세지 알림 Dialog -->
<div id="alertDialog" title="알림">
	<table class="table_search">
		<tr>
			<th height="50">
				<div id="alertMessage"></div>
			</th>
		</tr>
	</table>
</div>

	<script src="${pageContext.request.contextPath}/js/lib/jqGrid/js/i18n/grid.locale-kr.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/jqGrid/js/jquery.jqGrid.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/jqGrid/plugins/ui.multiselect.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/jqGrid/plugins/jquery.tablednd.js"></script>
	<script type="text/javascript">
		$(function() {
			
			$("#searchGrpCd").change(function(){
				search(1);
			});
			if ('${searchField}' != '') {
				$('#keyfield').val('${searchField}');
			}
			
			if ('${searchString}' != '') {
				$('#keyword').val('${searchString}');
			}

			var pageNum = 1;
			if ('${page}' != '') {
				pageNum = '${page}';
			}
			search(pageNum);

			$("#searchButton").click(function() {
				search(1);
			});
			
			$("#alertDialog").dialog({
				width : 500,
				autoOpen : false,
				modal : true,
				resizable : true,
				buttons : {
					확인 : function() {
						$("#alertDialog").dialog("close");
					}
				}
			});
			
			if ('${message}' != "")
			{
				openAlertDialog('${message}');
			}
		});

		function jqGrid(url, pageNum) {
			var searchString = $('#keyword').val();
			jQuery("#list").jqGrid({
				url : url,
				datatype : "json",
				autowidth : true,
				height: "100%",
				colNames : [ '그룹코드', '그룹코드명',  '상세코드', '상세코드명', '우선순위', '사용여부', '상세코드설명', '수정일', '수정자' ],
				colModel : [
					{name : 'grpCd', index : 'GRP_CD', width : 80, align : "center"}, 
					{name : 'masterCode.grpCdNm', index : 'F_GRPCDNM(GRP_CD)', width : 80, align : "center"},
					{name : 'dtlsCd', index : 'DTLS_CD', width : 80, align : "center"},
					{name : 'dtlsCdNm', index : 'DTLS_CD_NM', width : 80, align : "center"},
					{name : 'prrtRnk', index : 'PRRT_RNK', width : 80, align : "center"},
					{name : 'useYn', index : 'USE_YN', width : 80, align : "center"},
					{name : 'dtlsCdDesc', index : 'DTLS_CD_DESC', width : 300, align : "left"},
					{name : 'updateDt', index : 'UPDATE_DT', width : 80, align : "center"},
					{name : 'updateId', index : 'UPDATE_ID', width : 80, align : "center"}
				],
				rowNum : 10,
				rowList : [ 10, 20, 30 ],
				pager : '#pager',
				page : pageNum,
				sortname : 'GRP_CD',
				viewrecords : true,
				sortorder : "desc",
				onSelectRow : function(rowid, iRow, iCol, e) {
					$(location).attr('href', "${pageContext.request.contextPath}/admin/code/detailCodeUpdate?grpCd="+jQuery("#list").jqGrid('getCell', rowid, 0)+"&dtlsCd="+jQuery("#list").jqGrid('getCell', rowid, 2)+"&page="+$("#list").getGridParam('page')+"&searchString=" + searchString);
				},
				caption : "마스터코드 목록"
			});
			$(".ui-jqgrid-titlebar").css('height', 20);
		}

		// Title Format (현재 날짜와 비교해서 신규 게시글에 new 이미지 추가.)
		function titleFormat(cellvalue, options, rowObject)
		{
			var title = rowObject.title;
			
			
			if (isBetweenDay(rowObject.regDate))
			{
				title += " <img src='${pageContext.request.contextPath}/img/admin/button/new_icons.gif' alt='new'/>";
			}
			return title;
		}
		
		function search(pageNum) {
			var searchField = $('#keyfield').val();
			var searchString = $('#keyword').val();
			var searchGrpCd = $('#searchGrpCd').val();

			searchDataGrid(searchField, searchString, searchGrpCd,  pageNum);
		}
		
		function searchDataGrid(searchField, searchString, searchGrpCd , pageNum){
			
			// 검색 필드 URL 인코딩
			searchString = encodeURIComponent(searchString);
			
			$('#jqList').empty();
			$('#jqList').append("<table id='list'></table><div id='pager'></div>");
			var url = "${pageContext.request.contextPath}/admin/code/detailCodeJqList?searchField=" + searchField + "&searchString=" + searchString + "&searchGrpCd=" + searchGrpCd;
			
			jqGrid(url, pageNum);
		}
		
		function openAlertDialog(msg){
			$("#alertMessage").empty();
			$("#alertMessage").append("<b>" + msg + "<b>");
			$("#alertDialog").dialog("open");
		}
	</script>