var mobilecheck = function () {
	var check = false;
	(function(a,b){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
	return check;
}

var _product = false;
var printInter;

$(document).ready(function (){
	// Top Button
    $("#cmTopScroll a.top").click(function (){
		$("html, body").scrollTop(0);
    });
    $(window).scroll(function (){
        var top = $(window).scrollTop();

        if(top > 105){
			 if(top + $(window).height() > $(document).height() - 56) {
				$("#cmTopScroll").stop().css({"position":"absolute","bottom":85});
			}
			else if(top + $(window).height() < $(document).height() - 56){
				$("#cmTopScroll").stop().css({"position":"fixed"}).stop().animate({"bottom":25}, 250);
			}
        }
		else{
            $("#cmTopScroll").stop().animate({"bottom":-85}, 250);
        }
    });

	addEvent();
    resize();

});


var __loaded = false;
var _printChild;
var printpopup;
var parentBody;

var _open = false;
function addEvent(){
	//document.onmousewheel = function(){ stopWheel(); } /* IE7, IE8 */
	if(document.addEventListener){ /* Chrome, Safari, Firefox */
		//document.addEventListener('DOMMouseScroll', stopWheel, false);
	}
}

function stopWheel(e){

	if(!e){ e = window.event; } /* IE7, IE8, Chrome, Safari */
	if(e.preventDefault) {
		if(_open)e.preventDefault();
	} /* Chrome, Safari, Firefox */
	if(_open) e.returnValue = false; /* IE7, IE8 */
}

function addWheelEvent(){
	$('#layerPopup').mouseover(function (){
		_open = true;
	}).mouseout(function (){
		_open = false;
	});
}



function resize(){
    var bg = $("#visual_bg>div").width();;
    var sw = $(window).width();

    $("#visual_bg").css({"margin-left":-bg/2 -10});


    if($("#visual_bg").find("div").hasClass("company_bg08")){
        $("#visual_bg").css({"margin-left":-bg/2 -100});
    }
    if($("#visual_bg").find("div").hasClass("company_bg11")){
        $("#visual_bg").css({"margin-left":-bg/2 -50});
    }
    if($("#visual_bg").find("div").hasClass("company_bg13")){
        $("#visual_bg").css({"margin-left":-bg/2 + 10});
    }
}


//-------------------------- btnImage 활성화 --------------------------//
function onOverImg(obj){
	try{
		 obj.getElementsByTagName('img')[0].src = obj.getElementsByTagName('img')[0].src.replace('.gif', '_on.gif')
	}catch(e){}

}
function onOutImg(obj) {
	try{
		obj.getElementsByTagName('img')[0].src = obj.getElementsByTagName('img')[0].src.replace ('_on.gif', '.gif')
	}catch(e){}
}

//-------------------------- openSitemap --------------------------//
$(document).ready(function(){
    var $openSitemap = $(".open_sitemap");
    var $openFamily = $(".open_family .family_list");
    var flag = true;
    var open1 = false;
    var open2 = false;
    $("#sitemap1").click(function(){
        if (!flag) return false;
        flag = false;
        if ($openSitemap.is(":hidden")) {
            $openSitemap.slideDown(function(){flag = true;});
            open1 = true;
            // icon({selecter: $(this).find(".icon"), turn : "on", size : 16, cut : 13});
        } else {
            $openSitemap.slideUp(function(){flag = true;});
            open1 = false;
            // icon({selecter: $(this).find(".icon"), turn : "off", size : 16, cut : 13});
        }

        if ($openFamily.is(":visible")) {
            $("#family").find(".icon").removeAttr("style");
            $openFamily.hide();
            open2 = false;
        }
    }).mouseenter(function (){
    	if (!open1) {
			icon({selecter: $(this).find(".icon"), turn : "on", size : 16, cut : 13});
		}
	}).mouseleave(function (){
		if (!open1) {
			icon({selecter: $(this).find(".icon"), turn : "off", size : 16, cut : 13});
		}
	});


    $("#family").click(function(){
        if (!flag) return false;
        flag = false;
        if ($openFamily.is(":hidden")) {
            $openFamily.slideDown(function(){flag = true;});
            open2 = true;
            // icon({selecter: $(this).find(".icon"), turn : "on", size : 16, cut : 13});
        } else {
            $openFamily.slideUp(function(){flag = true;});
            open2 = false;
            // icon({selecter: $(this).find(".icon"), turn : "off", size : 16, cut : 13});
        }

        if ($openSitemap.is(":visible")) {
            $("#sitemap1").find(".icon").removeAttr("style");
            $openSitemap.hide();
            open1 = false;
        }
    }).mouseenter(function (){
    	if (!open2) {
			icon({selecter: $(this).find(".icon"), turn : "on", size : 16, cut : 13});
		}
	}).mouseleave(function (){
		if (!open2) {
			icon({selecter: $(this).find(".icon"), turn : "off", size : 16, cut : 13});
		}
	});

    $(".open_sitemap .open_sitemapWrap .view .icon").on({
        "mouseenter": function(){
            icon({selecter: $(this), turn : "on", size : 42, cut : 13});
        },
        "mouseleave": function(){
            icon({selecter: $(this), turn : "off", size : 42, cut : 13});
        }
    });

    $(".movie_viewDim .icon").on({
        "mouseenter": function(){
            icon({selecter: $(this), turn : "on", size : 67, cut : 3});
        },
        "mouseleave": function(){
            icon({selecter: $(this), turn : "off", size : 67, cut : 3});
        }
    });


    var $btn = $(".open_sitemap .btn");
    var $overList = $(".over_list");
    var $btnList = $btn.closest("li");
    var idx = 0

    $btn.css("z-index", 11);
    $overList.hide();

    $btnList.on("mouseenter", function(){
        $overList.each(function(i){
            if ($(this).is(":visible")) {
                $(this).hide();
                $btn.eq(i).removeClass("on").css("z-index", 11);
				$btn.parent().removeClass("on");
            }
        });
        idx = $btnList.index(this);
        $btn.eq(idx).addClass("on");
        $overList.eq(idx).show();
		$btn.eq(idx).parent().addClass("on");
    });
    $btnList.on("mouseleave", function(){
    	idx = $btnList.index(this);
    	$btn.eq(idx).removeClass("on").css("z-index", 11);
        $overList.eq(idx).hide();
		$btn.eq(idx).parent().removeClass("on");
    })
});

//-------------------------- path --------------------------//
/**
 * @param  {obejct} o gnb함수에서 depth01, depth02, depth03를 받아옴
 * @note : sub매뉴에 경로를 나타내는 리스트 gnb가 존재할때만 기능 작동
 */
function path(o)
{
    // gnb에 없는 단일 path
    var hiddenDepth = null;
    hiddenDepth = [
        {
            name : "사이트맵",
            src : "/kor/util/sitemap/"
        },
        {
            name : "법적고지",
            src : "/kor/util/monition.jsp"
        },
        {
            name : "검색",
            src : "/kor/util/searchGeneralList/"
        }
    ];

   if (o.singleDepth != null) {
		$('#location #dep01 a').text(hiddenDepth[o.singleDepth].name).attr("href", hiddenDepth[o.singleDepth].src);
		$('#location #dep02').remove();

		$('.gnb').css('height',37);
		$('#container').css('padding-top',104);
	}
}

//-------------------------- visual --------------------------//
/**
 * @note : main페이지 visual img rolling script
 */
function visual()
{
    var $mainVisual = $("#main_visual");
    var $visualWrap = null;
    var $location = null;
    var $locationA = null;
    var $visualList = null;
    var $visualImg = null;
    var $visualBgList = null;
    var leg = null;
    var idx = 0;
    var prevIdx = idx;
    var timer = null;
    var speed = 7000;
    var size1024 = null;
    var ie8under = ie8underBrowser();

    function init() {
        if (!$mainVisual.length) {
            return false;
        }
        if (parseInt($(window).width()) <= 1024) {
            size1024 = true;
        } else {
            size1024 = false;
        }

		size1024 = false;

        visualSize();

        $visualList = $visualWrap.find(".visual");
        $visualList.hide().eq(idx).show();
        $location = $visualWrap.find(".visual_location");
        $locationA = $location.find("a");
        $visualImg = $visualList.find(".img_visual");
        $visualBgList = $mainVisual.find(".mainbg_wrap .mainbg");
        leg = $visualList.length;
        // console.log($visualBgList.length);
        $locationA.on("click.location", visualNext);
        $location.on({
            "mouseenter.location": clearTimer,
            "mouseleave.location": autoTimer
        })
        // $mainVisual.addClass("bg"+parseInt(idx+1));
        $visualBgList.eq(idx).show().siblings().hide();
        icon({selecter: $locationA.eq(idx), turn : "on", size : 20, cut : 5});
		$visualImg.eq(0).find(".pic").stop().animate({"left" : "0"}, speed+700);
        autoTimer();
        $(window).resize(visualSize);
    }
    function reloadvisual()
    {
        //재호출전 저장시켜놓은 애들 지우기
        $locationA.off("click.location");
        $location.off("mouseenter.location");
        $location.off("mouseleave.location");
        $location.find(".icon").removeAttr("style");
        $location.find("span").removeAttr("style");
        idx = 0;
        prevIdx = idx;
        clearTimer();
        // $mainVisual.addClass("bg1");
        $visualBgList.eq(0).show().siblings().hide();

        // 재호출
        $visualList = $visualWrap.find(".visual");
        $visualList.hide().eq(idx).show().find("span").show().removeAttr("style");
        $visualList.eq(idx).find(".img_visual").removeAttr("style");

        $location = $visualWrap.find(".visual_location");
        $locationA = $location.find("a");
        $visualImg = $visualList.find(".img_visual");
        leg = $visualList.length;

        $locationA.on("click.location", visualNext);
        $location.on({
            "mouseenter.location": clearTimer,
            "mouseleave.location": autoTimer
        })
        icon({selecter: $locationA.eq(idx), turn : "on", size : 20, cut : 5});
        autoTimer();
        // init();
    }
    function visualSize()
    {
        var _winSize = parseInt($(window).width());
		_winSize = 2000;
        if (_winSize <= 1024 && size1024 === true) {
            $mainVisual.removeClass();
            $mainVisual.addClass("size1024");
            $mainVisual.find(".size1024under").show();
            $mainVisual.find(".size1024upper").hide();
            $visualWrap = $mainVisual.find(".size1024under");
            size1024 = false;
            if ($visualList !== null) {
                reloadvisual();
            }
        } else if(_winSize > 1024 && size1024 === false) {
            $mainVisual.removeClass();
            $mainVisual.removeClass("size1024");
            $mainVisual.find(".size1024under").hide();
            $mainVisual.find(".size1024upper").show();
            $visualWrap = $mainVisual.find(".size1024upper");
            size1024 = true;
            if ($visualList !== null) {
                reloadvisual();
            }
        }
    }
    function visualNext() {
        var _idx = $locationA.index(this);
        if (_idx === -1) {
            _idx = idx + 1;
            if (_idx >= leg) _idx = 0;
        }

        if (_idx === prevIdx) return false;
        else idx = _idx;

        icon({selecter: $locationA.eq(prevIdx), turn : "off", size : 20, cut : 5});
        //$visualBgList.eq(prevIdx).fadeOut();
        // $mainVisual.removeClass("bg"+parseInt(prevIdx+1));
        if (ie8under === true) {
            $visualList.eq(prevIdx).hide();
			$visualBgList.eq(prevIdx).hide();
        } else {
			$visualBgList.eq(prevIdx).fadeOut();
            var _$visualListPrev = $visualList.eq(prevIdx).find("span");
            var _visualListPrevLeg = _$visualListPrev.length - 1;
            $visualImg.eq(prevIdx).stop(true,true).fadeOut(	700);
			$visualList.eq(prevIdx-1).find(".pic").hide().stop( true, true ).css("left","120px"); // 배경 사진 제자리로
            _$visualListPrev.each(function(i){
                $(this).stop().animate({"margin-left" : -100, "opacity" : 0}, 150 + ((i + 5) * 30), function(){
                    $(this).hide();
					$(this).parent().parent().find(".pic").hide().stop( true, true ).css("left","120px"); // 배경 사진 제자리로
                });
            });
        }

        icon({selecter: $locationA.eq(idx), turn : "on", size : 20, cut : 5});
        //$visualBgList.eq(idx).fadeIn();
        // $mainVisual.addClass("bg"+parseInt(idx+1));
        if (ie8under === true) {
            $visualList.eq(idx).show();
			$visualBgList.eq(idx).show();
            prevIdx = idx;
        } else {
			$visualBgList.eq(idx).fadeIn();
            var _$visualList = $visualList.eq(idx).find("span");
            var _visualListLeg = _$visualList.length - 1;
            $visualImg.eq(idx).stop(true,true).fadeIn(700);
            $visualList.eq(idx).show();
			$visualList.eq(idx).find(".pic").show().stop().animate({"left" : "0"}, speed+700);
            _$visualList.show();
            _$visualList.css({"opacity": 0.3, "margin-left" : 400}).each(function(i){
                $(this).stop().animate({"margin-left" : 0, "opacity" : 1}, 50 + ((i + 5) * 75));
            });
            prevIdx = idx;
        }
        return false;
    }
    function autoTimer() {
        timer = setInterval(visualNext, 5000);
    }
    function clearTimer() {
        clearInterval(timer);
        timer = null;
    }
    init();
}
function headerSearch()
{
    var $searchBar = $("#headerWr .search_bar");
    var $searchHeader = $("#headerWr .header_search")
    var $search_btn01 = $("#headerWr .search_btn01");
    var $search_btn02 = $("#headerWr .search_btn02");
    var $search_btn = $("#headerWr .search_btn_area")

    if (!$searchBar.length) {
        return false;
    }
    $searchHeader.attr("toggle", "true");

    $searchBar.on({
        "click": action,
        "focusout": clear
    });
    // $searchHeader.on({"mouseleave": clear})
    $search_btn.on({
        "mouseenter": function(){
            if ($searchHeader.attr("toggle") === "false") {
                $search_btn01.show();
                $search_btn02.hide();
            }
        },
        "mouseleave": function(){
            if ($searchHeader.attr("toggle") === "false") {
                $search_btn01.hide();
                $search_btn02.show();
            }
        }
    })
    function action () {
        $searchHeader.attr("toggle", "false");
        $searchBar
                .stop().animate({"width" : 277}, 150)
                // .parent().stop().animate({backgroundColor: '#000'}, 150);
            $search_btn01.fadeOut(150);
            $search_btn02.fadeIn(150);
    }
    function clear () {
        $searchHeader.attr("toggle", "true");
        $searchBar
            .stop().animate({"width" : 126}, 500)
            // .parent().stop().animate({backgroundColor: '#e8e8e8'}, 150);
        $search_btn01.fadeIn(150);
        $search_btn02.fadeOut(150);
    }
}
/**
 * 제품소개면 true
 * 제품소개가 아니라면 false
 */
var gnbProduct = false;

//-------------------------- gnb --------------------------//
function gnb(opt)
{
    var $headerWr = $("#headerWr");
    var $header = $("#headerWr .header")
    var $gnb = $header.find(".gnb");
    var $gnbList = $gnb.find(".gnb_lists");
    var $gnbListA = $gnbList.find("> a");
    var $depth02 = $gnbList.find(".depth02");
    var $depth02List = null;
    var $depth02ListA = $depth02.find("> li > a");
    var $depth03 = $depth02.find(".depth03");
    var $gnbAnibar = null;
	var $footLocation = $("#location");
    var gnbIdx = 0;
	var _depth01H = 37;
	var _depth02H = 270; // 2depth까지 height

    function init()
    {
        if (!$header.length) {
            return false;
        }
        // 이벤트 등록
        $header.on("mouseleave", headerMouseOff);

		$gnbListA.on({
			"mouseenter focusin": gnbListMouseOn
		});
		$depth02ListA.on({
			"mouseenter focusin": depth02ListMouseOn
		});

        // depth01, dpeth02 바 추가
        animationBarAppend({wrap: $header, name : "gnb_anibar"});
        animationBarAppend({wrap: $gnb,name : "depth02_anibar"});
        $gnbAnibar = $header.find('.gnb_anibar');
        $depth02Anibar = $header.find('.depth02_anibar');
        // 서브 일때 실행되는 것들
        if (subCheck()) {
            subPage();
            var pathOptSet = {};
            if (opt.depth01 != null) pathOptSet["depth01"] = opt.depth01;
            if (opt.depth02 != null) pathOptSet["depth02"] = opt.depth02;
            if (opt.depth03 != null) pathOptSet["depth03"] = opt.depth03;
            path(pathOptSet);
        }
        // 단일 path일때 실행
        if (opt !== undefined) {
            if (opt.singleDepth !== undefined) {
                var pathOptSet = {};
                pathOptSet["singleDepth"] = opt.singleDepth;
                path(pathOptSet);
            }
        }
    }
    // 서브 체크 -> gnb에 해당하지 않는 singledpeth추가 return false
    function subCheck()
    {
        // true : sub, false : main , singleDepth
        if (opt !== undefined && opt.singleDepth === undefined) {
            return true;
        } else {
            return false;
        }
    }
    // 서브일때만 실행
    function subPage() {
        var _$subGnbListA = $gnbListA.eq(opt.depth01);
        var _gnbWit = _$subGnbListA.width();
        var _gnbPosL = _$subGnbListA.position().left;
        textOver($gnbList, $gnbList.eq(opt.depth01), "hover");
        _animationBar({selecter: $gnbAnibar, wit: _gnbWit, posL: _gnbPosL});
        _depth02ListClear();
        gnbIdx = opt.depth01;

        _$depth02 = $gnbList.eq(opt.depth01).find("> .depth02")
        _$depth02.show();
        $depth02List = _$depth02.find(" > li");
        $depth02ListA = $depth02List.find(" > a");
        var _$subDepth02ListA = $depth02ListA.eq(opt.depth02);
        var _lnbWit = _$subDepth02ListA.find('span').width();
        var _lnbPosL = null;
        var _lnbPosT = null;
        textOver($depth02List, _$subDepth02ListA.parent(), "hover");
        if (_$subDepth02ListA.position() !== null) {
            _lnbPosL = _$subDepth02ListA.position().left + _$subDepth02ListA.width() / 2 - _$subDepth02ListA.find('span').width() / 2;
        }
		_animationBar({selecter: $depth02Anibar, wit: _lnbWit, posL: _lnbPosL, posT: _lnbPosT});

		//로케이션
		$footLocation.find("#dep01 a").text(_$subGnbListA.text()).attr("href", _$subGnbListA.attr("href"));
		$footLocation.find("#dep02 a").text(_$subDepth02ListA.text()).attr("href", _$subDepth02ListA.attr("href"));

    }
    function headerMouseOff() {
        // 서브이면
        if (subCheck() === true) {
			var _$subGnbListA = $gnbListA.eq(opt.depth01);
			var _gnbWit = _$subGnbListA.width();
			var _gnbPosL = _$subGnbListA.position().left;
			textOver($gnbList, $gnbList.eq(opt.depth01), "hover");
			textOut($depth02List, "hover");
			_animationBar({selecter: $gnbAnibar, wit: _gnbWit, posL: _gnbPosL});

			subPage();
        } else {
        // 메인이면
            textOut($gnbList, "hover");
            textOut($depth02List, "hover");
            _depth02ListClear();
            _gnbListClear();
        }
		if (opt.singleDepth !== undefined) {
			console.log(opt);
			$gnb.stop().animate({"height": 37}, 150);
			$headerWr.stop().animate({"height": 104}, 150);
		}
    }
    function gnbListMouseOn(e) {
		if(mobilecheck()){
			if($(this).next('.depth02').css('display') == 'none' || $('#headerWr').height() < 175){
				e.preventDefault();
			}
			else{
				return
			}
		}
		var _idx = $gnbListA.index(this);
		var _wit = $gnbListA.eq(_idx).width();
        var _posL = $gnbListA.eq(_idx).position().left;

        _depth02ListClear();
        $depth02.eq(_idx).show();
        $depth02List = $depth02.eq(_idx).find("> li");
        $depth02ListA = $depth02.eq(_idx).find("> li > a");

        //class 추가부분
        textOver($gnbList, $(this).parent(), "hover");
        textOut($depth02List, "hover");

        _animationBar({selecter:$gnbAnibar, wit:_wit, posL:_posL});
        if (subCheck() === true) {
            // 제자리가 아니라면 실행
            if (_idx !== opt.depth01) {
                _animationClear({selecter:$depth02Anibar});
            } else {
                subPage();
            }
        } else {
            _animationClear({selecter:$depth02Anibar});
        }
		//단일 패스
		if (opt !== undefined) {
			_gnbOn(_depth02H);
		}

        gnbIdx = _idx;

        return false;
    }
    function depth02ListMouseOn(e) {
        var _idx = $depth02ListA.index(this);
        var _$depth02ListA = $depth02ListA.eq(_idx);
        //var _wit = _$depth02ListA.width();
        //var _posL = _$depth02ListA.position().left;
		var _wit = _$depth02ListA.find('span').width();
        var _posL = _$depth02ListA.position().left + _$depth02ListA.width() / 2 - _$depth02ListA.find('span').width() / 2;
        textOver(_$depth02ListA.parent().siblings(), _$depth02ListA.parent(), "hover");

		_animationBar({selecter: $depth02Anibar, wit: _wit, posL: _posL});

        return false;
    }
    function textOver(item, self, cls) {
        textOut(item, cls);
        textOn(self, cls)
    }
    function textOn(self, cls) {
        self.addClass(cls);
    }
    function textOut(item, cls) {
		try{
        $.each(item, function(){
            if ($(this).hasClass(cls)) {
                $(this).removeClass(cls);
            }
        });
		}catch(e){}
    }
    function animationBarAppend(o) {
        var _wrap = "<div class=\"" + o.name + "\"></div>";
        o.wrap.append(_wrap);
    }

	function _gnbOn(_heightSize) {
		$gnb.stop().animate({"height": _heightSize}, 150);
		$headerWr.stop().animate({"height": _heightSize+64}, 150);
	}

    function _depth02ListClear() {
        $depth02.each(function(){
            if ($(this).is(":visible")) {
                $(this).hide();
            }
        });
    }
    function _gnbListClear() {
        _animationClear({selecter:$gnbAnibar});
        _animationClear({selecter:$depth02Anibar});
        _depth02ListClear();
    }
    function _animationBar(o) {
    	var speed = o.speed || 220;
        o.selecter.css({"top": o.posT}).stop().animate({"left": o.posL, "width": o.wit}, speed);
    }
    function _animationClear(o) {
        o.selecter.stop(true,true).css({"left": 0, "width": 0});
    }
    init();
}

//-------------------------- 스크롤 이벤트 --------------------------//
function headerScroll()
{
    var $miniWrap = $("#headerWr .mini_wrap");
    var $header = $("#headerWr");
    var $totalMenu = $miniWrap.find(".total_menu a");
    var flag = true;
    var scrollEvent = null;
    function init() {
        if (!$miniWrap.length) {
            return false;
        }
        $totalMenu.on("click", gnbEvent);
        // $header.on("mouseleave", gnbOut);
        windowScroll();
        $(window).scroll(windowScroll);
    }

   function windowScroll(){
	   var topValue =  $(this).scrollTop();
		if ($(this).scrollTop() > 206) {
			if (flag === false) return false;
			$miniWrap.show().stop().animate({"top": 0});
			$header.css({"position":"fixed"}).stop(true,true).css({"top": -206});
			flag = false;
		} else {
			if (flag === true) return false;
			$miniWrap.stop().animate({"top": -30},function(){$miniWrap.hide()});
			$header.stop(true,true).css({"position": "absolute", "top": 0});

			flag = true;
		}
    }
    function gnbEvent() {
		$miniWrap.stop().animate({"top": -30},function(){$miniWrap.hide()});
		$header.stop(true,true).animate({"top": 0});
		$(window).on("scroll.one", function(){
			gnbOut();
			$(window).off("scroll.one");
		});

		return false;
    }
    function gnbOut() {
		if (flag) return false;
		$miniWrap.show().stop().animate({"top": 0});
		$header.stop(true,true).animate({"top": -206});
    }

    init();
}

//-------------------------- 탭 --------------------------//
/**
 * tab -
 * @return {[type]} [description]
 */
function tab()
{
    var $tab = $(".tab");
    var $tabList = $tab.find(".tab_list li");
    var $tabConts = $tab.find(".tab_conts .img_box");
    var $tabTxt = $(".main_business .main_summ dd");
    var saveIdx = 0;

    function init() {
        if (!$tab.length) {
            return false;
        }
        stating();
        $tabList.on({
            "click": tabListOn
        });
    }
    function stating() {
        $tabList.eq(saveIdx).addClass("on");
        $tabConts.eq(saveIdx).show();
        $tabTxt.eq(saveIdx).show().siblings("dd").hide();
    }
    function tabListOn() {
        var _idx = $tabList.index(this);
        $tabList.eq(saveIdx).removeClass("on");
        $tabList.eq(_idx).addClass("on");
        $tabConts.eq(saveIdx).stop(true,true).fadeOut(500);
        $tabConts.eq(_idx).stop(true,true).fadeIn(500);
        $tabTxt.eq(saveIdx).hide()
        $tabTxt.eq(_idx).show()
        saveIdx = _idx;
        return false;
    }
    init();
}

//-------------------------- designselect --------------------------//
function designselect()
{
    var $designselect = $(".design_select");
    var $txt = $designselect.find(".txt_val");
    var $btn = $designselect.find(".btn");
    var $listWrap = $designselect.find(".select_list");
    var $list = $listWrap.find("li");
    var $selectLocation = $designselect.attr("location")
    var flag = true;
    var storageScroll = [];

    function init() {
        if (!$designselect.length) {
            return false;
        }
        $designselect.on("mouseleave", {ev : 0}, selectOn);
        $btn.on("click", {ev : 1}, selectOn);
        $txt.on("click", {ev : 2}, selectOn);
        $list.on("click", txtVal);
        $(".scrollholder").each(function(){
        	var _height = $(this).css("height");
        	$(this).attr("data-height", parseInt(_height));
        });
    }

    function disignScrollAdd(o) {
    	var _$scrollholder = $listWrap.eq(o.idx).find(".scrollholder");
    	if (!_$scrollholder.length) {
    		return false;
    	}
    	var _hoderId = _$scrollholder.attr("id")
    	var _crollId = _$scrollholder.find(".scroll").attr("id")

		var lsBrowser = navigator.userAgent;
		var bool = false;
		if (navigator.userAgent.indexOf("iPhone") >= 0){lsBrowser = "iPhone"; bool = true;}
		if (navigator.userAgent.indexOf("iPad") >= 0){lsBrowser = "iPad";bool = true;}
		if (navigator.userAgent.indexOf("Android") >= 0){lsBrowser = "Android";bool = true;}
		if(bool == true){
			//$(".scrollholder").width(180).css({"overflow":"scroll"});;
		}
        if(bool == false) SelectScrollLoad (_hoderId, _crollId, true);
    }

    function selectOn(e) {
        if (e.data !== undefined) {
            if (e.data.ev === 0) {
                var _idx = $designselect.index(this);
                if ($listWrap.eq(_idx).is(":hidden")) return false;
            }
            else if (e.data.ev === 1) var _idx = $btn.index(this);
            else if (e.data.ev === 2) var _idx = $txt.index(this);
        } else {
            var _idx = e;
        }

        if (!flag) return false;
        flag = false;

        if ($listWrap.eq(_idx).is(":hidden")) {
            $listWrap.eq(_idx).stop(true,true).slideDown(150);
            icon({selecter: $designselect.eq(_idx), turn : "on", size : 36, cut : 4});
            disignScrollAdd({idx : _idx});
            flag = true;
        } else if($listWrap.eq(_idx).is(":visible")) {
            $listWrap.eq(_idx).stop(true,true).slideUp(150, function(){flag = true});
            icon({selecter: $designselect.eq(_idx), turn : "off", size : 36, cut : 4});
        }
        return false;
    }
    function txtVal() {

        var _txt = $(this).find("a").text();
        var _idx = $designselect.index($(this).closest($designselect));
        $txt.eq(_idx).text(_txt);
        selectOn(_idx);

        /**
    	 * select 선택시 처리 로직 -(s)-
    	 * > 유지석 / 2014.02.16 21:09
    	 */
    	try {
    		selectChangeProc();
		} catch (e) {
			// TODO: handle exception
		}

		/**
		 * select 선택시 처리 로직 -(e)-
		 */

        if (!$selectLocation) {
            return false;
        }
    }
    init();
}

//-------------------------- icon --------------------------//
function icon(o)
{
    var leg = o.size * (o.cut - 1);
    var val = 0;
    var timer = _timerClear();
    var $icon = o.selecter.find(".icon");
    var mozO = mozOBrowser();

    function init() {
        if (!$icon.length) {
            $icon = o.selecter;
        }
        if (o.turn === "on") {
            timer = setInterval(iconOn, 20);
        } else {
            timer = setInterval(iconOff, 20);
        }
    }
    function iconOn() {
        if (val >= leg) {
            _timerClear();
            return false;
        }

        if (mozO) $icon.stop(false,false).css("background-position", "-=" + o.size + "px 0");
        else $icon.stop(false,false).css("background-position-x", "-=" + o.size + "px");

        val += o.size;
    }

    function iconOff() {
        if (val >= leg) {
            _timerClear();
            return false;
        }

        if (mozO) $icon.stop(false,false).css("background-position", "+=" + o.size + "px 0");
        else $icon.stop(false,false).css("background-position-x", "+=" + o.size + "px");

        val += o.size;
    }

    function _timerClear() {
        clearInterval(timer);
        timer = null;
    }
    init();
}
//-------------------------- tblallBtn --------------------------//
// 전체열리는 버튼 클릭이벤트
var tblTotalBtn = null;
//-------------------------- tblSlider --------------------------//
function tblSlide()
{
    var $tblSlide = $(".tbl_slide");
    var $tblTotalBtn = null
    var $tblChoiceBtn = null
    var $tblList = null
    var $tblConts = null
    var idx = 0;
    var prevIdx = 0;
    var flag = true;
    var mozO = mozOBrowser();
    var bgCheck = false;
    var open = false;

    function init()
    {
        if (!$tblSlide.length) {
            return false;
        }
        $tblTotalBtn = $tblSlide.find(".tbl_totalBtn");
        $tblChoiceBtn = $tblSlide.find(".slideChoiceBtn");
        $tblList = $tblSlide.find(".tbl_slide_list");
        $tblConts = $tblSlide.find(".tbl_slide_conts");

        $tblList.eq(idx).hide();
        $tblConts.eq(idx).show();

        $tblChoiceBtn.on("click", tblChoiceBtn);
        $tblTotalBtn.on({
        	"click": tblTotalBtn
        });

		$tblTotalBtn.find(".icon").on({
            "mouseenter": function(){
            	if (!open) {
            		icon({selecter: $(this), turn : "on", size : 13, cut : 8});
            	}

            },
            "mouseleave": function(){
            	if (!open) {
            		icon({selecter: $(this), turn : "off", size : 13, cut : 8});
            	}

            },
            "click": tblTotalBtn
        });

        $tblChoiceBtn.find(".icon").on({
            "mouseenter": function(){
                icon({selecter: $(this), turn : "on", size : 24, cut : 13});
            },
            "mouseleave": function(){
                icon({selecter: $(this), turn : "off", size : 24, cut : 13});
            },
            "click": function(event){
                event.preventDefault();
            }
        });
    }

    function tblChoiceBtn()
    {
        var _idx = $tblChoiceBtn.index(this);
        $tblList.eq(prevIdx).show();
        $tblList.eq(_idx).hide();
        $tblConts.eq(prevIdx).stop(true,true).slideUp();
        $tblConts.eq(_idx).stop(true,true).slideDown();
        prevIdx = _idx;

		setTimeout(function (){
			$("html, body").stop().animate({"scrollTop":700 + (_idx*40) - 28 }, 500);
		}, 100);

        return false;
    }
    tblTotalBtn = function()
    {
        var _idx = $tblTotalBtn.index(this);
        if (flag) {
            $tblList.hide();
            $tblConts.stop(true,true).slideDown();
			$(".tbldiv01").find("th").addClass("th_color");

            if (mozO) $tblTotalBtn.eq(_idx).find(".icon").stop(false,false).css("background-position", "-91px 0");
        	else $tblTotalBtn.eq(_idx).find(".icon").stop(false,false).css("background-position-x", "-91px");

        	// bgCheck = true;
            flag = false;
            open = true;

			// setTimeout(function (){
			// 	$("html, body").stop().animate({"scrollTop":500}, 500);
			// }, 100);

        } else {
            $tblConts.stop(true,true).slideUp(function(){
                $tblList.show();
            });
			$(".tbldiv01").find("th").removeClass("th_color");
            if (!$(this).hasClass("icon")) {
            	if (mozO) $tblTotalBtn.eq(_idx).find(".icon").stop(false,false).css("background-position", "0 0");
        		else $tblTotalBtn.eq(_idx).find(".icon").stop(false,false).css("background-position-x", "0");
            }
        	// bgCheck = true;
            flag = true;
            open = false;
        }
        return false;
    }

    init();
}
//-------------------------- common --------------------------//
function ie8underBrowser()
{
    if ($.browser.msie  && parseInt($.browser.version, 10) <= 8) {
        return true;
    } else {
        return false;
    }
}
function mozOBrowser()
{
    if ($.browser.mozilla || $.browser.opera) {
        return true;
    } else {
        return false;
    }
}
/**
 * 전페이지 디자인 스크롤 강제적으로 id 1번부터 부여 해주는 작업
 */
function disignScrollIdAdd()
{
	if (!$(".scrollholder").length) {
		return false;
	}

	var $scrollholder = $(".scrollholder");
	var $scroll = $scrollholder.find(".scroll");
	$scrollholder.each(function(i){
		$(this).attr("id", "scrollholder"+(i+1));
		$scroll.eq(i).attr("id", "scroll"+(i+1));
	})
}
$(function(){
    //-------------------------- controller --------------------------//
    designselect();
    headerScroll();
    headerSearch();
    disignScrollIdAdd();
})

$(document).ready(function() {
	/* tab */
	$('.tabBasic>li, .tabBasicSub>li').click(function(e){
		e.preventDefault();

		$(this).siblings().removeClass('on');
		$(this).addClass('on');

		var target = $(this).find('a').attr('href');
		var targets = target.slice(1, -1);

		$('[id^='+targets+']').hide();
		$(target).show();
	});

	/* faq */
	$('.accordion .question a').click(function(){
		$('.accordion .question a').removeClass('on');
		$('.accordion .question a').not(this).parent().next('.answer').hide();
		var thisList = $(this);
		var thisAnswer = $(this).parent().next('.answer');
		thisAnswer.stop().slideToggle('fast', function() {
			if(thisAnswer.is(':visible')){
				thisList.addClass('on');
			}
			else{
				thisList.removeClass('on');
			}
		})
	});

	/* 사업장 안내 */
	$('.workplace ul li .btn').click(function(e){
		e.preventDefault();

		$('.workplace ul li .btn').not(this).parent('li').removeClass('on');
		$('.workplace ul li .btn').not(this).next('.inner').css('height',0);

		$(this).parent('li').addClass('on');
		$(this).next('.inner').css('height','auto');
		bounceElement = $('.' +$(this).attr('href').slice(1)+ '');
		doBounce(bounceElement, 3, '8px', 500);
	});
	function doBounce(element, times, distance, speed) {
		$('.maparea span').stop(true,true).css('margin-top','0px');
		for(var i = 0; i < times; i++) {
			element.animate({marginTop: '-='+distance}, speed)
				.animate({marginTop: '+='+distance}, speed);
		}
	}
	$('.workplace ul li.w1 .btn').click(); //로드시 첫번째 사업장 열기
});