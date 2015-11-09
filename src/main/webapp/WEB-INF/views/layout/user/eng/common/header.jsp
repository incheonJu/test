<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
</head>

<body>
	<!-- skipNavi (s) -->
	<ul id="skipNavi">
		<li><a href="#news">Skip to news</a></li>
		<li><a href="#headerWr">Skip to menu</a></li>
		<li><a href="#footer">Skip to footer</a></li>
	</ul>
	<!-- skipNavi (e) -->

	<!-- wrap (s) -->
	<div id="wrap">
		<!-- header (s) -->
		<div id="headerWr">
            <div class="mini_wrap">
                <div class="mini_header">
                    <h1 class="logo"><a href="/eng" title="" ><img src="/resources/eng/images/common/header/img_logo02.gif" alt="KUMHO MITSUI CHEMICALS" /></a></h1>
                    <div class="total_menu">
                        <a href="#"><img src="/resources/eng/images/common/header/btn_totalMenu01.gif" alt="total menu" /></a>
                    </div>
                </div>
            </div>
            <div class="topWrap">
                <div class="header">
                    <div class="hgroup">
                        <h1 class="logo"><a href="/eng" title="KUMHO MITSUI CHEMICALS" ><img src="/resources/eng/images/common/header/img_logo01.gif" alt="KUMHO MITSUI CHEMICALS" /></a></h1>
                        <div class="hlgroup">
                            <a href="/eng/inquiry/form" title="INQUIRY" >INQUIRY</a>
                            <form name="frmSearch" method="get" action="/eng/util/searchForm">
                                <div class="header_search">
                                    <input type="text" id="integraedSearchKeyword" name="keyword" class="search_bar" title="Enter search term." />
                                    <div class="search_btn_area">
                                    	<input id="btnIntegratedSearch1" type="button" class="search_btn01" title="search" />
                                    	<input id="btnIntegratedSearch2" type="button" class="search_btn02" title="search" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <script>
                        	$(document).ready(function(){
								$("#btnIntegratedSearch1").on("click", function(){
									if($("#integraedSearchKeyword").val() != ""){
										location.href = "/eng/util/searchForm?keyword="+$("#integraedSearchKeyword").val();	
									} else {
										alert('Enter your search terms.');
									}
                        		});
                        		$("#btnIntegratedSearch2").on("click", function(){
                        			if($("#integraedSearchKeyword").val() != ""){
                        				location.href = "/eng/util/searchForm?keyword="+$("#integraedSearchKeyword").val();	
                        			} else {
                        				alert('Enter your search terms.');
                        			}
                        			
                        		});
                        	});
                        </script>
                        <div class="hrgroup">
                            <a href="/kor">KOR</a>
							<a href="/eng" class="on">ENG</a>
                            <a href="/chn">CHN</a>
							<a href="/jpn">JPN</a>
                        </div>
                    </div>
                    <div class="gnb">
                        <ul class="depth01">
							<li class="gnb_lists gnb_list01"><a href="/eng/intro/overview">ABOUT US</a>
								<ul class="depth02">
									<li><a href="/eng/intro/overview">OVERVIEW</a></li>
									<li><a href="/eng/intro/greeting">GREETINGS</a></li>
									<li><a href="/eng/intro/vision">VISION</a></li>
									<li><a href="/eng/intro/ci">CI</a></li>
									<li><a href="/eng/intro/history">HISTORY</a></li>
									<li><a href="/eng/intro/partners">GROUP</a></li>
									<li><a href="/eng/intro/workplace">SITES</a></li>
								</ul>
							</li>
							<li class="gnb_lists gnb_list02"><a href="/eng/product/ORI400">PRODUCTS</a>
								<ul class="depth02">
									<li class="depth02_lists depth02_list0201"><a href="/eng/product/ORI400">POLYMERIC MDI</a></li>
									<li class="depth02_lists depth02_list0202"><a href="/eng/product/ORI200">MONOMERIC MDI</a></li>
									<li class="depth02_lists depth02_list0203"><a href="/eng/product/ORI300">MODIFIED MDI</a></li>
									<li class="depth02_lists depth02_list0204"><a href="/eng/product/ORI100">SPECIAL MDI</a> </li>
									<li class="depth02_lists depth02_list0205"><a href="/eng/product/ORI500">PHTHALOYL CHLORIDE</a>
										<ul class="depth03 depth03list0205">
											<li><a href="/eng/product/ORI500">PHTHALOYL CHLORIDE</a></li>
											<li><a href="/eng/product/pc/4">IPC</a></li>
											<li><a href="/eng/product/pc/7">TPC</a></li>
										</ul>
									</li>
									<li class="depth02_lists depth02_list0206"><a href="/eng/progress/form">PROCESSES</a></li>
									<!-- <li class="depth02_lists depth02_list0207"><a href="/eng/product/library/dictionary">INFORMATION</a>
										 <ul class="depth03 depth03list0207">
											<li><a href="/eng/product/library/dictionary">PU TERMINOLOGY DICTIONARY</a></li>
											<li><a href="/eng/product/library/handbookList">T/S HAND BOOK</a></li>
										</ul>
									</li> -->
									<li class="depth02_lists depth02_list0208"><a href="/eng/handle/form">PRECAUTIONS IN HANDLING</a></li>
								</ul>
								<div class="depth02_list0209">
									<a id="product_close" class="icon" href="#"></a>
								</div>
							</li>
							<li class="gnb_lists gnb_list03"><a href="/eng/recruit/talented">RECRUITMENT</a>
								<ul class="depth02">
									<li><a href="/eng/recruit/talented">DESIRED TALENT</a></li>
									<li><a href="/eng/recruit/personnel">HR SCHEME</a></li>
								</ul>
							</li>
							<li class="gnb_lists gnb_list04"><a href="/eng/news/list">CUSTOMER CENTER</a>
								<ul class="depth02">
									<li><a href="/eng/news/list">NEWS</a></li>
									<li><a href="/eng/inquiry/form">INQUIRY</a></li>
									<li><a href="/eng/store/list">FOR PURCHASING</a></li>
								</ul>
							</li>
							<li class="gnb_lists gnb_list05"><a href="/eng/management/ethic">ETHICAL MANAGEMENT</a>
								<ul class="depth02">
									<li><a href="/eng/management/ethic">ETHICAL MANAGEMENT</a></li>
									<li><a href="/eng/management/quality">QUALITY MANAGEMENT</a></li>
									<li><a href="/eng/management/env">ENVIRONMENT/SAFETY MANAGEMENT</a></li>
									<li><a href="/eng/management/social">SOCIAL CONTRIBUTION</a></li>
								</ul>
							</li>
                        </ul>
                        <div class="gnb_location">
                        	<span class="now">Located</span>
                        	<span class="dep01" id="dep01"><a href="#"></a></span>
                        	<span class="dep02" id="dep02"><a href="#"></a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- header (e) -->
		<div id="container">
			<!--div id="clWrap">
				<canvas id="canvasLine" height="504"></canvas>
			</div>
			<script src="/resources/eng/js/Three.js"></script>
			<script src="/resources/eng/js/canvas.js"></script-->
