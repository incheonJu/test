<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- 셀렉트 내 스크롤 관련 인크루드 -->
<link rel="stylesheet" type="text/css" href="/resources/css/user/kor/scroll.css" media="screen,projection"/>
<script type="text/javascript" language="JavaScript" src="/resources/js/user/kor/scroll.js"></script>
<script type="text/javascript">
	window.onload = function(){
		// gnb 현재 활성화 메뉴 표시
		gnb({
			depth01: 3,
			depth02: 0
		});
	};
	var MAIN_PAGE = false;

	$("#typeCd").bind("change", function(){
		divisionValueReset();
		typeCode($(this).val());
	});
</script>
			<!-- title Wrap (s) -->
			<div id="titleWr">
				<h2>문의하기</h2>
			</div>
			<!-- title Wrap (e) -->

            <!-- content (s) -->
			<div id="content">

				<!-- contentWrap (s) -->
				<div class="contentWrap">

					<h3 class="h_sub">고객정보 입력</h3>
					<p class="ar"><span class="noti_txt1">* 필수 입력 항목을 입력하셔야만 해당 파트 담당자에게 문의가 가능합니다.</span></p>
					<div class="tbldiv mt10">
						<table class="tbl_qna" summary="고객정보의 고객명(회사명), 연락처(핸드폰), 연락처(집/회사), 이메일주소, 현주소(집/직장), 문의파트, 제목, 내용이 보여집니다.">
							<caption>고객정보 테이블</caption>
							<colgroup>
								<col style="width:15%" />
								<col style="width:34%" />
								<col style="width:12%" />
								<col />
							</colgroup>
							<tbody>
								<tr class="part">
									<th scope="col" height="30"><span class="bg_none">문의파트</span><span class="txt_red">*</span></th>
									<td colspan="3">
										<!-- input (s) -->
										<div class="fl mr5" style="width:148px">
											<div class="select_natrue_bottom">
												<div class="design_select" style="z-index:99">
													<%--<div class="txt_val_view">
														<div id="INQUIRE_TYPE" class="txt_val">선택</div>
														<a href="#" class="btn"><span class="icon"></span></a>
													</div>
													<div class="select_list">
														<ul>
															<li><a href="#">제품</a></li>
															<li><a href="#">기술</a></li>
															<li><a href="#">납품</a></li>
															<li><a href="#">채용</a></li>
														</ul>
													</div>--%>
													<select id="typeCd" name="typeCd">
														<option value="">선택</option>
														<option value="310">제품</option>
														<option value="320">기술</option>
														<option value="330">납품</option>
														<option value="340">채용</option>
													</select>
												</div>
											</div>
										</div>
										<div class="fl mr5 relative" style="width:148px; z-index:98;"><!-- 제품 선택시 노출 -->
											<div class="select_natrue_bottom">
												<div class="design_select">
													<%--<div class="txt_val_view">
														<div id="selDomestic" class="txt_val">선택</div>
														<a href="#" class="btn"><span class="icon"></span></a>
													</div>
													<div class="select_list">
														<ul>
															<li><a href="">국내</a></li>
															<li><a href="">아시아</a></li>
															<li><a href="">미주/유럽</a></li>
														</ul>
													</div>--%>
													<select id="nationCd" name="nationCd">
														<option value="">선택</option>
														<option value="310">국내</option>
														<option value="320">아시아</option>
														<option value="330">미주/유럽</option>
													</select>
												</div>
											</div>
										</div>
										<div class="fl relative" style="width:148px; z-index:97;"><!-- 기술 선택시 노출 -->
											<div class="select_natrue_bottom">
												<div class="design_select">
													<%--<div class="txt_val_view">
														<div id="selOutside" class="txt_val">선택</div>
														<a href="#" class="btn"><span class="icon"></span></a>
													</div>
													<div class="select_list">
														<ul>
															<li><a href="">EPDM 문의</a></li>
															<li><a href="">TPV/KEPA 문의</a></li>
														</ul>
													</div>--%>
													<select id="productCd" name="productCd">
														<option value="">선택</option>
														<option value="310">EPDM 문의</option>
														<option value="320">TPV/KEPA 문의</option>
													</select>
												</div>
											</div>
										</div>
										<!-- input (e) -->
									</td>
								</tr>
								<tr>
									<td colspan="4" class="light_line"></td>
								</tr>
								<tr>
									<td height="20" class="p0"></td>
								</tr>
								<tr>
									<th scope="col"><span>고객명(회사명)</span><span class="txt_red">*</span></th>
									<td colspan="2">
										<input type="text" style="width:268px" name="CUSTOMER_NAME" maxlength="20"/>
									</td>
								</tr>
								<tr>
									<th scope="col"><span>연락처(핸드폰)</span></th>
									<td>
										<!-- input (s) -->
										<div class="fl mr10" style="width:88px;z-index:999;">
											<div class="select_natrue_bottom">
												<div class="design_select">
													<div class="txt_val_view">
														<div id="CELLPHONE1" class="txt_val">010</div>
														<a href="#" class="btn"><span class="icon"></span></a>
													</div>
													<div class="select_list">
														<ul>
															<li><a href="#">010</a></li>
															<li><a href="#">011</a></li>
															<li><a href="#">016</a></li>
															<li><a href="#">017</a></li>
															<li><a href="#">018</a></li>
															<li><a href="#">019</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<!-- input (e) -->
										-
										<input type="text" class="ml5 mr5" style="width:56px" name="CELLPHONE2" maxlength="4" /> - <input type="text" class="ml5" style="width:56px" name="CELLPHONE3" maxlength="4" />
									</td>
									<th scope="col" class="bg_none"><span>연락처(집/회사)</span><span class="txt_red">*</span></th>
									<td>
										<!-- input (s) -->
										<div class="fl mr10 relative" style="width:88px;z-index:5;">
											<div class="select_natrue_bottom">
												<div class="design_select">
													<div class="txt_val_view">
														<div id="TELEPHONE1" class="txt_val">02</div>
														<a href="#" class="btn"><span class="icon"></span></a>
													</div>
													<div class="select_list">
														<div style="width:87px; height:180px" class="scrollholder">
															<div class="scroll">
																<ul>
																	<li><a href="#">02</a></li>
																	<li><a href="#">031</a></li>
																	<li><a href="#">032</a></li>
																	<li><a href="#">033</a></li>
																	<li><a href="#">041</a></li>
																	<li><a href="#">042</a></li>
																	<li><a href="#">043</a></li>
																	<li><a href="#">051</a></li>
																	<li><a href="#">052</a></li>
																	<li><a href="#">053</a></li>
																	<li><a href="#">054</a></li>
																	<li><a href="#">055</a></li>
																	<li><a href="#">061</a></li>
																	<li><a href="#">062</a></li>
																	<li><a href="#">063</a></li>
																	<li><a href="#">064</a></li>
																	<li><a href="#">070</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- input (e) -->
										-
										<input type="text" class="ml5 mr5" style="width:56px" name="TELEPHONE2" maxlength="4" /> - <input type="text" class="ml5" style="width:56px" name="TELEPHONE3" maxlength="4" />
									</td>
								</tr>
								<tr>
									<th scope="col"><span>이메일주소</span><span class="txt_red">*</span></th>
									<td colspan="3">
										<input type="text" class="fl mr5" style="width:135px" name="EMAIL1" maxlength="50" /><span class="fl mr5 mt10">@</span><input type="text" class="fl mr10" style="width:135px" name="EMAIL2"  maxlength="40" />
										<!-- input (s) -->
										<div class="fl" style="width:148px">
											<div class="select_natrue_bottom">
												<div class="design_select">
													<div class="txt_val_view">
														<div id="EMAIL2" class="txt_val">직접입력</div>
														<a href="#" class="btn"><span class="icon"></span></a>
													</div>
													<div class="select_list">
														<ul>
															<li><a href="#">직접입력</a></li>
															<li><a href="#">gmail.com</a></li>
															<li><a href="#">naver.com</a></li>
															<li><a href="#">daum.net</a></li>
															<li><a href="#">nate.com</a></li>
															<li><a href="#">hotmail.com</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<!-- input (e) -->
									</td>
								</tr>
								<tr>
									<th scope="col" height="80"><span>현주소(집/직장)</span></th>
									<td colspan="3">
										<input class="mr5" type="text" style="width:135px" name="ZIPCODE_1"  maxlength="3" readonly="readonly" onclick="addrPopup();" /> - <input class="ml5 mr5" type="text" style="width:135px" name="ZIPCODE_2"  maxlength="3" readonly="readonly" onclick="addrPopup();" />

										<span><input type="button" class="btnG ml5" value="우편번호 찾기" onclick="addrPopup();" title="레이어 열림" /></span>
										<script type="text/javascript">

										//우편번호 찾기 - 레이어팝업
										function addrPopup(){
											var bodyHeight = document.body.scrollHeight;
											var layerPopupWidth = "500px";
											var layerPopupHeight = "550px";
											var addrUrl = "/kor/util/addrJibeon";
											var bgAddr = "<div id=\"bgAddr\" style=\"z-index:99;position:absolute;top:0px;left:0px;width:100%;height:" + bodyHeight + "px\"><img src='/resources/image/user/kor/common/none80gray.png' alt='' width='100%' height='" + bodyHeight + "px' /></div>";
											var layerPopupAddr = "<div id=\"layerPopupAddr\" style=\"z-index:100;position:absolute;top:0px;left:0px;width:100%;text-align:center;padding-top:700px;\"><iframe src=\"" + addrUrl + "\" width=\"" + layerPopupWidth + "\" height=\"" + layerPopupHeight + "\" frameborder=\"no\" scrolling=\"no\"></iframe></div>";
											$("body").append(bgAddr);
											$("body").append(layerPopupAddr);
										}

										function closeAddr(){
											$("#layerPopupAddr").remove();
											$("#bgAddr").remove();
										}

										function choiseAddr(postzip, addr){
											$("input[name='ZIPCODE_1']").val(postzip.substr(0,3));
											$("input[name='ZIPCODE_2']").val(postzip.substr(3,3));
											$("input[name='ADDR_1']").val(addr);
											closeAddr();
										}
										</script>

										<span class="fl mt10">
										<input type="text" style="width:306px" name="ADDR_1"  maxlength="100" readonly="readonly" onclick="addrPopup();" /><input type="text" class="ml10" style="width:303px" name="ADDR_2" maxlength="100" />
										</span>
									</td>
								</tr>
								<tr>
									<td height="20" class="p0"></td>
								</tr>
								<tr>
									<td colspan="4" class="light_line"></td>
								</tr>
								<tr>
									<td height="20" class="p0"></td>
								</tr>
								<tr>
									<th scope="col"><span>제목</span><span class="txt_red">*</span></th>
									<td colspan="3"><input type="text" style="width:632px" name="SUBJECT"  maxlength="250" /></td>
								</tr>
								<tr>
									<th scope="col" height="80"><span>내용</span><span class="txt_red">*</span></th>
									<td colspan="3">
										<textarea class="txtC1" rows="" cols="" style="width:622px; height:120px; resize:none" id="CONTENTS" name="CONTENTS"></textarea>
									</td>
								</tr>
								<tr>
									<th scope="col" height="80"><span>첨부파일</span></th>
									<td colspan="3" class="last relative">
										<input type="file" name="ATTACH_FILE" style="width:630px" />
										<div class="noTice1 f11 mt10">
											*Exe파일은 업로드가 불가능 합니다. / *최대 10MB까지 업로드가 가능합니다.
										</div>
									</td>
								</tr>
								<tr>
									<td height="10"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- table (e) -->
					<div class="ar mt20">
						<input type="button" class="btnG" value="취소" />
						<input type="submit" class="btnMint ml7" value="확인" />
					</div>

				</div>
				<!-- contentWrap (e) -->

			</div>
            <!-- content (e) -->