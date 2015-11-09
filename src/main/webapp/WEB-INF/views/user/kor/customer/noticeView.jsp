<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
window.onload = function(){
	// gnb 현재 활성화 메뉴 표시
	gnb({
		depth01: 3,
		depth02: 3
	});
};
var MAIN_PAGE = false;
</script>
			<!-- title Wrap (s) -->
			<div id="titleWr">
				<h2>공지사항</h2>
			</div>
			<!-- title Wrap (e) -->

			<!-- content (s) -->
			<div id="content">

				<!-- contentWrap (s) -->
				<div class="contentWrap">

					<div class="ReportCont">
						<div class="left">
							<div class="contTop">
								<div class="tit">${notice.titleKor}</div>
								<div class="data">
									<span class="num">No. ${notice.rowNum}</span>
									<span class="day">게시일:<em>${fn:replace(notice.releaseDt,"-",".")}</em></span>
									<span class="hits">${notice.hitCnt} hits</span>
								</div>
							</div>
							<div class="contBody">
								<c:if test="${notice.listImgPath != '' && notice.listImgPath != null}">
									<div class="thumbnail"><img src="/download${notice.listImgPath}" width="558"></div>
								</c:if>
								<div class="txt">
									${notice.contentKor}
								</div>
							</div>
							<div class="mt20">
								<c:if test="${notice.previousSeq != '' && notice.previousSeq != null}">
									<div class="fl">
										<a class="btnG" href="/kor/customer/get/${notice.previousSeq}?page=${page}&keyfield=${keyfield}&keyword=${keyword}">이전</a>
									</div>
								</c:if>
								<c:if test="${notice.nextSeq != '' && notice.nextSeq != null}">
									<div class="fl ml5">
										<a class="btnG" href="/kor/customer/get/${notice.nextSeq}?page=${page}&keyfield=${keyfield}&keyword=${keyword}">다음</a>
									</div>
								</c:if>
								<div class="fr ml5"><a href="/kor/customer/noticeList?page=${page}&keyfield=${keyfield}&keyword=${keyword}" class="btnMint">목록</a></div>
							</div>
						</div>
						<script>
							function list(_seq, _page, _keyfield, _keyword){
								$.getJSON("/kor/customer/noticeJson?seq="+_seq+"&page="+_page+"&keyfield="+_keyfield+"&keyword="+_keyword, function(d){
									var html = "";
									var prev = "";
									var next = "";

									if(d.page == 1){ prev = 1; } else { prev = d.page-1; }
									if(d.total == _page){ next = d.total; } else { next = d.page+1; }

									for(var i=0; i<d.rows.length; i++){
										if(d.rows[i].seq == _seq){
											html += "<div class=\"contTop\">";
											html += "<div class=\"tit f000\"><strong>No." + d.rows[i].rowNum + " <span class=\"day f000\">${fn:replace(notice.releaseDt,"-",".")}</span><strong></div>";
											html += "<div class=\"contBody\">";
											html += "<strong>${notice.titleKor}</strong>";
											html += "</div>";
											html += "</div>";
										}else {
											html += "<div class=\"contTop bt mt20\">";
											html += "<div class=\"tit\">No. " + d.rows[i].rowNum + "<span class=\"day\">" + common.commonModule.dateformat(d.rows[i].releaseDt, "yyyy.MM.dd") + "</span></div>";
											html += "<div class=\"Cbody\"><a href=\"/kor/notice/get/" + d.rows[i].seq + "\">" + d.rows[i].titleKor + "</a></div>";
											html += "</div>";
										}
									}

									if(d.rows.length > 0) {
										html += "<div class=\"paging\">";
										html += "<span class=\"p_1\">";
										html += "<a class=\"first\" href=\"javascript:list('${notice.seq}','1');\"></a>";
										html += "<a class=\"prev\" href=\"javascript:list('${notice.seq}','"+prev+"');\"></a>";
										html += "</span>";
										html += "<span class=\"paging_num\">";

										html += "<a href=\"javascript:void(0);\" class=\"on\" >"+d.page+"</a>/<a href=\"javascript:void(0);\">"+d.total+"</a>";

										html += "</span>";
										html += "<span class=\"p_1\">";
										html += "<a class=\"next\" href=\"javascript:list('${notice.seq}','"+next+"');\"></a>";
										html += "<a class=\"end\" href=\"javascript:list('${notice.seq}','"+d.total+"');\"></a>";
										html += "</span>";
										html += "</div>";
									}

									$(".right").html(html);
								});
							}

							$(document).ready(function(){
								list("${notice.seq}", "1" , '${keyfield}', '${keyword}' );
							});
						</script>
						<div class="right">
						</div>
					</div>

				</div>
				<!-- contentWrap (e) -->

			</div>
			<!-- content (e) -->
