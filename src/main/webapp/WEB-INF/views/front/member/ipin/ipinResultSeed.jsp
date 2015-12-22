<%
/**************************************************************************************************************************
* Program Name  : ������ ���� Sample JSP [test]
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
    // ���� -------------------------------------------------------------------------------------------------------------
	String retInfo      = "";       
	String encPara      = "";
	String decPara      = "";

    String encMsg       = "";                                                        // HMAC �޼���

    String reqNum       = "";                                                        // ��û��ȣ(��ȣȭ)
    String vDiscrNo     = "";                                                        // ����ĺ���ȣ
    String name         = "";                                                        // ����
    String result       = "";                                                        // ����� (1�ΰ�쿡�� ����)
	String age          = "";
    String sex          = "";
	String ip           = "";
    String authInfo     = "";														 // �߱޼�������	
    String birth        = "";
    String fgn          = "";                                                        // �ܱ��α���
	String discrHash    = "";                                                        // �ߺ�����Ȯ������
	String ciVersion	= "";														 // �������� ����
	String ciscrHash    = "";                                                        // ��������

	String msgChk       = "N";                                                    // ����/���� ���� ���

    //-----------------------------------------------------------------------------------------------------------------

    try{


		//��Ű�� ���� ����
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

        // Parameter ���� --------------------------------------------------------------------
        retInfo  = request.getParameter("retInfo").trim();
       // ----------------------------------------------------------------------------------


        // 1. ��ȣȭ ��� (jar) Loading
        com.sci.v2.ipin.secu.SciSecuManager sciSecuMg = new com.sci.v2.ipin.secu.SciSecuManager();

        retInfo  = sciSecuMg.getDec(retInfo, tranjectionReqNum);

        StringBuffer retInfoTemp    = new StringBuffer("");

        // 2.1�� �Ľ�---------------------------------------------------------------
        int inf1 = retInfo.indexOf("/",0);
        int inf2 = retInfo.indexOf("/",inf1+1);

		encPara  = retInfo.substring(0,inf1);         //��ȣȭ�� ���� �Ķ����
        encMsg   = retInfo.substring(inf1+1,inf2);    //��ȣȭ�� ���� �Ķ������ Hash��

        // 3.��/���� ���� ---------------------------------------------------------------
        if(sciSecuMg.getMsg(encPara).equals(encMsg)){
            msgChk="Y";
        }

		if(msgChk.equals("N")){
        %>
		    <script language=javascript>
            alert("���������� �����Դϴ�.!!");
            self.close();
		    </script>
		<%
			return;
		}

        // 4.�Ķ���ͺ� �� �������� ---------------------------------------------------------------
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
		
		discrHash  = sciSecuMg.getDec(discrHash, tranjectionReqNum); //�ߺ�����Ȯ�������� �ѹ��� ��ȣȭ
		//ciscrHash  = sciSecuMg.getDec(ciscrHash, tranjectionReqNum); //���������� �ѹ��� ��ȣȭ
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