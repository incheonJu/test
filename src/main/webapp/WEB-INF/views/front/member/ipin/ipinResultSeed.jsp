<%
/**************************************************************************************************************************
* Program Name  : 아이핀 서비스 Sample JSP [test]
* File Name     : ipin_result_seed.jsp
* Comment       : 
* History       : 
*
**************************************************************************************************************************/
%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%
    response.setHeader("Pragma", "no-cache" );
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-store");
    response.setHeader("Cache-Control", "no-cache" );
%>
<%
    // 변수 -------------------------------------------------------------------------------------------------------------
	String retInfo      = "";       
	String encPara      = "";
	String decPara      = "";

    String encMsg       = "";                                                        // HMAC 메세지

    String reqNum       = "";                                                        // 요청번호(복호화)
    String vDiscrNo     = "";                                                        // 가상식별번호
    String name         = "";                                                        // 성명
    String result       = "";                                                        // 결과값 (1인경우에만 정상)
	String age          = "";
    String sex          = "";
	String ip           = "";
    String authInfo     = "";														 // 발급수단정보	
    String birth        = "";
    String fgn          = "";                                                        // 외국인구분
	String discrHash    = "";                                                        // 중복가입확인정보
	String ciVersion	= "";														 // 연계정보 버젼
	String ciscrHash    = "";                                                        // 연계정보

	String msgChk       = "N";                                                    // 위조/변조 검증 결과

    //-----------------------------------------------------------------------------------------------------------------

    try{


		//쿠키값 가져 오기
		Cookie[] cookies = request.getCookies();
		String tranjectionName = "";
		String tranjectionReqNum = "";
		if(cookies!=null){
			for (int i = 0; i < cookies.length; i++){
				Cookie c = cookies[i];
				tranjectionName = c.getName();
				tranjectionReqNum = c.getValue();
				if(tranjectionName.compareTo("reqNum")==0) break;
				
				tranjectionReqNum = "";
			}
		}

        // Parameter 수신 --------------------------------------------------------------------
        retInfo  = request.getParameter("retInfo").trim();
       // ----------------------------------------------------------------------------------


        // 1. 암호화 모듈 (jar) Loading
        com.sci.v2.ipin.secu.SciSecuManager sciSecuMg = new com.sci.v2.ipin.secu.SciSecuManager();

        retInfo  = sciSecuMg.getDec(retInfo, tranjectionReqNum);

        StringBuffer retInfoTemp    = new StringBuffer("");

        // 2.1차 파싱---------------------------------------------------------------
        int inf1 = retInfo.indexOf("/",0);
        int inf2 = retInfo.indexOf("/",inf1+1);

		encPara  = retInfo.substring(0,inf1);         //암호화된 통합 파라미터
        encMsg   = retInfo.substring(inf1+1,inf2);    //암호화된 통합 파라미터의 Hash값

        // 3.위/변조 검증 ---------------------------------------------------------------
        if(sciSecuMg.getMsg(encPara).equals(encMsg)){
            msgChk="Y";
        }

		if(msgChk.equals("N")){
        %>
		    <script language=javascript>
            alert("비정상적인 접근입니다.!!");
            self.close();
		    </script>
		<%
			return;
		}

        // 4.파라미터별 값 가져오기 ---------------------------------------------------------------
        decPara  = sciSecuMg.getDec(encPara, tranjectionReqNum);
        
        //out.println(decPara);

		int info1 = decPara.indexOf("/",0);
        int info2 = decPara.indexOf("/",info1+1);
        int info3 = decPara.indexOf("/",info2+1);
        int info4 = decPara.indexOf("/",info3+1);
    	int info5 = decPara.indexOf("/",info4+1);
        int info6 = decPara.indexOf("/",info5+1);
        int info7 = decPara.indexOf("/",info6+1);
        int info8 = decPara.indexOf("/",info7+1);
        int info9 = decPara.indexOf("/",info8+1);
        int info10 = decPara.indexOf("/",info9+1);
        int info11 = decPara.indexOf("/",info10+1);
        int info12 = decPara.indexOf("/",info11+1);
        int info13 = decPara.indexOf("/",info12+1);

		reqNum     = decPara.substring(0,info1);
        vDiscrNo   = decPara.substring(info1+1,info2);
        name       = decPara.substring(info2+1,info3);
        result     = decPara.substring(info3+1,info4);
        age        = decPara.substring(info4+1,info5);
        sex        = decPara.substring(info5+1,info6);
        ip         = decPara.substring(info6+1,info7);
        authInfo   = decPara.substring(info7+1,info8);
        birth      = decPara.substring(info8+1,info9);
        fgn        = decPara.substring(info9+1,info10);
        discrHash  = decPara.substring(info10+1,info11);
        //ciVersion  = decPara.substring(info11+1,info12);
		//ciscrHash  = decPara.substring(info12+1,info13);	
		
		discrHash  = sciSecuMg.getDec(discrHash, tranjectionReqNum); //중복가입확인정보는 한번더 복호화
		//ciscrHash  = sciSecuMg.getDec(ciscrHash, tranjectionReqNum); //연계정보는 한번더 복호화
		%>
		
 <form name="reqCBAForm" method="post" action="${pageContext.request.contextPath}/user/Member/member_join_step02">  
		    <input type="hidden" name="certificationKey"     value = "<%=discrHash%>">
		    <input type="hidden" name="name"      value = "<%=name%>">
		</form>
		
<script language=javascript>  
<!--
	document.reqCBAForm.name.value = encodeURI(document.reqCBAForm.name.value);
	document.reqCBAForm.certificationKey.value = encodeURI(document.reqCBAForm.certificationKey.value);
	document.reqCBAForm.submit();

//-->
</script>
        <%
        // ----------------------------------------------------------------------------------

    }catch(Exception ex){
          out.println("[IPIN] Receive Test Error -"+ex.getMessage());
    }
%>