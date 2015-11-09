<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
window.onload = function(){
	// gnb 현재 활성화 메뉴 표시
	gnb({
		depth01: 4,
		depth02: 1
	});
};
var MAIN_PAGE = false;
</script>
			<!-- Tab 3depth (s) -->
			<div class="tab3Depth">
				<ul class="t2">
					<li><a href="contribution">사회공헌 개요</a></li>
					<li class="on"><a href="socialContributionNewsList">소식지</a></li>
				</ul>
			</div>
			<!-- Tab 3depth (e) -->

			<!-- title Wrap (s) -->
			<div id="titleWr">
				<h2>사회공헌</h2>
			</div>
			<!-- title Wrap (e) -->

            <!-- content (s) -->
			<div id="content" class="bgWhite">

				<c:if test="${top != null}">
				<!-- 뉴스 Top (s)  -->
				<div class="boardTopWr">
					<div class="inner">
						<div class="leftArea">
							<h3>&nbsp;<span class="day">${fn:replace(top.releaseDt,"-",".")}</span></h3>
							<div class="subNews">
								<!-- 뉴스  -->

								<c:choose>
									<c:when test="${fn:length(top.titleKor) > 30}">
										<c:set var="topTitle" value="${fn:substring(top.titleKor,0,30)}..." />
									</c:when>
									<c:when test="${fn:length(top.titleKor) <= 30}">
										<c:set var="topTitle" value="${top.titleKor}" />
									</c:when>
								</c:choose>
								<p class="subtitle">${topTitle}</p>
								<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/scroll.css" media="screen,projection"/>
								<script type="text/javascript" language="JavaScript" src="/resources/js/user/kor/scroll.js"></script>
								<script type="text/javascript">
									$(function() {
										$("#scrollbar1").tinyscrollbar();
									});
								</script>
								<style>
									.track{width:8px !important}
									.viewport{width:330px !important; height:110px !important}
									.overview{padding:10px 10px 0 0 !important}
									.scrollbar{height:110px !important}
								</style>
								<div id="scrollbar1">
									<div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div>
									<div class="viewport">
										<div class="overview">
											${top.summaryKor}
										</div>
									</div>
								</div>
								<div class="btn">
									<a href="socialContributionNewsGet/${top.seq}?page=${paging.currentPage}&keyfield=${keyfield}&keyword=${keyword}" class="btnMore">
										<span class="txt">자세히보기</span>
										<span class="blt icon"></span>
									</a>
								</div>
							</div>
						</div>
						<div class="rightArea">
							<c:if test="${top.topImgPath != '' && top.topImgPath != null}">
							<div class="thumbnail"><img src="/download${top.topImgPath}" width="558" height="326" alt="" /></div>
							</c:if>
						</div>
					</div>
				</div>
				</c:if>
				<script type="text/javascript">
					$(document).ready(function() {
						$("#scrollbar1").tinyscrollbar();

						$(".select_list ul li").on({
							"click" : function(){
								switch($(this).context.id){
									case "000" :
										$("#keyfield").val("");
										break;

									case "100" :
										$("#keyfield").val("title");
										break;

									default :
										$("#keyfield").val("content");
										break;
								}
							}
						});

						$(".select_list").ready(function(){
							var text = "${keyfield}";
							if(text == ""){
								text = "전체";
							} else if(text == "title"){
								text = "제목";
							} else {
								text = "내용";
							}
							$("#NEWS_TYPE").html(text);
						});

						$(".btnDetailView").on({
							"mouseenter": function(){
								icon({selecter: $(this).find(".icon"), turn : "on", size : 13, cut : 7});
							},
							"mouseleave": function(){
								icon({selecter: $(this).find(".icon"), turn : "off", size : 13, cut : 7});
							}
						});
					});
				</script>
				<!-- 뉴스 Top (e) -->

				<!-- contentWrap (s) -->
				<div class="contentWrap pt0">

					<div class="pt100 relative">
						<div class="boardSearch">
							<form name="frmSearch" action="/kor/management/socialContributionNewsList" method="get">
							<input type="hidden" name="keyfield" id="keyfield" value="${keyfield}" />
							<div class="fl ml5" style="width:150px">
								<div class="select_natrue_bottom">
									<div class="design_select">
										<div class="txt_val_view">
											<div id="NEWS_TYPE" class="txt_val">전 체</div>
											<a href="#" class="btn"><span class="icon"></span></a>
										</div>
										<div class="select_list">
											<ul>
											<li id="000"><a href="#">전체</a></li>
											<li id="100"><a href="#">제목</a></li>
											<li id="200"><a href="#">내용</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<input type="text" class="txtInput" name="keyword" value="${keyword}" style="width:260px" title="검색어 입력" />
							<input type="submit" class="btnSearch" value="검색" />
							</form>
						</div>
						<div class="pressList">
							<ul>
								<c:if test="${fn:length(list) == 0}">
									<li>
										<div  style="height: 300px; text-align: center;">
											<p style="line-height: 300px; font-size: 16px; font-weight: bold;">소식이 없습니다. </p>
										</div>
									</li>
								</c:if>
								<c:forEach var="data" items="${list}">
									<li>
										<div class="pressListCont">
											<div class="pressList_txt">
												<a href="socialContributionNewsGet/${data.seq}?page=${paging.currentPage}&keyfield=${keyfield}&keyword=${keyword}">
													<span class="press_txt">${data.titleKor}</span> <br />
													<span class="press_txt2">${data.summaryKor}</span>
												</a>
											</div>
											<p class="day"><span class="num">No. ${data.rowNum}</span><span class="date">${fn:replace(data.releaseDt,"-",".")}</span><span class="hit">${data.hitCnt} hits</span></p>
										</div>
										<c:if test="${data.listImgPath != '' && data.listImgPath != null}">
											<div class="thumbnail">
												<a href="socialContributionNewsGet/${data.seq}?page=${paging.currentPage}&keyfield=${keyfield}&keyword=${keyword}"><img src="/download${data.listImgPath}" width="245" height="143"></a>
											</div>
										</c:if>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<c:if test="${paging.totalRecordSize > 0}">
					<!-- paging (s) -->
					<c:import url="../../../common/user_paging.jsp">
						<c:param name="queryStr" value="/kor/management/socialContributionNewsList?keyfield=${keyfield}&keyword=${keyword}" />
					</c:import>
					</c:if>
					<!-- paging (e) -->

				</div>
				<!-- contentWrap (e) -->

			</div>
            <!-- content (e) -->
