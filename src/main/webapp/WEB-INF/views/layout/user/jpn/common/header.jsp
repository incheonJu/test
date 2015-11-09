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
                    <h1 class="logo"><a href="/jpn" title="" ><img src="/resources/jpn/images/common/header/img_logo02.gif" alt="錦湖MITSUI化学" /></a></h1>
                    <div class="total_menu">
                        <a href="#"><img src="/resources/jpn/images/common/header/btn_totalMenu01.gif" alt="전체메뉴" /></a>
                    </div>
                </div>
            </div>
            <div class="topWrap">
                <div class="header">
                    <div class="hgroup">
                        <h1 class="logo"><a href="/jpn" title="錦湖MITSUI化学" ><img src="/resources/jpn/images/common/header/img_logo01.png" alt="錦湖MITSUI化学" /></a></h1>
                        <div class="hlgroup">
                            <a href="/jpn/inquiry/form" title="お問い合わせ" >お問い合わせ</a>
                            <form name="frmSearch" method="get" action="/jpn/util/searchForm">
                                <div class="header_search">
                                    <input type="text" id="integraedSearchKeyword" name="keyword" class="search_bar" title="검색어를 입력해주세요." />
                                    <div class="search_btn_area">
                                    	<input id="btnIntegratedSearch1" type="button" class="search_btn01" title="검색" />
                                    	<input id="btnIntegratedSearch2" type="button" class="search_btn02" title="검색" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <script>
                        	$(document).ready(function(){
								$("#btnIntegratedSearch1").on("click", function(){
									if($("#integraedSearchKeyword").val() != ""){
										location.href = "/jpn/util/searchForm?keyword="+$("#integraedSearchKeyword").val();	
									} else {
										alert('検索用語を入力してください。');
									}
                        		});
                        		$("#btnIntegratedSearch2").on("click", function(){
                        			if($("#integraedSearchKeyword").val() != ""){
                        				location.href = "/jpn/util/searchForm?keyword="+$("#integraedSearchKeyword").val();	
                        			} else {
                        				alert('検索用語を入力してください。');
                        			}
                        		});
                        	});
                        </script>
                        <div class="hrgroup">
                            <a href="/kor">KOR</a>
							<a href="/eng">ENG</a>
                            <a href="/chn">CHN</a>
							<a href="/jpn" class="on">JPN</a>
                        </div>
                    </div>
                    <div class="gnb">
                        <ul class="depth01">
							<li class="gnb_lists gnb_list01"><a href="/jpn/intro/overview">会社案内</a>
								<ul class="depth02">
									<li><a href="/jpn/intro/overview">会社概要</a></li>
									<li><a href="/jpn/intro/greeting">CEOメッセージ</a></li>
									<li><a href="/jpn/intro/vision">ビジョン</a></li>
									<li><a href="/jpn/intro/ci">CI</a></li>
									<li><a href="/jpn/intro/history">沿革</a></li>
									<li><a href="/jpn/intro/partners">グループ会社</a></li>
									<li><a href="/jpn/intro/workplace">事業所</a></li>
								</ul>
							</li>
							<li class="gnb_lists gnb_list02"><a href="/jpn/product/ORI400">製品案内</a>
								<ul class="depth02">
									<li class="depth02_lists depth02_list0201"><a href="/jpn/product/ORI400">ポリメリックMDI</a></li>
									<li class="depth02_lists depth02_list0202"><a href="/jpn/product/ORI200">モノメリックMDI</a></li>
									<li class="depth02_lists depth02_list0203"><a href="/jpn/product/ORI300">変性MDI</a></li>
									<li class="depth02_lists depth02_list0204"><a href="/jpn/product/ORI100">特殊MDI</a> </li>
									<li class="depth02_lists depth02_list0205"><a href="/jpn/product/ORI500">塩化フタロイルシリーズ</a>
										<ul class="depth03 depth03list0205">
											<li><a href="/jpn/product/ORI500">塩化フタロイルシリーズ</a></li>
											<li><a href="/jpn/product/pc/4">IPC</a></li>
											<li><a href="/jpn/product/pc/7">TPC</a></li>
										</ul>
									</li>
									<li class="depth02_lists depth02_list0206"><a href="/jpn/progress/form">工程案内</a></li>
									<!-- <li class="depth02_lists depth02_list0207"><a href="/jpn/product/library/dictionary">資料室</a>
										 <ul class="depth03 depth03list0207">
											<li><a href="/jpn/product/library/dictionary">ポリウレタン用語辞典</a></li>
											<li><a href="/jpn/product/library/handbookList">T/Sハンドブック</a></li>
										</ul>
									</li> -->
									<li class="depth02_lists depth02_list0208"><a href="/jpn/handle/form">取扱上の注意</a></li>
								</ul>
								<div class="depth02_list0209">
									<a id="product_close" class="icon" href="#"></a>
								</div>
							</li>
							<li class="gnb_lists gnb_list03"><a href="/jpn/recruit/talented">採用情報</a>
								<ul class="depth02">
									<li><a href="/jpn/recruit/talented">人材像</a></li>
									<li><a href="/jpn/recruit/personnel">人事制度</a></li>
								</ul>
							</li>
							<li class="gnb_lists gnb_list04"><a href="/jpn/news/list">サポート</a>
								<ul class="depth02">
									<li><a href="/jpn/news/list">ニュース</a></li>
									<li><a href="/jpn/inquiry/form">お問い合わせ</a></li>
									<li><a href="/jpn/store/list">製品購入先</a></li>
								</ul>
							</li>
							<li class="gnb_lists gnb_list05"><a href="/jpn/management/ethic">倫理経営</a>
								<ul class="depth02">
									<li><a href="/jpn/management/ethic">倫理経営</a></li>
									<li><a href="/jpn/management/quality">品質</a></li>
									<li><a href="/jpn/management/env">環境/安全</a></li>
									<li><a href="/jpn/management/social">社会貢献</a></li>
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
				<script src="/resources/jpn/js/canvas.js"></script>
				<script src="/resources/jpn/js/Three.js"></script>
			</div -->
