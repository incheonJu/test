<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
</head>

<body>
	<!-- skipNavi (s) -->
	<ul id="skipNavi">
		<li><a href="#news">본문 바로가기</a></li>
		<li><a href="#headerWr">주메뉴 바로가기</a></li>
		<li><a href="#footer">하단메뉴 바로가기</a></li>
	</ul>
	<!-- skipNavi (e) -->

	<!-- wrap (s) -->
	<div id="wrap">
		<!-- header (s) -->
		<div id="headerWr">
            <div class="mini_wrap">
                <div class="mini_header">
                    <h1 class="logo"><a href="/chn" title="錦湖MITSUI化學" ><img src="/resources/chn/images/common/header/img_logo02.gif" alt="錦湖MITSUI化學" /></a></h1>
                    <div class="total_menu">
                        <a href="#"><img src="/resources/chn/images/common/header/btn_totalMenu01.gif" alt="전체메뉴" /></a>
                    </div>
                </div>
            </div>
            <div class="topWrap">
                <div class="header">
                    <div class="hgroup">
                        <h1 class="logo"><a href="/chn" title="錦湖MITSUI化學" ><img src="/resources/chn/images/common/header/img_logo01.png" alt="錦湖MITSUI化學" /></a></h1>
                        <div class="hlgroup">
                            <a href="/chn/inquiry/form" title="询问" >询问</a>
                            <form name="frmSearch" method="get" action="/chn/util/searchForm">
                                <div class="header_search">
                                    <input type="text" id="integraedSearchKeyword" name="keyword" class="search_bar" title="请输入关键词" />
                                    <div class="search_btn_area">
                                    	<input id="btnIntegratedSearch1" type="button" class="search_btn01" title="检索" />
                                    	<input id="btnIntegratedSearch2" type="button" class="search_btn02" title="检索" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <script>
                        	$(document).ready(function(){
								$("#btnIntegratedSearch1").on("click", function(){
									if($("#integraedSearchKeyword").val() != ""){
										location.href = "/chn/util/searchForm?keyword="+$("#integraedSearchKeyword").val();	
									} else {
										alert('输入您的搜索条件。');
									}
                        		});
                        		$("#btnIntegratedSearch2").on("click", function(){
                        			if($("#integraedSearchKeyword").val() != ""){
                        				location.href = "/chn/util/searchForm?keyword="+$("#integraedSearchKeyword").val();
                        			} else {
                        				alert('输入您的搜索条件。');
                        			}
                        		});
                        	});
                        </script>
                        <div class="hrgroup">
                            <a href="/kor">KOR</a>
							<a href="/eng">ENG</a>
                            <a href="/chn" class="on">CHN</a>
							<a href="/jpn">JPN</a>
                        </div>
                    </div>
                    <div class="gnb">
                        <ul class="depth01">
							<li class="gnb_lists gnb_list01"><a href="/chn/intro/overview">公司简介</a>
								<ul class="depth02">
									<li><a href="/chn/intro/overview">公司概要</a></li>
									<li><a href="/chn/intro/greeting">CEO 问候语</a></li>
									<li><a href="/chn/intro/vision">展望</a></li>
									<li><a href="/chn/intro/ci">CI</a></li>
									<li><a href="/chn/intro/history">沿革</a></li>
									<li><a href="/chn/intro/partners">公司历史</a></li>
									<li><a href="/chn/intro/workplace">营业场所简介</a></li>
								</ul>
							</li>
							<li class="gnb_lists gnb_list02"><a href="/chn/product/ORI400">产品简介</a>
								<ul class="depth02">
									<li class="depth02_lists depth02_list0201"><a href="/chn/product/ORI400">聚合MDI</a></li>
									<li class="depth02_lists depth02_list0202"><a href="/chn/product/ORI200">纯MDI</a></li>
									<li class="depth02_lists depth02_list0203"><a href="/chn/product/ORI300">改性MDI</a></li>
									<li class="depth02_lists depth02_list0204"><a href="/chn/product/ORI100">特殊MDI</a> </li>
									<li class="depth02_lists depth02_list0205"><a href="/chn/product/ORI500">PHTHALOYL CHLORIDE</a>
										<ul class="depth03 depth03list0205">
											<li><a href="/chn/product/ORI500">PHTHALOYL CHLORIDE</a></li>
											<li><a href="/chn/product/pc/4">IPC</a></li>
											<li><a href="/chn/product/pc/7">TPC</a></li>
										</ul>
									</li>
									<li class="depth02_lists depth02_list0206"><a href="/chn/progress/form">工艺简介</a></li>
									<!-- <li class="depth02_lists depth02_list0207"><a href="/chn/product/library/dictionary">제품자료실</a>
										 <ul class="depth03 depth03list0207">
											<li><a href="/chn/product/library/dictionary">PU용어사전</a></li>
											<li><a href="/chn/product/library/handbookList">T/S HAND BOOK</a></li>
										</ul>
									</li> -->
									<li class="depth02_lists depth02_list0208"><a href="/chn/handle/form">存放注意事项</a></li>
								</ul>
								<div class="depth02_list0209">
									<a id="product_close" class="icon" href="#"></a>
								</div>
							</li>
							<li class="gnb_lists gnb_list03"><a href="/chn/recruit/talented">人才招聘</a>
								<ul class="depth02">
									<li><a href="/chn/recruit/talented">人才奖</a></li>
									<li><a href="/chn/recruit/personnel">人事制度</a></li>
								</ul>
							</li>
							<li class="gnb_lists gnb_list04"><a href="/chn/news/list">客户中心</a>
								<ul class="depth02">
									<li><a href="/chn/news/list">新闻</a></li>
									<li><a href="/chn/inquiry/form">询问</a></li>
									<li><a href="/chn/store/list">产品购买</a></li>
								</ul>
							</li>
							<li class="gnb_lists gnb_list05"><a href="/chn/management/ethic">伦理经营</a>
								<ul class="depth02">
									<li><a href="/chn/management/ethic">伦理经营</a></li>
									<li><a href="/chn/management/quality">品质经营</a></li>
									<li><a href="/chn/management/env">环境/安全经营</a></li>
									<li><a href="/chn/management/social">社会贡献</a></li>
								</ul>
							</li>
                        </ul>
                        <div class="gnb_location">
                        	<span class="now">현재위치</span>
                        	<span class="dep01" id="dep01"><a href="#"></a></span>
                        	<span class="dep02" id="dep02"><a href="#"></a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- header (e) -->
		<div id="container">
			<!-- div id="clWrap">
				<canvas id="canvasLine" height="504"></canvas>
				<script src="/resources/chn/js/canvas.js"></script>
				<script src="/resources/chn/js/Three.js"></script>
			</div -->
