/**
 * @use 媛꾨떒 �ы넗 �낅줈�쒖슜�쇰줈 �쒖옉�섏뿀�듬땲��
 * @author cielo
 * @See nhn.husky.SE2M_Configuration 
 * @ �앹뾽 留덊겕�낆� SimplePhotoUpload.html怨�SimplePhotoUpload_html5.html���덉뒿�덈떎. 
 */

nhn.husky.SE2M_AttachQuickPhoto = jindo.$Class({		
	name : "SE2M_AttachQuickPhoto",

	$init : function(){},
	
	$ON_MSG_APP_READY : function(){
		this.oApp.exec("REGISTER_UI_EVENT", ["photo_attach", "click", "ATTACHPHOTO_OPEN_WINDOW"]);
	},
	
	$LOCAL_BEFORE_FIRST : function(sMsg){
		if(!!this.oPopupMgr){ return; }
		// Popup Manager�먯꽌 �ъ슜��param
		this.htPopupOption = {
			oApp : this.oApp,
			sName : this.name,
			bScroll : false,
			sProperties : "",
			sUrl : ""
		};
		this.oPopupMgr = nhn.husky.PopUpManager.getInstance(this.oApp);
	},
	
	/**
	 * �ы넗 �뱁깙 �ㅽ뵂
	 */
	$ON_ATTACHPHOTO_OPEN_WINDOW : function(){			
		this.htPopupOption.sUrl = this.makePopupURL();
		this.htPopupOption.sProperties = "left=0,top=0,width=600,height=150,scrollbars=no,location=no,status=0,resizable=no";

		this.oPopupWindow = this.oPopupMgr.openWindow(this.htPopupOption);
		
		// 泥섏쓬 濡쒕뵫�섍퀬 IE�먯꽌 而ㅼ꽌媛��꾪� �녿뒗 寃쎌슦
		// 蹂듭닔 �낅줈�쒖떆���쒖꽌媛�諛붾�	
		this.oApp.exec('FOCUS');
		return (!!this.oPopupWindow ? true : false);
	},
	
	/**
	 * �쒕퉬�ㅻ퀎濡��앹뾽�� parameter瑜�異붽��섏뿬 URL���앹꽦�섎뒗 �⑥닔	 
	 * nhn.husky.SE2M_AttachQuickPhoto.prototype.makePopupURL濡���뼱�⑥꽌 �ъ슜�섏떆硫���
	 */
	makePopupURL : function(){
		var sPopupUrl = "/mgmt/travel/editor/editorImageUpload.do";
		
		return sPopupUrl;
	},
	
	/**
	 * �앹뾽�먯꽌 �몄텧�섎뒗 硫붿꽭吏�
	 */
	$ON_SET_PHOTO : function(aPhotoData){
		var sContents, 
			aPhotoInfo,
			htData;
		
		if( !aPhotoData ){ 
			return; 
		}
		
		try{
			sContents = "";
			for(var i = 0; i <aPhotoData.length; i++){				
				htData = aPhotoData[i];
				
				if(!htData.sAlign){
					htData.sAlign = "";
				}
				
				aPhotoInfo = {
				    sName : htData.sFileName || "",
				    sOriginalImageURL : htData.sFileURL,
					bNewLine : htData.bNewLine || false 
				};
				
				sContents += this._getPhotoTag(aPhotoInfo);
			}

			this.oApp.exec("PASTE_HTML", [sContents]); // �꾩쫹 泥⑤� �뚯씪 遺�텇 �뺤씤
		}catch(e){
			// upload��error諛쒖깮����빐��skip��
			return false;
		}
	},

	/**
	 * @use �쇰컲 �ы넗 tag �앹꽦
	 */
	_getPhotoTag : function(htPhotoInfo){
		// id��class���몃꽕�쇨낵 �곌���留롮뒿�덈떎. �섏젙���몃꽕���곸뿭��Test
		var sTag = '<img src="{=sOriginalImageURL}" title="{=sName}" >';
		if(htPhotoInfo.bNewLine){
			sTag += '<br style="clear:both;">';
		}
		sTag = jindo.$Template(sTag).process(htPhotoInfo);
		
		return sTag;
	}
});