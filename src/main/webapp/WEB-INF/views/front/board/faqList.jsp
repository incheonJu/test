<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<security:authentication property="authorities" var="authorities" />

<div class="stitle">
	<h3>FAQ 목록조회</h3>
</div>

    <!-- 컨텐츠 영역 -->
            <div id="subContArea"> 
                
                <div id="contentArea"> 
                    <!-- 게시판 리스트 영역 -->
                    <div class="faqArea">
                        <div class="searchboxarea">
                            <div class="searchbox">
                                <label for="searchQuery" style="display:none;">검색어</label><input name="searchQuery"  id="searchQuery" type="text" class="sebox" value="" /> 
								<input name="btnSearch" type="submit" class="inbtn" id="btnSearch" value="검색하기" onclick="search('1');"/>
                            </div>

                            <div class="topcnt">
                            	<span class="n">${paging.currentPage}</span> / ${paging.totalPageSize} page
                            </div>
                        </div>
                        <ul class="qlist">
                           	<c:if test="${fn:length(faqList) == 0}">
								<li>
									<p align="center">데이터가 없습니다.</p>
								</li>
							</c:if>
							<c:forEach var="data" items="${faqList}" varStatus="status">
								
								<li>
									<c:set var="strTitle" value="${data.faqTitle}"/>
									<c:set var="strTitle" value="${fn:replace(strTitle,'<','&lt;')}"/>
									<c:set var="strTitle" value="${fn:replace(strTitle,'>','&gt;')}"/>
									<span class="qua"><a href="javascript:fnViewFaq('divFaq${data.faqSeq}')">${strTitle}</a></span>
									<span class="ans" id="divFaq${data.faqSeq}" style="display:none;"></span>
								</li>
								<script>
									$("#divFaq${data.faqSeq}").append(decodeURIComponent("${data.faqContents}"));
								</script>
							</c:forEach>
                            </ul>
                        </div>
                        <div class="paging">
                        <c:if test="${paging.totalPageSize > 0}">
							<p class="prev">
								<!-- 시작 페이지가 1이 아닐경우에만 이전 페이지 버튼 보여줌. -->
								<c:if test="${paging.startPage != 1}">
									<a href="javascript:search('${paging.startPage - 1}');">
										<img src="${pageContext.request.contextPath}/resources/images/member/btn_prev.gif" width="34" height="10" alt="이전페이지" />
									</a>
								</c:if>
							</p>
							<ul class="pagNum">
								<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
									<li><a href="javascript:search('${i}');" <c:if test="${paging.currentPage == i}">class="on"</c:if>>${i}</a></li>
								</c:forEach>
							</ul>
							<p class="next">
								<!-- 현재 마지막 페이지가 끝 페이지가 아닐 경우 다음 페이지 버튼 보여줌.-->
								<c:if test="${paging.endPage != paging.totalPageSize }">
									<a href="javascript:search('${paging.endPage + 1}');">
										<img src="${pageContext.request.contextPath}/resources/images/member/btn_next.gif" width="34" height="10" alt="다음페이지" />
									</a>
								</c:if>
							</p>
						</c:if>
                        </div>
                    </div>
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

	<script type="text/javascript">
		$(function() {
			$('#searchQuery').bind('keypress', function(e) {
			    if (e.which == 13) {
			    	search('1');
			    }
			});

			$(function(){
				$("#searchField").val('');
			});

		});
		
		function search(page)
		{
			var url = "/front/board/faqList?page=" + page + makeSearchUrl();
			$(location).attr('href',url);
		}

		function makeSearchUrl(){
			var searchField = "";
			var searchQuery = $("#searchQuery").val();
			return "&searchField=" + searchField + "&searchQuery=" + searchQuery;
		}
		
		function openAlertDialog(msg){
			$("#alertMessage").empty();
			$("#alertMessage").append("<b>" + msg + "<b>");
			$("#alertDialog").dialog("open");
		}
		
		function fnViewFaq(obj)
		{
			
			if ( $("#"+obj).css("display") == "none" )
				$("#"+obj).show();
			else
				$("#"+obj).hide();

			
			/*if(tar=="1"){
			 document.getElementById("table1").style.display = "block";
			} else if(tar=="2"){
			document.getElementById("table1").style.display = "none";
			}*/
		}
	</script>