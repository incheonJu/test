 /********************************************************************
 *                                         				*
 *   version:  2.1                         				*
 *   author:   gondo                       				*
 *   email:    gondo@webdesigners.sk       				*
 *   wep-page: http://gondo.webdesigners.sk/javascript-scrollbar/   	*
 *				                                         *
 ********************************************************************/

/* number of scrolling objects */
document.No = 0;

var isOpera = (window.navigator.userAgent.indexOf("Opera") > -1);

function ScrollLoad (Area, Content, SettingTracSize)
{

    var code = "var scroller" + document.No + " = new dw_scrollObj (Area, Content, Content, Area, document.No);";

    if (SettingTracSize)
        code += "scroller" + document.No + ".setBarSize("+document.No+");";
    eval (code);
    makeMouseWheeleScrolling(Area);
    document.No++;
}

/* <Mouse wheele scrolling> */
var mouseWheelTimer = 0;

function makeMouseWheeleScrolling(objName)
{
    var obj = document.getElementById(objName);
	if(obj == null) return;
    if (obj.addEventListener)
    {
        obj.addEventListener("DOMMouseScroll", wheel, false);

        var bb1 = 0;
		var cc1 = 0;
		var flag = true;

		obj.ontouchstart = function(event)
		{
	    	bb1 = event.touches[0].pageY;
	        event.stopPropagation();
		};
		obj.ontouchmove = function(event)
		{
			cc1 = event.touches[0].pageY - bb1
			if (cc1 < 0) {
				touchMoveDown(this);
			} else {
				touchMoveUp(this);
			}
			flag = false;
		    event.preventDefault();
		};
		obj.ontouchend = function(event)
		{
			if (flag) return false;
			cc1 = 0;
		    flag = true;
		    event.preventDefault();
		};
    }
    obj.onmousewheel = wheel;
}

function touchMoveUp(parent)
{
	dw_scrollObj.initScroll(parent.id, "up", 500);
    clearInterval(mouseWheelTimer);
    mouseWheelTimer = setTimeout("mouseStop('" + parent.id + "');", 50);
}
function touchMoveDown(parent)
{
    dw_scrollObj.initScroll(parent.id, "down", 500);
    clearInterval(mouseWheelTimer);
    mouseWheelTimer = setTimeout("mouseStop('" + parent.id + "');", 200);
}
function moveUp(parent)
{
    dw_scrollObj.initScroll(parent.id, "up");
    clearInterval(mouseWheelTimer);
    mouseWheelTimer = setTimeout("mouseStop('" + parent.id + "');", 200);
}

function moveDown(parent)
{
    dw_scrollObj.initScroll(parent.id, "down");
    clearInterval(mouseWheelTimer);
    mouseWheelTimer = setTimeout("mouseStop('" + parent.id + "');", 200);
}

function mouseStop(parentId)
{
    dw_scrollObj.stopScroll(parentId);
    mouseWheelTimer = 0;
}
/* 추가된 부분 s */
var keys = [37, 38, 39, 40];

function preventDefault(e) {
  e = e || window.event;
  if (e.preventDefault)
      e.preventDefault();
  e.returnValue = false;
}

function keydown(e) {
    for (var i = keys.length; i--;) {
        if (e.keyCode === keys[i]) {
            preventDefault(e);
            return;
        }
    }
}

function wheel1(e) {
  preventDefault(e);
}

function disable_scroll() {
  if (window.addEventListener) {
      window.addEventListener('DOMMouseScroll', wheel1, false);
  }
  window.onmousewheel = document.onmousewheel = wheel1;
  document.onkeydown = keydown;
}

function enable_scroll() {
    if (window.removeEventListener) {
        window.removeEventListener('DOMMouseScroll', wheel1, false);
    }
    window.onmousewheel = document.onmousewheel = document.onkeydown = null;
}
/* 추가된 부분 e */
/* mouse wheel functions to scroll on mouse wheel efect over object with my js scrollbar */
function handle(delta, parent)
{
	disable_scroll();
    var s = delta + ": ";
    if (delta < 0)
    {
		if (isOpera)
	        moveUp(parent);
		else
	        moveDown(parent);
    }
    else
    {
		if (isOpera)
	        moveDown(parent);
		else
			moveUp(parent);
    }
}

function wheel(event)
{
    var delta = 0;
    if (!event) event = window.event;
    if (event.wheelDelta)
    {
        delta = event.wheelDelta/120;
        if (window.opera) delta = -delta;
    }
    else if (event.detail)
    {
        delta = -event.detail/3;
    }
    if (delta)
        handle(delta, this);
}
/* </mouse wheele scrolling> */

/**************************************************************************/

dw_scrollObjs = {};

function dw_scrollObj(wnId,lyrId,cntId,area,No){



    dw_scrollObj.speed=150;
    this.id=wnId;
    dw_scrollObjs[this.id]=this;
    this.animString="dw_scrollObjs."+this.id;
    if(!this.write_scroll_bar(wnId,area,cntId,No)) return;
    this.load(lyrId,cntId);
    this.setUpScrollbar("drag_bar" + No, "track" + No, "v", 0, 0);
};

dw_scrollObj.prototype.write_scroll_bar = function(content,where,text,No){

	////consolelog( $(".track") );
	////consolelog( $(document).find(".track").length );
	//$( document ).remove( ":contains('track')" );
	// $("#track").remove();



    where_obj   = document.getElementById(where);
    text_obj    = document.getElementById(text);
    content_obj = document.getElementById(content);

	// console.log(where_obj);

	////consolelog($(content_obj).find(".track").length );

	//if(where_obj == null) return;
	//if(text_obj == null) return;
	//if(content_obj == null) return;
	// console.log(text_obj.offsetHeight, where_obj.offsetHeight);
    // if(text_obj.offsetHeight <= where_obj.offsetHeight){
    // 	where_obj.style.height = text_obj.offsetHeight + "px";
    //     return false;
    // }
 //    content_obj.style.overflow="hidden";
 //    var content_width = content_obj.offsetWidth;
	// $(where_obj).append( '<div id="track" class="track"><div id="drag_bar" class="drag_bar"></div></div>');
 //    /* set text width */
 //    var scroll_width = document.getElementById('track').offsetWidth;
 //    document.getElementById(text).style.width = content_width - scroll_width + 'px';
 //    return true;
    if(text_obj.offsetHeight <= where_obj.offsetHeight){
        return false;
    }
    content_obj.style.overflow="hidden";
    var content_width = content_obj.offsetWidth;
	where_obj.innerHTML += '<div id="track' + No + '" class="track"><div id="drag_bar' + No + '" class="drag_bar"></div></div>';
    /* set text width */
    var scroll_width = document.getElementById('track' + No).offsetWidth;
    document.getElementById(text).style.width = content_width - scroll_width + 'px';
    return true;
}

dw_scrollObj.loadLayer = function(wnId,id,cntId){
    if(dw_scrollObjs[wnId])
        dw_scrollObjs[wnId].load(id,cntId);
};

dw_scrollObj.prototype.load = function(lyrId,cntId){
    if(!document.getElementById)
        return;
    var wndo,lyr;
    if(this.lyrId){
        lyr=document.getElementById(this.lyrId);
        lyr.style.visibility="hidden";
    }
    lyr=document.getElementById(lyrId);
    wndo=document.getElementById(this.id);
    lyr.style.top=this.y=0;
    lyr.style.left=this.x=0;
    this.maxY=(lyr.offsetHeight-wndo.offsetHeight>0)?lyr.offsetHeight-wndo.offsetHeight:0;
    this.wd=cntId?document.getElementById(cntId).offsetWidth:lyr.offsetWidth;
    this.maxX=(this.wd-wndo.offsetWidth>0)?this.wd-wndo.offsetWidth:0;
    this.lyrId=lyrId;
    lyr.style.visibility="visible";
    this.on_load();
    this.ready=true;
};

dw_scrollObj.prototype.on_load=function(){};
dw_scrollObj.prototype.shiftTo=function(lyr,x,y){
    if ((!lyr) || (!lyr.style))
        return;
    lyr.style.left=(this.x=x)+"px";
    lyr.style.top=(this.y=y)+"px";
};

dw_scrollObj.GeckoTableBugFix=function(){
    var ua=navigator.userAgent;
    if(ua.indexOf("Gecko")>-1&&ua.indexOf("Firefox")==-1&&ua.indexOf("Safari")==-1&&ua.indexOf("Konqueror")==-1){
        dw_scrollObj.hold=[];
        for(var i=0;arguments[i];i++){
            if(dw_scrollObjs[arguments[i]]){
                var wndo=document.getElementById(arguments[i]);
                var holderId=wndo.parentNode.id;
                var holder=document.getElementById(holderId);
                document.body.appendChild(holder.removeChild(wndo));
                wndo.style.zIndex=1000;
                var pos=getPageOffsets(holder);
                wndo.style.left=pos.x+"px";
                wndo.style.top=pos.y+"px";
                dw_scrollObj.hold[i]=[arguments[i],holderId];
            }
        }
        window.addEventListener("resize",dw_scrollObj.rePositionGecko,true);
    }
};

dw_scrollObj.rePositionGecko=function(){
    if(dw_scrollObj.hold){
        for(var i=0;dw_scrollObj.hold[i];i++){
            var wndo=document.getElementById(dw_scrollObj.hold[i][0]);
            var holder=document.getElementById(dw_scrollObj.hold[i][1]);
            var pos=getPageOffsets(holder);
            wndo.style.left=pos.x+"px";
            wndo.style.top=pos.y+"px";
        }
    }
};

function getPageOffsets(el){
    var left=el.offsetLeft;
    var top=el.offsetTop;
    if(el.offsetParent&&el.offsetParent.clientLeft||el.offsetParent.clientTop){
        left+=el.offsetParent.clientLeft;
        top+=el.offsetParent.clientTop;
    }
    while(el=el.offsetParent){
        left+=el.offsetLeft;
        top+=el.offsetTop;
    }
    return{x:left,y:top};
};

dw_scrollObj.stopScroll = function(wnId) {
  if ( dw_scrollObjs[wnId] ) dw_scrollObjs[wnId].endScroll();
  enable_scroll();
}

dw_scrollObj.doubleSpeed = function(wnId) {
  if ( dw_scrollObjs[wnId] ) dw_scrollObjs[wnId].speed *= 2;
}

dw_scrollObj.resetSpeed = function(wnId) {
  if ( dw_scrollObjs[wnId] ) dw_scrollObjs[wnId].speed /= 2;
}

dw_scrollObj.initScroll = function(wnId, deg, sp) {
  if ( dw_scrollObjs[wnId] ) {
    var cosine, sine;
    if (typeof deg == "string") {
      switch (deg) {
        case "up"    : deg = 90;  break;
        case "down"  : deg = 270; break;
        case "left"  : deg = 180; break;
        case "right" : deg = 0;   break;
        default: return;
       }
    }
    deg = deg % 360;
    if (deg % 90 == 0) {
      cosine = (deg == 0)? -1: (deg == 180)? 1: 0;
      sine = (deg == 90)? 1: (deg == 270)? -1: 0;
    } else {
      var angle = deg * Math.PI/180;
      cosine = -Math.cos(angle); sine = Math.sin(angle);
    }
    dw_scrollObjs[wnId].fx = cosine / ( Math.abs(cosine) + Math.abs(sine) );
    dw_scrollObjs[wnId].fy = sine / ( Math.abs(cosine) + Math.abs(sine) );
    dw_scrollObjs[wnId].endX = (deg == 90 || deg == 270)? dw_scrollObjs[wnId].x:
      (deg < 90 || deg > 270)? -dw_scrollObjs[wnId].maxX: 0;
    dw_scrollObjs[wnId].endY = (deg == 0 || deg == 180)? dw_scrollObjs[wnId].y:
      (deg < 180)? 0: -dw_scrollObjs[wnId].maxY;
    dw_scrollObjs[wnId].startScroll(sp);
  }
}

dw_scrollObj.prototype.startScroll = function(speed) {
  if (!this.ready) return; if (this.timerId) clearInterval(this.timerId);
  this.speed = speed || dw_scrollObj.speed;
  this.lyr = document.getElementById(this.lyrId);
  this.lastTime = ( new Date() ).getTime();
  this.on_scroll_start();
  this.timerId = setInterval(this.animString + ".scroll()", 10);
}

dw_scrollObj.prototype.scroll = function() {
  var now = ( new Date() ).getTime();
  var d = (now - this.lastTime)/1000 * this.speed;
  if (d > 0) {
    var x = this.x + this.fx * d; var y = this.y + this.fy * d;
    if (this.fx == 0 || this.fy == 0) {
      if ( ( this.fx == -1 && x > -this.maxX ) || ( this.fx == 1 && x < 0 ) ||
        ( this.fy == -1 && y > -this.maxY ) || ( this.fy == 1 && y < 0 ) ) {
        this.lastTime = now;
        this.shiftTo(this.lyr, x, y);
        this.on_scroll(x, y);
      } else {
        clearInterval(this.timerId); this.timerId = 0;
        this.shiftTo(this.lyr, this.endX, this.endY);
        this.on_scroll_end(this.endX, this.endY);
      }
    } else {
      if ( ( this.fx < 0 && x >= -this.maxX && this.fy < 0 && y >= -this.maxY ) ||
        ( this.fx > 0 && x <= 0 && this.fy > 0 && y <= 0 ) ||
        ( this.fx < 0 && x >= -this.maxX && this.fy > 0 && y <= 0 ) ||
        ( this.fx > 0 && x <= 0 && this.fy < 0 && y >= -this.maxY ) ) {
        this.lastTime = now;
        this.shiftTo(this.lyr, x, y);
        this.on_scroll(x, y);
      } else {
        clearInterval(this.timerId); this.timerId = 0;
        this.on_scroll_end(this.x, this.y);
      }
    }
  }
}

dw_scrollObj.prototype.endScroll = function() {
  if (!this.ready) return;
  if (this.timerId) clearInterval(this.timerId);
  this.timerId = 0;  this.lyr = null;
}

dw_scrollObj.prototype.on_scroll = function() {}
dw_scrollObj.prototype.on_scroll_start = function() {}
dw_scrollObj.prototype.on_scroll_end = function() {}

dw_scrollObj.slideDur = 500;

dw_scrollObj.scrollBy = function(wnId, x, y, dur) {
  if ( dw_scrollObjs[wnId] ) dw_scrollObjs[wnId].glideBy(x, y, dur);
}

dw_scrollObj.scrollTo = function(wnId, x, y, dur) {
  if ( dw_scrollObjs[wnId] ) dw_scrollObjs[wnId].glideTo(x, y, dur);
}

dw_scrollObj.prototype.glideBy = function(dx, dy, dur) {
  if ( !document.getElementById || this.sliding ) return;
  this.slideDur = dur || dw_scrollObj.slideDur;
  this.destX = this.destY = this.distX = this.distY = 0;
  this.lyr = document.getElementById(this.lyrId);
  this.startX = this.x; this.startY = this.y;
  if (dy < 0) this.distY = (this.startY + dy >= -this.maxY)? dy: -(this.startY  + this.maxY);
  else if (dy > 0) this.distY = (this.startY + dy <= 0)? dy: -this.startY;
  if (dx < 0) this.distX = (this.startX + dx >= -this.maxX)? dx: -(this.startX + this.maxX);
  else if (dx > 0) this.distX = (this.startX + dx <= 0)? dx: -this.startX;
  this.destX = this.startX + this.distX; this.destY = this.startY + this.distY;
  this.slideTo(this.destX, this.destY);
}

dw_scrollObj.prototype.glideTo = function(destX, destY, dur) {
    if ( !document.getElementById || this.sliding) return;
    this.slideDur = dur || dw_scrollObj.slideDur;
    this.lyr = document.getElementById(this.lyrId);
    this.startX = this.x; this.startY = this.y;
    this.destX = -Math.max( Math.min(destX, this.maxX), 0);
    this.destY = -Math.max( Math.min(destY, this.maxY), 0);
    this.distY = this.destY - this.startY;
    this.distX =  this.destX - this.startX;
    this.slideTo(this.destX, this.destY);
}

dw_scrollObj.prototype.slideTo = function(destX, destY) {
    this.per = Math.PI/(2 * this.slideDur); this.sliding = true;
    this.slideStart = (new Date()).getTime();
    this.aniTimer = setInterval(this.animString + ".doSlide()",10);
    this.on_slide_start(this.startX, this.startY);
}

dw_scrollObj.prototype.doSlide = function() {
    var elapsed = (new Date()).getTime() - this.slideStart;
    if (elapsed < this.slideDur) {
        var x = this.startX + this.distX * Math.sin(this.per*elapsed);
        var y = this.startY + this.distY * Math.sin(this.per*elapsed);
        this.shiftTo(this.lyr, x, y); this.on_slide(x, y);
    } else {
        clearInterval(this.aniTimer); this.sliding = false;
        this.shiftTo(this.lyr, this.destX, this.destY);
        this.lyr = null; this.on_slide_end(this.destX, this.destY);
    }
}

dw_scrollObj.prototype.on_slide_start = function() {}
dw_scrollObj.prototype.on_slide = function() {}
dw_scrollObj.prototype.on_slide_end = function() {}

var dw_slidebar = {
  obj: null,
  slideDur: 500,
  init: function (bar, track, axis, x, y) {
    x = x || 0; y = y || 0;
    bar.style.left = x + "px"; bar.style.top = y + "px";
    bar.axis = axis; track.bar = bar;

    if (axis == "h") {
      bar.trkWd = track.offsetWidth;
      bar.maxX = bar.trkWd - bar.offsetWidth - x;
      bar.minX = x; bar.maxY = y; bar.minY = y;
    } else {
      bar.trkHt = track.offsetHeight;

      bar.maxY = bar.trkHt - bar.offsetHeight - y;
      bar.maxX = x; bar.minX = x; bar.minY = y;
    }
    bar.on_drag_start =  bar.on_drag =   bar.on_drag_end =
    bar.on_slide_start = bar.on_slide =  bar.on_slide_end = function() {}
    bar.onmousedown = this.startDrag; track.onmousedown = this.startSlide;
  },

  startSlide: function(e) {
    if ( dw_slidebar.aniTimer ) clearInterval(dw_slidebar.aniTimer);
    e = e? e: window.event;
    var bar = dw_slidebar.obj = this.bar;
    e.offX = (typeof e.layerX != "undefined")? e.layerX: e.offsetX;
    e.offY = (typeof e.layerY != "undefined")? e.layerY: e.offsetY;
    bar.startX = parseInt(bar.style.left); bar.startY = parseInt(bar.style.top);
    if (bar.axis == "v") {
      bar.destX = bar.startX;
      bar.destY = (e.offY < bar.startY)? e.offY: e.offY - bar.offsetHeight;
      bar.destY = Math.min( Math.max(bar.destY, bar.minY), bar.maxY );
    } else {
      bar.destX = (e.offX < bar.startX)? e.offX: e.offX - bar.offsetWidth;
      bar.destX = Math.min( Math.max(bar.destX, bar.minX), bar.maxX );
      bar.destY = bar.startY;
    }
    bar.distX = bar.destX - bar.startX; bar.distY = bar.destY - bar.startY;
    dw_slidebar.per = Math.PI/(2 * dw_slidebar.slideDur);
    dw_slidebar.slideStart = (new Date()).getTime();
    bar.on_slide_start(bar.startX, bar.startY);
    dw_slidebar.aniTimer = setInterval("dw_slidebar.doSlide()",10);
  },

  doSlide: function() {
    if ( !dw_slidebar.obj ) { clearInterval(dw_slidebar.aniTimer); return; }
    var bar = dw_slidebar.obj;
    var elapsed = (new Date()).getTime() - this.slideStart;
    if (elapsed < this.slideDur) {
        var x = bar.startX + bar.distX * Math.sin(this.per*elapsed);
        var y = bar.startY + bar.distY * Math.sin(this.per*elapsed);
        bar.style.left = x + "px"; bar.style.top = y + "px";
        bar.on_slide(x, y);
    } else {
        clearInterval(this.aniTimer);
        bar.style.left = bar.destX + "px"; bar.style.top = bar.destY + "px";
        bar.on_slide_end(bar.destX, bar.destY);
        this.obj = null;
    }
  },

  startDrag: function (e) {
    e = dw_event.DOMit(e);
    if ( dw_slidebar.aniTimer ) clearInterval(dw_slidebar.aniTimer);
    var bar = dw_slidebar.obj = this;
    bar.downX = e.clientX; bar.downY = e.clientY;
    bar.startX = parseInt(bar.style.left);
    bar.startY = parseInt(bar.style.top);
    bar.on_drag_start(bar.startX, bar.startY);
    dw_event.add( document, "mousemove", dw_slidebar.doDrag, true );
    dw_event.add( document, "mouseup",   dw_slidebar.endDrag,  true );
    e.stopPropagation();
  },

  doDrag: function (e) {
    e = e? e: window.event;
    if (!dw_slidebar.obj) return;
    var bar = dw_slidebar.obj;
    var nx = bar.startX + e.clientX - bar.downX;
    var ny = bar.startY + e.clientY - bar.downY;
    nx = Math.min( Math.max( bar.minX, nx ), bar.maxX);
    ny = Math.min( Math.max( bar.minY, ny ), bar.maxY);
    bar.style.left = nx + "px"; bar.style.top  = ny + "px";
    bar.on_drag(nx,ny);
    return false;
  },

  endDrag: function () {
    dw_event.remove( document, "mousemove", dw_slidebar.doDrag, true );
    dw_event.remove( document, "mouseup",   dw_slidebar.endDrag,  true );
    if ( !dw_slidebar.obj ) return;
    dw_slidebar.obj.on_drag_end( parseInt(dw_slidebar.obj.style.left), parseInt(dw_slidebar.obj.style.top) );
    dw_slidebar.obj = null;
  }

}

dw_scrollObj.prototype.setUpScrollbar = function(id, trkId, axis, offx, offy) {

	//consolelog("----------------------------");
	//consolelog(document.getElementById(id));
	//consolelog( document.getElementById(trkId));
  var bar = document.getElementById(id);
  var trk = document.getElementById(trkId);

	//$(trk).height(90);

	//consolelog(bar);
	//consolelog( trk, trk.offsetHeight);

  dw_slidebar.init(bar, trk, axis, offx, offy);
  bar.wn = dw_scrollObjs[this.id];
  if (axis == "v") this.vBarId = id; else this.hBarId = id;
  bar.on_drag_start = bar.on_slide_start = dw_scrollObj.getWndoLyrRef;
  bar.on_drag_end =   bar.on_slide_end =   dw_scrollObj.tossWndoLyrRef;
  bar.on_drag =       bar.on_slide =       dw_scrollObj.UpdateWndoLyrPos;
}

dw_scrollObj.getWndoLyrRef = function()  { this.wnLyr = document.getElementById(this.wn.lyrId); }
dw_scrollObj.tossWndoLyrRef = function() { this.wnLyr = null; }
dw_scrollObj.UpdateWndoLyrPos = function(x, y) {
  var nx, ny;
  if (this.axis == "v") {
    nx = this.wn.x;
    ny = -(y - this.minY) * ( this.wn.maxY / (this.maxY - this.minY) ) || 0;
  } else {
    ny = this.wn.y;
    nx = -(x - this.minX) * ( this.wn.maxX / (this.maxX - this.minX) ) || 0;
  }
  this.wn.shiftTo(this.wnLyr, nx, ny);
}

dw_scrollObj.prototype.updateScrollbar = function(x, y) {
  var nx, ny;
  if ( this.vBarId ) {
    if (!this.maxY) return;
    ny = -( y * ( (this.vbar.maxY - this.vbar.minY) / this.maxY ) - this.vbar.minY );
    ny = Math.min( Math.max(ny, this.vbar.minY), this.vbar.maxY);
    nx = parseInt(this.vbar.style.left);
    this.vbar.style.left = nx + "px"; this.vbar.style.top = ny + "px";
  } if ( this.hBarId ) {
    if (!this.maxX) return;
    nx = -( x * ( (this.hbar.maxX - this.hbar.minX) / this.maxX ) - this.hbar.minX );
    nx = Math.min( Math.max(nx, this.hbar.minX), this.hbar.maxX);
    ny = parseInt(this.hbar.style.top);
    this.hbar.style.left = nx + "px"; this.hbar.style.top = ny + "px";
  }

}

dw_scrollObj.prototype.restoreScrollbars = function() {
  var bar;
  if (this.vBarId) {
    bar = document.getElementById(this.vBarId);
    bar.style.left = bar.minX + "px"; bar.style.top = bar.minY + "px";
  }
  if (this.hBarId) {
    bar = document.getElementById(this.hBarId);
    bar.style.left = bar.minX + "px"; bar.style.top = bar.minY + "px";
  }
}

var _trackHeights = [];
dw_scrollObj.prototype.setBarSize = function($no) {

  var bar;
  var lyr = document.getElementById(this.lyrId);
  var wn = document.getElementById(this.id);
  if (this.vBarId) {
    bar = document.getElementById(this.vBarId);

	//consolelog( $("#"+this.vBarId).length );
	//$(this.vBarId).attr({"idx":$no});

	////consolelog(this.lyrId, this.id , this.vBarId, bar.trkHt, this.id );

	//_trackHeights[$no] = bar.trkHt;
    bar.style.height = (lyr.offsetHeight > wn.offsetHeight)? bar.trkHt / ( lyr.offsetHeight / wn.offsetHeight ) + "px": bar.trkHt - 2*bar.minY + "px";
    bar.maxY = bar.trkHt - bar.offsetHeight - bar.minY;
  }
  if (this.hBarId) {
    bar = document.getElementById(this.hBarId);
    bar.style.width = (this.wd > wn.offsetWidth)? bar.trkWd / ( this.wd / wn.offsetWidth ) + "px": bar.trkWd - 2*bar.minX + "px";
    bar.maxX = bar.trkWd - bar.offsetWidth - bar.minX;
  }
}

dw_scrollObj.prototype.on_load = function() {
  this.restoreScrollbars();
}

dw_scrollObj.prototype.on_scroll = dw_scrollObj.prototype.on_slide = function(x,y) { this.updateScrollbar(x,y); }

dw_scrollObj.prototype.on_scroll_start = dw_scrollObj.prototype.on_slide_start = function() {
  if ( this.vBarId ) this.vbar = document.getElementById(this.vBarId);
  if ( this.hBarId ) this.hbar = document.getElementById(this.hBarId);
}

dw_scrollObj.prototype.on_scroll_end = dw_scrollObj.prototype.on_slide_end = function(x, y) {
  this.updateScrollbar(x,y);
  this.lyr = null; this.bar = null;
}

var dw_event = {

  add: function(obj, etype, fp, cap) {
    cap = cap || false;
    if (obj.addEventListener) obj.addEventListener(etype, fp, cap);
    else if (obj.attachEvent) obj.attachEvent("on" + etype, fp);
  },

  remove: function(obj, etype, fp, cap) {
    cap = cap || false;
    if (obj.removeEventListener) obj.removeEventListener(etype, fp, cap);
    else if (obj.detachEvent) obj.detachEvent("on" + etype, fp);
  },

  DOMit: function(e) {
    e = e? e: window.event;
    e.tgt = e.srcElement? e.srcElement: e.target;

    if (!e.preventDefault) e.preventDefault = function () { return false; }
    if (!e.stopPropagation) e.stopPropagation = function () { if (window.event) window.event.cancelBubble = true; }

    return e;
  }

}





 /********************************************************************
 *                                         				*
 *   version:  2.1                         				*
 *   author:   gondo                       				*
 *   email:    gondo@webdesigners.sk       				*
 *   wep-page: http://gondo.webdesigners.sk/javascript-scrollbar/   	*
 *				                                         *
 ********************************************************************/

/* number of scrolling objects */
var isOpera = (window.navigator.userAgent.indexOf("Opera") > -1);

function SelectScrollLoad (Area, Content, SettingTracSize)
{
    var code = "var scroller" + document.No + " = new SelectDw_scrollObj (Area, Content, Content, Area, document.No);";

    if (SettingTracSize)
        code += "scroller" + document.No + ".setBarSize("+document.No+");";
    eval (code);
    SelectMakeMouseWheeleScrolling(Area);
    document.No++;
}

/* <Mouse wheele scrolling> */
var mouseWheelTimer = 0;

function SelectMakeMouseWheeleScrolling(objName)
{
    var obj = document.getElementById(objName);
	if(obj == null) return;
    if (obj.addEventListener)
    {
        obj.addEventListener("DOMMouseScroll", SelectWheel, false);

		var bb = 0;
		var cc = 0;
		var flag1 = true;

		obj.ontouchstart = function(event)
		{
	    	bb = event.touches[0].pageY;
	        event.stopPropagation();
		};
		obj.ontouchmove = function(event)
		{
			cc = event.touches[0].pageY - bb
			if (cc < 0) {
				SelectTouchMoveDown(this);
			} else {
				SelectTouchMoveUp(this);
			}
			flag1 = false;
		    event.preventDefault();
		};
		obj.ontouchend = function(event)
		{
			if (flag1) return false;
			cc = 0;
		    flag1 = true;
		    event.preventDefault();
		};
    }
    obj.onmousewheel = SelectWheel;
}
function SelectTouchMoveUp(parent)
{
	SelectDw_scrollObj.initScroll(parent.id, "up", 500);
    clearInterval(mouseWheelTimer);
    mouseWheelTimer = setTimeout("SelectMouseStop('" + parent.id + "');", 50);
}
function SelectTouchMoveDown(parent)
{
    SelectDw_scrollObj.initScroll(parent.id, "down", 500);
    clearInterval(mouseWheelTimer);
    mouseWheelTimer = setTimeout("SelectMouseStop('" + parent.id + "');", 200);
}
function SelectMoveUp(parent)
{
    SelectDw_scrollObj.initScroll(parent.id, "up");
    clearInterval(mouseWheelTimer);
    mouseWheelTimer = setTimeout("SelectMouseStop('" + parent.id + "');", 200);
}

function SelectMoveDown(parent)
{
    SelectDw_scrollObj.initScroll(parent.id, "down");
    clearInterval(mouseWheelTimer);
    mouseWheelTimer = setTimeout("SelectMouseStop('" + parent.id + "');", 200);
}

function SelectMouseStop(parentId)
{
    SelectDw_scrollObj.stopScroll(parentId);
    mouseWheelTimer = 0;
}
/* 추가된 부분 s */
var keys = [37, 38, 39, 40];

function preventDefault(e) {
  e = e || window.event;
  if (e.preventDefault)
      e.preventDefault();
  e.returnValue = false;
}

function keydown(e) {
    for (var i = keys.length; i--;) {
        if (e.keyCode === keys[i]) {
            preventDefault(e);
            return;
        }
    }
}

function wheel1(e) {
  preventDefault(e);
}

function disable_scroll() {
  if (window.addEventListener) {
      window.addEventListener('DOMMouseScroll', wheel1, false);
  }
  window.onmousewheel = document.onmousewheel = wheel1;
  document.onkeydown = keydown;
}

function enable_scroll() {
    if (window.removeEventListener) {
        window.removeEventListener('DOMMouseScroll', wheel1, false);
    }
    window.onmousewheel = document.onmousewheel = document.onkeydown = null;
}
/* 추가된 부분 e */
/* mouse wheel functions to scroll on mouse wheel efect over object with my js scrollbar */
function SelectHandle(delta, parent)
{
	disable_scroll();
    var s = delta + ": ";
    if (delta < 0)
    {
		if (isOpera)
	        SelectMoveUp(parent);
		else
	        SelectMoveDown(parent);
    }
    else
    {
		if (isOpera)
	        SelectMoveDown(parent);
		else
			SelectMoveUp(parent);
    }
}

function SelectWheel(event)
{
    var delta = 0;
    if (!event) event = window.event;
    if (event.wheelDelta)
    {
        delta = event.wheelDelta/120;
        if (window.opera) delta = -delta;
    }
    else if (event.detail)
    {
        delta = -event.detail/3;
    }
    if (delta)
        SelectHandle(delta, this);
}
/* </mouse wheele scrolling> */

/**************************************************************************/

SelectDw_scrollObjs = {};

function SelectDw_scrollObj(wnId,lyrId,cntId,area,No){
    SelectDw_scrollObj.speed=150;
    this.id=wnId;
    SelectDw_scrollObjs[this.id]=this;
    this.animString="SelectDw_scrollObjs."+this.id;
    if(!this.SelectWrite_scroll_bar(wnId,area,cntId,No)) return;
    this.load(lyrId,cntId);
    this.setUpScrollbar("drag_bar" , "track" , "v", 0, 0);
};

SelectDw_scrollObj.prototype.SelectWrite_scroll_bar = function(content,where,text,No){

	////consolelog( $(".track") );
	////consolelog( $(document).find(".track").length );
	//$( document ).remove( ":contains('track')" );
	$("#track").remove();



    where_obj   = document.getElementById(where);
    text_obj    = document.getElementById(text);
    content_obj = document.getElementById(content);

	// console.log(where_obj);

	////consolelog($(content_obj).find(".track").length );

	//if(where_obj == null) return;
	//if(text_obj == null) return;
	//if(content_obj == null) return;
	// console.log(text_obj.offsetHeight, where_obj.offsetHeight);
    if(text_obj.offsetHeight <= where_obj.offsetHeight){
    	where_obj.style.height = text_obj.offsetHeight + "px";
    	document.getElementById(text).style.width = "100%";
    	$(".scroll").css("top", 0);
    	$("#track").remove();
        return false;
    }

    if ($(where_obj).attr("data-height") != null) {
		var _height = parseInt($(where_obj).find("ul").height());
		var _dataHeight = parseInt($(where_obj).attr("data-height"));
		if (_height > _dataHeight) {
			$(where_obj).css("height", _dataHeight);
		} else {
			$(where_obj).css("height", _height + 2);
			return false;
		}
	}

    content_obj.style.overflow="hidden";
    var content_width = content_obj.offsetWidth;
	$(where_obj).append( '<div id="track" class="track"><div id="drag_bar" class="drag_bar"></div></div>');
    /* set text width */
    var scroll_width = document.getElementById('track').offsetWidth;
    document.getElementById(text).style.width = content_width - scroll_width + 'px';
    return true;
}

SelectDw_scrollObj.loadLayer = function(wnId,id,cntId){
    if(SelectDw_scrollObjs[wnId])
        SelectDw_scrollObjs[wnId].load(id,cntId);
};

SelectDw_scrollObj.prototype.load = function(lyrId,cntId){
    if(!document.getElementById)
        return;
    var wndo,lyr;
    if(this.lyrId){
        lyr=document.getElementById(this.lyrId);
        lyr.style.visibility="hidden";
    }
    lyr=document.getElementById(lyrId);
    wndo=document.getElementById(this.id);
    lyr.style.top=this.y=0;
    lyr.style.left=this.x=0;
    this.maxY=(lyr.offsetHeight-wndo.offsetHeight>0)?lyr.offsetHeight-wndo.offsetHeight:0;
    this.wd=cntId?document.getElementById(cntId).offsetWidth:lyr.offsetWidth;
    this.maxX=(this.wd-wndo.offsetWidth>0)?this.wd-wndo.offsetWidth:0;
    this.lyrId=lyrId;
    lyr.style.visibility="visible";
    this.on_load();
    this.ready=true;
};

SelectDw_scrollObj.prototype.on_load=function(){};
SelectDw_scrollObj.prototype.shiftTo=function(lyr,x,y){
    if ((!lyr) || (!lyr.style))
        return;
    lyr.style.left=(this.x=x)+"px";
    lyr.style.top=(this.y=y)+"px";
};

SelectDw_scrollObj.GeckoTableBugFix=function(){
    var ua=navigator.userAgent;
    if(ua.indexOf("Gecko")>-1&&ua.indexOf("Firefox")==-1&&ua.indexOf("Safari")==-1&&ua.indexOf("Konqueror")==-1){
        SelectDw_scrollObj.hold=[];
        for(var i=0;arguments[i];i++){
            if(SelectDw_scrollObjs[arguments[i]]){
                var wndo=document.getElementById(arguments[i]);
                var holderId=wndo.parentNode.id;
                var holder=document.getElementById(holderId);
                document.body.appendChild(holder.removeChild(wndo));
                wndo.style.zIndex=1000;
                var pos=getPageOffsets(holder);
                wndo.style.left=pos.x+"px";
                wndo.style.top=pos.y+"px";
                SelectDw_scrollObj.hold[i]=[arguments[i],holderId];
            }
        }
        window.addEventListener("resize",SelectDw_scrollObj.rePositionGecko,true);
    }
};

SelectDw_scrollObj.rePositionGecko=function(){
    if(SelectDw_scrollObj.hold){
        for(var i=0;SelectDw_scrollObj.hold[i];i++){
            var wndo=document.getElementById(SelectDw_scrollObj.hold[i][0]);
            var holder=document.getElementById(SelectDw_scrollObj.hold[i][1]);
            var pos=getPageOffsets(holder);
            wndo.style.left=pos.x+"px";
            wndo.style.top=pos.y+"px";
        }
    }
};

function getPageOffsets(el){
    var left=el.offsetLeft;
    var top=el.offsetTop;
    if(el.offsetParent&&el.offsetParent.clientLeft||el.offsetParent.clientTop){
        left+=el.offsetParent.clientLeft;
        top+=el.offsetParent.clientTop;
    }
    while(el=el.offsetParent){
        left+=el.offsetLeft;
        top+=el.offsetTop;
    }
    return{x:left,y:top};
};

SelectDw_scrollObj.stopScroll = function(wnId) {
  if ( SelectDw_scrollObjs[wnId] ) SelectDw_scrollObjs[wnId].endScroll();
  enable_scroll();
}

SelectDw_scrollObj.doubleSpeed = function(wnId) {
  if ( SelectDw_scrollObjs[wnId] ) SelectDw_scrollObjs[wnId].speed *= 2;
}

SelectDw_scrollObj.resetSpeed = function(wnId) {
  if ( SelectDw_scrollObjs[wnId] ) SelectDw_scrollObjs[wnId].speed /= 2;
}

SelectDw_scrollObj.initScroll = function(wnId, deg, sp) {
  if ( SelectDw_scrollObjs[wnId] ) {
    var cosine, sine;
    if (typeof deg == "string") {
      switch (deg) {
        case "up"    : deg = 90;  break;
        case "down"  : deg = 270; break;
        case "left"  : deg = 180; break;
        case "right" : deg = 0;   break;
        default: return;
       }
    }
    deg = deg % 360;
    if (deg % 90 == 0) {
      cosine = (deg == 0)? -1: (deg == 180)? 1: 0;
      sine = (deg == 90)? 1: (deg == 270)? -1: 0;
    } else {
      var angle = deg * Math.PI/180;
      cosine = -Math.cos(angle); sine = Math.sin(angle);
    }
    SelectDw_scrollObjs[wnId].fx = cosine / ( Math.abs(cosine) + Math.abs(sine) );
    SelectDw_scrollObjs[wnId].fy = sine / ( Math.abs(cosine) + Math.abs(sine) );
    SelectDw_scrollObjs[wnId].endX = (deg == 90 || deg == 270)? SelectDw_scrollObjs[wnId].x:
      (deg < 90 || deg > 270)? -SelectDw_scrollObjs[wnId].maxX: 0;
    SelectDw_scrollObjs[wnId].endY = (deg == 0 || deg == 180)? SelectDw_scrollObjs[wnId].y:
      (deg < 180)? 0: -SelectDw_scrollObjs[wnId].maxY;
    SelectDw_scrollObjs[wnId].startScroll(sp);
  }
}

SelectDw_scrollObj.prototype.startScroll = function(speed) {
  if (!this.ready) return; if (this.timerId) clearInterval(this.timerId);
  this.speed = speed || SelectDw_scrollObj.speed;
  this.lyr = document.getElementById(this.lyrId);
  this.lastTime = ( new Date() ).getTime();
  this.on_scroll_start();
  this.timerId = setInterval(this.animString + ".scroll()", 10);
}

SelectDw_scrollObj.prototype.scroll = function() {
  var now = ( new Date() ).getTime();
  var d = (now - this.lastTime)/1000 * this.speed;
  if (d > 0) {
    var x = this.x + this.fx * d; var y = this.y + this.fy * d;
    if (this.fx == 0 || this.fy == 0) {
      if ( ( this.fx == -1 && x > -this.maxX ) || ( this.fx == 1 && x < 0 ) ||
        ( this.fy == -1 && y > -this.maxY ) || ( this.fy == 1 && y < 0 ) ) {
        this.lastTime = now;
        this.shiftTo(this.lyr, x, y);
        this.on_scroll(x, y);
      } else {
        clearInterval(this.timerId); this.timerId = 0;
        this.shiftTo(this.lyr, this.endX, this.endY);
        this.on_scroll_end(this.endX, this.endY);
      }
    } else {
      if ( ( this.fx < 0 && x >= -this.maxX && this.fy < 0 && y >= -this.maxY ) ||
        ( this.fx > 0 && x <= 0 && this.fy > 0 && y <= 0 ) ||
        ( this.fx < 0 && x >= -this.maxX && this.fy > 0 && y <= 0 ) ||
        ( this.fx > 0 && x <= 0 && this.fy < 0 && y >= -this.maxY ) ) {
        this.lastTime = now;
        this.shiftTo(this.lyr, x, y);
        this.on_scroll(x, y);
      } else {
        clearInterval(this.timerId); this.timerId = 0;
        this.on_scroll_end(this.x, this.y);
      }
    }
  }
}

SelectDw_scrollObj.prototype.endScroll = function() {
  if (!this.ready) return;
  if (this.timerId) clearInterval(this.timerId);
  this.timerId = 0;  this.lyr = null;
}

SelectDw_scrollObj.prototype.on_scroll = function() {}
SelectDw_scrollObj.prototype.on_scroll_start = function() {}
SelectDw_scrollObj.prototype.on_scroll_end = function() {}

SelectDw_scrollObj.slideDur = 500;

SelectDw_scrollObj.scrollBy = function(wnId, x, y, dur) {
  if ( SelectDw_scrollObjs[wnId] ) SelectDw_scrollObjs[wnId].glideBy(x, y, dur);
}

SelectDw_scrollObj.scrollTo = function(wnId, x, y, dur) {
  if ( SelectDw_scrollObjs[wnId] ) SelectDw_scrollObjs[wnId].glideTo(x, y, dur);
}

SelectDw_scrollObj.prototype.glideBy = function(dx, dy, dur) {
  if ( !document.getElementById || this.sliding ) return;
  this.slideDur = dur || SelectDw_scrollObj.slideDur;
  this.destX = this.destY = this.distX = this.distY = 0;
  this.lyr = document.getElementById(this.lyrId);
  this.startX = this.x; this.startY = this.y;
  if (dy < 0) this.distY = (this.startY + dy >= -this.maxY)? dy: -(this.startY  + this.maxY);
  else if (dy > 0) this.distY = (this.startY + dy <= 0)? dy: -this.startY;
  if (dx < 0) this.distX = (this.startX + dx >= -this.maxX)? dx: -(this.startX + this.maxX);
  else if (dx > 0) this.distX = (this.startX + dx <= 0)? dx: -this.startX;
  this.destX = this.startX + this.distX; this.destY = this.startY + this.distY;
  this.slideTo(this.destX, this.destY);
}

SelectDw_scrollObj.prototype.glideTo = function(destX, destY, dur) {
    if ( !document.getElementById || this.sliding) return;
    this.slideDur = dur || SelectDw_scrollObj.slideDur;
    this.lyr = document.getElementById(this.lyrId);
    this.startX = this.x; this.startY = this.y;
    this.destX = -Math.max( Math.min(destX, this.maxX), 0);
    this.destY = -Math.max( Math.min(destY, this.maxY), 0);
    this.distY = this.destY - this.startY;
    this.distX =  this.destX - this.startX;
    this.slideTo(this.destX, this.destY);
}

SelectDw_scrollObj.prototype.slideTo = function(destX, destY) {
    this.per = Math.PI/(2 * this.slideDur); this.sliding = true;
    this.slideStart = (new Date()).getTime();
    this.aniTimer = setInterval(this.animString + ".doSlide()",10);
    this.on_slide_start(this.startX, this.startY);
}

SelectDw_scrollObj.prototype.doSlide = function() {
    var elapsed = (new Date()).getTime() - this.slideStart;
    if (elapsed < this.slideDur) {
        var x = this.startX + this.distX * Math.sin(this.per*elapsed);
        var y = this.startY + this.distY * Math.sin(this.per*elapsed);
        this.shiftTo(this.lyr, x, y); this.on_slide(x, y);
    } else {
        clearInterval(this.aniTimer); this.sliding = false;
        this.shiftTo(this.lyr, this.destX, this.destY);
        this.lyr = null; this.on_slide_end(this.destX, this.destY);
    }
}

SelectDw_scrollObj.prototype.on_slide_start = function() {}
SelectDw_scrollObj.prototype.on_slide = function() {}
SelectDw_scrollObj.prototype.on_slide_end = function() {}

var SelectDw_slidebar = {
  obj: null,
  slideDur: 500,
  init: function (bar, track, axis, x, y) {
    x = x || 0; y = y || 0;
    bar.style.left = x + "px"; bar.style.top = y + "px";
    bar.axis = axis; track.bar = bar;

    if (axis == "h") {
      bar.trkWd = track.offsetWidth;
      bar.maxX = bar.trkWd - bar.offsetWidth - x;
      bar.minX = x; bar.maxY = y; bar.minY = y;
    } else {
      bar.trkHt = track.offsetHeight;

      bar.maxY = bar.trkHt - bar.offsetHeight - y;
      bar.maxX = x; bar.minX = x; bar.minY = y;
    }
    bar.on_drag_start =  bar.on_drag =   bar.on_drag_end =
    bar.on_slide_start = bar.on_slide =  bar.on_slide_end = function() {}
    bar.onmousedown = this.startDrag; track.onmousedown = this.startSlide;
  },

  startSlide: function(e) {
    if ( SelectDw_slidebar.aniTimer ) clearInterval(SelectDw_slidebar.aniTimer);
    e = e? e: window.event;
    var bar = SelectDw_slidebar.obj = this.bar;
    e.offX = (typeof e.layerX != "undefined")? e.layerX: e.offsetX;
    e.offY = (typeof e.layerY != "undefined")? e.layerY: e.offsetY;
    bar.startX = parseInt(bar.style.left); bar.startY = parseInt(bar.style.top);
    if (bar.axis == "v") {
      bar.destX = bar.startX;
      bar.destY = (e.offY < bar.startY)? e.offY: e.offY - bar.offsetHeight;
      bar.destY = Math.min( Math.max(bar.destY, bar.minY), bar.maxY );
    } else {
      bar.destX = (e.offX < bar.startX)? e.offX: e.offX - bar.offsetWidth;
      bar.destX = Math.min( Math.max(bar.destX, bar.minX), bar.maxX );
      bar.destY = bar.startY;
    }
    bar.distX = bar.destX - bar.startX; bar.distY = bar.destY - bar.startY;
    SelectDw_slidebar.per = Math.PI/(2 * SelectDw_slidebar.slideDur);
    SelectDw_slidebar.slideStart = (new Date()).getTime();
    bar.on_slide_start(bar.startX, bar.startY);
    SelectDw_slidebar.aniTimer = setInterval("SelectDw_slidebar.doSlide()",10);
  },

  doSlide: function() {
    if ( !SelectDw_slidebar.obj ) { clearInterval(SelectDw_slidebar.aniTimer); return; }
    var bar = SelectDw_slidebar.obj;
    var elapsed = (new Date()).getTime() - this.slideStart;
    if (elapsed < this.slideDur) {
        var x = bar.startX + bar.distX * Math.sin(this.per*elapsed);
        var y = bar.startY + bar.distY * Math.sin(this.per*elapsed);
        bar.style.left = x + "px"; bar.style.top = y + "px";
        bar.on_slide(x, y);
    } else {
        clearInterval(this.aniTimer);
        bar.style.left = bar.destX + "px"; bar.style.top = bar.destY + "px";
        bar.on_slide_end(bar.destX, bar.destY);
        this.obj = null;
    }
  },

  startDrag: function (e) {
    e = SelectDw_event.DOMit(e);
    if ( SelectDw_slidebar.aniTimer ) clearInterval(SelectDw_slidebar.aniTimer);
    var bar = SelectDw_slidebar.obj = this;
    bar.downX = e.clientX; bar.downY = e.clientY;
    bar.startX = parseInt(bar.style.left);
    bar.startY = parseInt(bar.style.top);
    bar.on_drag_start(bar.startX, bar.startY);
    SelectDw_event.add( document, "mousemove", SelectDw_slidebar.doDrag, true );
    SelectDw_event.add( document, "mouseup",   SelectDw_slidebar.endDrag,  true );
    e.stopPropagation();
  },

  doDrag: function (e) {
    e = e? e: window.event;
    if (!SelectDw_slidebar.obj) return;
    var bar = SelectDw_slidebar.obj;
    var nx = bar.startX + e.clientX - bar.downX;
    var ny = bar.startY + e.clientY - bar.downY;
    nx = Math.min( Math.max( bar.minX, nx ), bar.maxX);
    ny = Math.min( Math.max( bar.minY, ny ), bar.maxY);
    bar.style.left = nx + "px"; bar.style.top  = ny + "px";
    bar.on_drag(nx,ny);
    return false;
  },

  endDrag: function () {
    SelectDw_event.remove( document, "mousemove", SelectDw_slidebar.doDrag, true );
    SelectDw_event.remove( document, "mouseup",   SelectDw_slidebar.endDrag,  true );
    if ( !SelectDw_slidebar.obj ) return;
    SelectDw_slidebar.obj.on_drag_end( parseInt(SelectDw_slidebar.obj.style.left), parseInt(SelectDw_slidebar.obj.style.top) );
    SelectDw_slidebar.obj = null;
  }

}

SelectDw_scrollObj.prototype.setUpScrollbar = function(id, trkId, axis, offx, offy) {

	//consolelog("----------------------------");
	//consolelog(document.getElementById(id));
	//consolelog( document.getElementById(trkId));
  var bar = document.getElementById(id);
  var trk = document.getElementById(trkId);

	//$(trk).height(90);

	//consolelog(bar);
	//consolelog( trk, trk.offsetHeight);

  SelectDw_slidebar.init(bar, trk, axis, offx, offy);
  bar.wn = SelectDw_scrollObjs[this.id];
  if (axis == "v") this.vBarId = id; else this.hBarId = id;
  bar.on_drag_start = bar.on_slide_start = SelectDw_scrollObj.getWndoLyrRef;
  bar.on_drag_end =   bar.on_slide_end =   SelectDw_scrollObj.tossWndoLyrRef;
  bar.on_drag =       bar.on_slide =       SelectDw_scrollObj.UpdateWndoLyrPos;
}

SelectDw_scrollObj.getWndoLyrRef = function()  { this.wnLyr = document.getElementById(this.wn.lyrId); }
SelectDw_scrollObj.tossWndoLyrRef = function() { this.wnLyr = null; }
SelectDw_scrollObj.UpdateWndoLyrPos = function(x, y) {
  var nx, ny;
  if (this.axis == "v") {
    nx = this.wn.x;
    ny = -(y - this.minY) * ( this.wn.maxY / (this.maxY - this.minY) ) || 0;
  } else {
    ny = this.wn.y;
    nx = -(x - this.minX) * ( this.wn.maxX / (this.maxX - this.minX) ) || 0;
  }
  this.wn.shiftTo(this.wnLyr, nx, ny);
}

SelectDw_scrollObj.prototype.updateScrollbar = function(x, y) {
  var nx, ny;
  if ( this.vBarId ) {
    if (!this.maxY) return;
    ny = -( y * ( (this.vbar.maxY - this.vbar.minY) / this.maxY ) - this.vbar.minY );
    ny = Math.min( Math.max(ny, this.vbar.minY), this.vbar.maxY);
    nx = parseInt(this.vbar.style.left);
    this.vbar.style.left = nx + "px"; this.vbar.style.top = ny + "px";
  } if ( this.hBarId ) {
    if (!this.maxX) return;
    nx = -( x * ( (this.hbar.maxX - this.hbar.minX) / this.maxX ) - this.hbar.minX );
    nx = Math.min( Math.max(nx, this.hbar.minX), this.hbar.maxX);
    ny = parseInt(this.hbar.style.top);
    this.hbar.style.left = nx + "px"; this.hbar.style.top = ny + "px";
  }

}

SelectDw_scrollObj.prototype.restoreScrollbars = function() {
  var bar;
  if (this.vBarId) {
    bar = document.getElementById(this.vBarId);
    bar.style.left = bar.minX + "px"; bar.style.top = bar.minY + "px";
  }
  if (this.hBarId) {
    bar = document.getElementById(this.hBarId);
    bar.style.left = bar.minX + "px"; bar.style.top = bar.minY + "px";
  }
}

var _trackHeights = [];
SelectDw_scrollObj.prototype.setBarSize = function($no) {

  var bar;
  var lyr = document.getElementById(this.lyrId);
  var wn = document.getElementById(this.id);
  if (this.vBarId) {
    bar = document.getElementById(this.vBarId);

	//consolelog( $("#"+this.vBarId).length );
	//$(this.vBarId).attr({"idx":$no});

	////consolelog(this.lyrId, this.id , this.vBarId, bar.trkHt, this.id );

	//_trackHeights[$no] = bar.trkHt;
    bar.style.height = (lyr.offsetHeight > wn.offsetHeight)? bar.trkHt / ( lyr.offsetHeight / wn.offsetHeight ) + "px": bar.trkHt - 2*bar.minY + "px";
    bar.maxY = bar.trkHt - bar.offsetHeight - bar.minY;
  }
  if (this.hBarId) {
    bar = document.getElementById(this.hBarId);
    bar.style.width = (this.wd > wn.offsetWidth)? bar.trkWd / ( this.wd / wn.offsetWidth ) + "px": bar.trkWd - 2*bar.minX + "px";
    bar.maxX = bar.trkWd - bar.offsetWidth - bar.minX;
  }
}

SelectDw_scrollObj.prototype.on_load = function() {
  this.restoreScrollbars();
}

SelectDw_scrollObj.prototype.on_scroll = SelectDw_scrollObj.prototype.on_slide = function(x,y) { this.updateScrollbar(x,y); }

SelectDw_scrollObj.prototype.on_scroll_start = SelectDw_scrollObj.prototype.on_slide_start = function() {
  if ( this.vBarId ) this.vbar = document.getElementById(this.vBarId);
  if ( this.hBarId ) this.hbar = document.getElementById(this.hBarId);
}

SelectDw_scrollObj.prototype.on_scroll_end = SelectDw_scrollObj.prototype.on_slide_end = function(x, y) {
  this.updateScrollbar(x,y);
  this.lyr = null; this.bar = null;
}

var SelectDw_event = {

  add: function(obj, etype, fp, cap) {
    cap = cap || false;
    if (obj.addEventListener) obj.addEventListener(etype, fp, cap);
    else if (obj.attachEvent) obj.attachEvent("on" + etype, fp);
  },

  remove: function(obj, etype, fp, cap) {
    cap = cap || false;
    if (obj.removeEventListener) obj.removeEventListener(etype, fp, cap);
    else if (obj.detachEvent) obj.detachEvent("on" + etype, fp);
  },

  DOMit: function(e) {
    e = e? e: window.event;
    e.tgt = e.srcElement? e.srcElement: e.target;

    if (!e.preventDefault) e.preventDefault = function () { return false; }
    if (!e.stopPropagation) e.stopPropagation = function () { if (window.event) window.event.cancelBubble = true; }

    return e;
  }

}