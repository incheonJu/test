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
<link rel="stylesheet" type="text/css" href="/resources/css/kor/main.css" />
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
		<div class="layerPopup_01" style="z-index:100" >

			<div class="popCont">

				<div class="popTitle">
					주소검색
				</div>

				<div class="addressCont">
					<script type="text/javascript">
					$(document).ready(function(){
						searchJibeonAddr();
						getSIGUNGU();
					});

					function loadRoadName(){
						$("#addrArea1").hide();
						$("#addrResult").show();
					}

					function searchJibeonAddr(){
						$("#addrArea1").show();
						$("#addrResult").hide();
					}

					function choiseAddr(postzip, addr1, addr2, addr3, addr4){
						var addr = addr1 + " " + addr2 + " " + addr3 + " " + addr4;
						parent.choiseAddr(postzip, addr);
					}

					function getSIGUNGU(){
						var searchKeywordType=$("select[name='searchKeywordType'] option:selected").val();
						var jsonUrl="/kor/json/loadSIGUNGU/?searchKeywordType="+searchKeywordType;
						$.getJSON(jsonUrl,function(json){
							var strOption = "";
							if (json.length>0){
								for (var i = 0; i < json.length; i++) {
									strOption += "<option value=\"" + json[i].sigungu + "\">" + json[i].sigungu + "</opton>";
								}
							}
							$("select[name='SIGUNGU']").html(strOption);
						});

					}
					</script>


					<ul class="subTab">
						<li rel="tab1"><a href="/kor/util/addrJibeon">지번주소</a></li>
						<li class="on" rel="tab2"><a href="/kor/util/addrRoadName">도로명주소</a></li>
					</ul>


					<!-- 도로명주소 -->
					<div id="tab2" class="tab_cont">

						<!-- 도로명 검색하기 전 -->
						<div id="addrArea1">
						<form name="myform" action="/kor/util/addrRoadName/" method="post">
							<!-- 검색방법 -->
							<div class="add_check2">
								<dl>
									<dt>검색방법</dt>
									<dd>
										<span class="txt1">시/도 및 시/군/구 선택 후 도로명 입력</span> <br />
										예) 서울특별시(시/도) 강남구(시/군/구) 테헤란로(도로명) <br />
										<span class="txt2">
											* 도로명주소가 검색되지 않는 경우는 행정안전부 새주소안내시스템 <br />
										  (<a href="http://www.juso.go.kr" target="_blank">http://www.juso.go.kr</a>)에서 확인하시기 바랍니다.
										</span>
									</dd>
								</dl>
							</div>

							<!-- 시도 -->
							<div class="add_check2" style="margin-top:20px;">
								<dl>
									<dt>시도</dt>
									<dd class="sel">
										<!-- input (s) -->
										<select name="searchKeywordType" style="width:122px;z-index:999;" onchange="getSIGUNGU();">
											<option value="SEOUL">서울특별시</option>
											<option value="BUSAN">부산광역시</option>
											<option value="DAEGU">대구광역시</option>
											<option value="INCHEON">인천광역시</option>
											<option value="GWANGJU">광주광역시</option>
											<option value="DEAJEON">대전광역시</option>
											<option value="ULSAN">울산광역시</option>
											<option value="SEJONG">세종특별자치시</option>
											<option value="GYEONGGI">경기도</option>
											<option value="GANGWON">강원도</option>
											<option value="CHUNGCHEONG_BUKDO">충청북도</option>
											<option value="CHUNGCHEONG_NAMDO">충청남도</option>
											<option value="JEOLLA_BUKDO">전라북도</option>
											<option value="JEOLLA_NAMDO">전라남도</option>
											<option value="GYEONGSANG_BUKDO">경상북도</option>
											<option value="GYEONGSANG_NAMDO">경상남도</option>
											<option value="JEJU">제주특별자치도</option>
										</select>
									</dd>
									<dt style="margin-left:18px;">시군구</dt>
									<dd class="sel">
										<!-- input (s) -->
										<select name="SIGUNGU" style="width:122px;z-index:999;"></select>
									</dd>
								</dl>
							</div>

							<!-- 검색어 -->
							<div class="add_check2" style="margin-top:20px;">
								<dl>
									<dt>검색어</dt>
									<dd class="sel">
										<!-- input (s) -->
										<div id="addrArea2" class="search">
										<input type="text" name="searchKeyword" style="width:122px;"/>
										<input type="submit" class="btnSearch ml5" value="검색" />
										</div>
									</dd>
								</dl>
							</div>
						</form>
						</div>
						<!-- //도로명 검색하기 전 -->

						<!-- 도로명 검색 후 리스트 -->
						<div id="addrResult" style="display:none;">
							<p class="txt3">아래의 주소중에서 해당되는 주소를 선택 또는 클릭 해주세요. <!-- - 검색된 도로명주소가 없습니다. --></p>

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
								<a href="/kor/util/addrRoadName/"><input type="button" class="btnSearch" value="다시검색"></a>
							</div>
						</div>
						<!-- //도로명 검색 후 리스트 -->

					</div>

				</div>

			</div>

		</div>
		<!-- 우편번호찾기 (e) -->


</body>
</html>





