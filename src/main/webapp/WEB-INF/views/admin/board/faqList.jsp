<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<security:authentication property="authorities" var="authorities" />

<div class="stitle">
	<h3>FAQ 목록조회</h3>
</div>

<div id="scArea">
	<table class="table_search">
		<tr>
			<th width="15%">검색</th>
			<td width="85%">
				<select name="searchField" id="organ" style="width:80px;">
					<option value="all">전체</option>
					<option value="createId">아이디</option>
					<option value="createNm">이름</option>
				</select>
				<input name="searchString" type="text" id="keyword" size="30" onkeydown = "if(event.keyCode==13) search(1);" /> 
				<img id="searchButton" src="${pageContext.request.contextPath}/img/admin/button/btn_search.gif" width="35" height="23" alt="조회" />
			</td>
		</tr>
	</table>
	<br/>

	<div id="jqList">
		<table id="list"></table>
		<div id="pager"></div>
	</div><br/><br/>
	<security:authorize ifAnyGranted="ROLE_OPER" >
		<p class="joinBtn">
			<img src="${pageContext.request.contextPath}/img/admin/button/btn_add.gif" onclick="$(location).attr('href', '${pageContext.request.contextPath}/admin/board/faqInsert')"  alt="등록"/>
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
			console.log(url);
			var searchString = $('#keyword').val();
			jQuery("#list").jqGrid({
				url : url,
				datatype : "json",
				autowidth : true,
				height: "100%",
				colNames : [ 'No', '제목', '등록일' ],
				colModel : [
					{name : 'faqSeq', index : 'FAQ_SEQ', width : 80, align : "left"}, 
					{name : 'faqTitle', index : 'FAQ_TITLE', width : 430, align : "left", formatter:titleFormat},
					{name : 'createDt', index : 'CREATE_DT', width : 150, align : "left"}
				],
				rowNum : 10,
				rowList : [ 10, 20, 30 ],
				pager : '#pager',
				page : pageNum,
				sortname : 'FAQ_SEQ',
				viewrecords : true,
				sortorder : "desc",
				onSelectRow : function(rowid, iRow, iCol, e) {
					var seq = jQuery("#list").jqGrid('getCell', rowid, 0);
					$(location).attr('href', "${pageContext.request.contextPath}/admin/board/faqUpdate/" + seq + "?page="+$("#list").getGridParam('page')+"&searchString=" + searchString);
				},
				caption : "FAQ"
			});
			$(".ui-jqgrid-titlebar").css('height', 20);
		}

		// Title Format (현재 날짜와 비교해서 신규 게시글에 new 이미지 추가.)
		function titleFormat(cellvalue, options, rowObject)
		{
			var title = rowObject.faqTitle;
			
			
			if (isBetweenDay(rowObject.regDate))
			{
				title += " <img src='${pageContext.request.contextPath}/img/admin/button/new_icons.gif' alt='new'/>";
			}
			return title;
		}
		
		function search(pageNum) {
			var searchField = "";
			var searchString = $('#searchString').val();

			searchDataGrid(searchField, searchString, pageNum);
		}
		
		function searchDataGrid(searchField, searchString, pageNum){
			
			// 검색 필드 URL 인코딩
			searchString = encodeURIComponent(searchString);
			
			$('#jqList').empty();
			$('#jqList').append("<table id='list'></table><div id='pager'></div>");
			var url = "${pageContext.request.contextPath}/admin/board/faqJqList?searchField=" + searchField + "&searchString=" + searchString;
			
			jqGrid(url, pageNum);
		}
		
		function openAlertDialog(msg){
			$("#alertMessage").empty();
			$("#alertMessage").append("<b>" + msg + "<b>");
			$("#alertDialog").dialog("open");
		}
	</script>