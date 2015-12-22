function show(str)
{
	document.getElementById(str).style.display = "block";
}

function hide(str)
{
	document.getElementById(str).style.display = "none";
}

/** 주메뉴*/
var onflag = "_on.";
var selMenu1;
function top2menuView(a) //2차메뉴보기
{
	if(this.id) {
		eidStr = this.id;
		eidNum=eidStr.substring(eidStr.lastIndexOf("m",eidStr.length)+1,eidStr.length);
		a = parseInt(eidNum);
	}
	top2menuHideAll();
	top1Menu = document.getElementById("top1m"+a);
	top2Menu = document.getElementById("top2m"+a);
	ann = (a<10)? "0"+a : ""+a;
	if(a!=0){ //메인은2차메뉴활성화안함
		if (top1Menu){ top1Menu.parentNode.className="on";
			var imgEl= top1Menu.childNodes[0];
			if(imgEl.src){
				_imgtype = imgEl.src.substr(imgEl.src.length-3,imgEl.src.length-1);
				var where = imgEl.src.indexOf("_on"+_imgtype,0);
				//if(where==-1) imgEl.src = imgEl.src.replace("."+_imgtype,selMenu1+onflag+_imgtype);
				//alert("selMenu1 : " + selMenu1);
				//alert("a : " + a);
				if(where==-1) imgEl.src = imgEl.src.replace("."+_imgtype,onflag+_imgtype);
 
			}
			if (top2Menu) { top2Menu.style.display = "inline"; }
		}
	}
}
 
function top2menuHide(a) //2차메뉴감추기
{
	if(this.id){
		eidStr = this.id;
		eidNum=eidStr.substring(eidStr.lastIndexOf("m",eidStr.length)+1,eidStr.length);
		a = parseInt(eidNum);
	}
	//top2menuHideAll();
	top1Menu = document.getElementById("top1m"+a);
	top2Menu = document.getElementById("top2m"+a);
	top1MenuCurr = document.getElementById("top1m"+d1n);
	top2MenuCurr = document.getElementById("top2m"+d1n);
	ann = (a<10)? "0"+a : ""+a;
	if (top1Menu) { 	
		top1Menu.parentNode.className=""	;
		var imgEl= top1Menu.childNodes[0]
		if(imgEl.src){
			_imgtype = imgEl.src.substr(imgEl.src.length-3,imgEl.src.length-1);
			//var where = imgEl.src.indexOf(selMenu1+onflag+_imgtype,0);
			var where = imgEl.src.indexOf(onflag+_imgtype,0);
			//if(where!=-1) imgEl.src = imgEl.src.replace(selMenu1+onflag+_imgtype,"."+_imgtype);
			if(where!=-1) imgEl.src = imgEl.src.replace(onflag+_imgtype,"."+_imgtype);
		}
		if(top2Menu){
			top2Menu.style.display = "none";
		}
		if(top1MenuCurr){ top1MenuCurr.parentNode.className="on";
			var imgEl= top1MenuCurr.childNodes[0]
			if(imgEl.src){
				_imgtype = imgEl.src.substr(imgEl.src.length-3,imgEl.src.length-1);
				//var where = imgEl.src.indexOf(selMenu1+onflag+_imgtype,0);
				var where = imgEl.src.indexOf(onflag+_imgtype,0);
				//if(where==-1) imgEl.src = imgEl.src.replace("."+_imgtype,selMenu1+onflag+_imgtype);
				if(where==-1) imgEl.src = imgEl.src.replace("."+_imgtype,onflag+_imgtype);
			}
		}
		if (top2MenuCurr) { top2MenuCurr.style.display = "inline"; }
	}
}
 
function top2menuHideAll() //2차메뉴모두감추기
{
	top1menuEl = document.getElementById("top1menu").childNodes;
	for (i=1;i<=11;i++)//메뉴삭제시 1차메뉴수가 안맞아 top1menuEl.length 대신 숫자로 넣음
	{
		top1Menu = document.getElementById("top1m"+i);
		top2Menu = document.getElementById("top2m"+i);
		inn = (i<10)? "0"+i : ""+i;
		if(top1Menu) { 
			top1Menu.parentNode.className="";
			var imgEl= top1Menu.childNodes[0]
			if(imgEl.src){
				_imgtype = imgEl.src.substr(imgEl.src.length-3,imgEl.src.length-1);
				//var where = imgEl.src.indexOf(selMenu1+onflag+_imgtype,0);
				var where = imgEl.src.indexOf(onflag+_imgtype,0);
				//if(where!=-1) imgEl.src = imgEl.src.replace(selMenu1+onflag+_imgtype,"."+_imgtype);
				if(where!=-1) imgEl.src = imgEl.src.replace(onflag+_imgtype,"."+_imgtype);
			}
			if (top2Menu) { top2Menu.style.display = "none"; }
		}
	}
}
 
function initTopMenu(d1,d2) {//1,2차메뉴초기화,마우스키보드이벤트할당
	d1n=d1;
	d2n=d2;
 	top1menuEl = document.getElementById("top1menu").childNodes;
	
		
	for (i=1;i<=7;i++)//메뉴삭제시 1차메뉴수가 안맞아 top1menuEl.length 대신 숫자로 넣음
	{
		top1Menu = document.getElementById("top1m"+i);
		top2Menu = document.getElementById("top2m"+i);
		if (top1Menu == null)
			break;
		if (top1Menu) {
			//var spanEl = document.createElement("span");//이미지대치기법용
			//top1Menu.insertBefore(spanEl,top1Menu.childNodes[0]);
			inn = (i<10)? "0"+i : ""+i;
			if(top1Menu.firstChild.tagName != "IMG") {//이미지가아니면
				top1Menu.innerHTML = '<img src="/images/menu'+inn+'.gif" alt="'+top1Menu.innerHTML+'" />';//이미지요소로대체
			}
			top1Menu.style.textIndent = "0";//스타일 원상태 복구.
			top1Menu.onmouseover = top1Menu.onfocus = top2menuView;
			top1Menu.onmouseout = top2menuHide;//onblur이벤트 제거 : IE에서 2차메뉴선택할 수 없어서..
			if (top2Menu) {
				top2Menu.style.display = "none";
				var top2MenuLastChild = top2Menu.lastChild;//끝li
				if(top2MenuLastChild){
					while(top2MenuLastChild.nodeName!="LI") top2MenuLastChild = top2MenuLastChild.previousSibling;
					top2MenuLastChild.className = "last";
				}
				var top2MenuFirstChild = top2Menu.firstChild;//첫li
				if(top2MenuFirstChild){
					while(top2MenuFirstChild.nodeName!="LI") top2MenuFirstChild = top2MenuFirstChild.nextSibling;
					top2MenuFirstChild.className = "first";
				}
				top2Menu.onmouseover = top2Menu.onfocus = top2menuView;
				top2Menu.onmouseout = top2Menu.onblur = top2menuHide;
				top2MenuAs = top2Menu.getElementsByTagName("a");
				if(top2MenuAs){
					for(var j=0;j<top2MenuAs.length;j++)
					{
						top2MenuAs[j].innerHTML = '<span>'+top2MenuAs[j].innerHTML+'</span>';//디자인용
					}
				}
			}
		}
	}
	//2차메뉴활성
	top2MenuCurrAct = document.getElementById("top2m"+d1+"m"+d2);
	if (top2MenuCurrAct) { top2MenuCurrAct.getElementsByTagName("a")[0].className="on2"; }
	top2menuHide(d1);//메뉴활성초기화
}