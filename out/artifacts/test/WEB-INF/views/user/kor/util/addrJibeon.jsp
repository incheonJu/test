<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="keywords" content="금호폴리켐,KUMHOPOLYCHEM,금호석유화학,EPDM,TPV,KEPA" />
<title>금호폴리켐</title>
<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/layout.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/main.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/board.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/sub.css" />
<script type="text/javascript" src="/resources/js/user/kor/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/user/kor/jquery.tinyscrollbar.js"></script>
<script type="text/javascript" src="/resources/js/user/kor/common.js"></script>
</head>
<body>
<div style="z-index:101;position:absolute;top:0px;left:0px;width:100%;text-align:right;">
	<div style="overflow:hidden;width:60px;float:right;">
		<a href="javascript:parent.closeAddr();"><img src="/resources/image/user/kor/common/btn/btn_movie_on.png" alt="레이어 닫기" /></a>
	</div>
</div>

		<!-- 우편번호찾기 (s) -->
		<div class="layerPopup_01" style="z-index:100">

			<div class="popCont">

				<div class="popTitle">
					주소검색
				</div>

				<div class="addressCont">
					<script type="text/javascript">
					$(document).ready(function(){
						searchJibeonAddr();
					});

					function loadJibeonAddr(){
						$("#addrArea1").hide();
						$("#addrArea2").hide();
						$("#addrResult").show();
					}

					function searchJibeonAddr(){
						$("#addrArea1").show();
						$("#addrArea2").show();
						$("#addrResult").hide();
					}

					function choiseAddr(postzip, addr1, addr2, addr3, addr4){
						var addr = addr1 + " " + addr2 + " " + addr3;
						if (addr4!="") addr += " " + addr4;
						parent.choiseAddr(postzip, addr);
					}
					</script>

					<ul class="subTab">
						<li class="on" rel="tab1"><a href="/kor/util/addrJibeon">지번주소</a></li>
						<li rel="tab2"><a href="/kor/util/addRoadName">도로명주소</a></li>
					</ul>

					<!-- 지번주소 -->
					<div id="tab1" class="tab_cont">
						<p id="addrArea1" class="text_01">
							<span>찾고자 하는 주소의 동(읍/면) 명을 입력하신 후 검색을 누르세요.</span>
							예) 서울시 강남구 역삼1동이라면, ‘역삼1’ 혹은 ‘역삼1동’으로 입력해주세요.
						</p>

						<!-- 검색어 입력 영역 -->
						<div id="addrArea2" class="search">
						<form name="myform" action="/kor/util/addrJibeon/" method="post">
							<label for="src">검색어</label>
							<input type="text" name="searchKeyword" value="" style="width:173px;" />
							<input type="submit" class="btnSearch ml10" value="검색" />
						</form>
						</div>

						<!-- 결과 노출 영역 -->
						<div id="addrResult" style="display:none;">
							<p class="txt3">아래의 주소중에서 해당되는 주소를 선택 또는 클릭 해주세요. <!-- - 검색된 지번주소가 없습니다. --></p>

							<div class="addResult">
								<ul>
									<li>
										[153-023] 서울특별시 금천구 가산동
										<span class="btn"><input type="button" class="btnSearch" value="선택"  onclick="choiseAddr('153023','서울특별시','금천구','가산동','');"></span>
									</li>
									<li>
										[153-802] 서울특별시 금천구 가산동 316~356
										<span class="btn"><input type="button" class="btnSearch" value="선택"  onclick="choiseAddr('153802','서울특별시','금천구','가산동','');"></span>
									</li>
									<li>
										[153-803] 서울특별시 금천구 가산동 371~716
										<span class="btn"><input type="button" class="btnSearch" value="선택"  onclick="choiseAddr('153803','서울특별시','금천구','가산동','');"></span>
									</li>
									<li>
										[153-789] 서울특별시 금천구 가산동 에이스테크노타워10차
										<span class="btn"><input type="button" class="btnSearch" value="선택"  onclick="choiseAddr('153789','서울특별시','금천구','가산동','');"></span>
									</li>
									<li>
										[153-787] 서울특별시 금천구 가산동 에이스하이엔드타워3차
										<span class="btn"><input type="button" class="btnSearch" value="선택"  onclick="choiseAddr('153787','서울특별시','금천구','가산동','');"></span>
									</li>
									<li>
										[153-796] 서울특별시 금천구 가산동 에이스하이엔드타워5차
										<span class="btn"><input type="button" class="btnSearch" value="선택"  onclick="choiseAddr('153796','서울특별시','금천구','가산동','');"></span>
									</li>
									<li>
										[153-794] 서울특별시 금천구 가산동 에이스하이엔드타워7
										<span class="btn"><input type="button" class="btnSearch" value="선택"  onclick="choiseAddr('153794','서울특별시','금천구','가산동','');"></span>
									</li>
									<li>
										[153-773] 서울특별시 금천구 가산동 SK트윈테크타워
										<span class="btn"><input type="button" class="btnSearch" value="선택"  onclick="choiseAddr('153773','서울특별시','금천구','가산동','');"></span>
									</li>
									<li>
										[153-795] 서울특별시 금천구 가산동 STXV타워
										<span class="btn"><input type="button" class="btnSearch" value="선택"  onclick="choiseAddr('153795','서울특별시','금천구','가산동','');"></span>
									</li>
								</ul>
							</div>

							<div style="padding-top:10px;padding-right:15px;text-align:right;">
								<a href="/kor/util/addrJibeon/"><input type="button" class="btnSearch" value="다시검색"></a>
							</div>
						</div>
					</div>

				</div>

			</div>

		</div>
		<!-- 우편번호찾기 (e) -->
</body>
</html>





