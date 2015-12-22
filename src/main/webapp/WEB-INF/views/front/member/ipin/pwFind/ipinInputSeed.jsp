<%
/**************************************************************************************************************************
* Program Name  : SIREN24 ������ ���� ��û ������ Sample (JSP)
* File Name     : ipin_input_seed.jsp
* Comment       : 
* History       : 
*
**************************************************************************************************************************/
%>

<%
    response.setHeader("Pragma", "no-cache" );
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-store");
    response.setHeader("Cache-Control", "no-cache" );
%>
<%@ page import ="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%

	java.util.Random ran = new Random();
	//���� ���� ����
	int numLength = 16;
	String randomStr = "";

	for (int i = 0; i < numLength; i++) {
		//0 ~ 9 ���� ���� ����
		randomStr += ran.nextInt(10);
	}

	String reqNum = randomStr;

	Cookie c = new Cookie("reqNum", reqNum);
	c.setMaxAge(1800);  // <==�ʴ����� �����˴ϴ�.
	response.addCookie(c);	
%>
<html>
    <head>
        <title>������ ���� Sample ȭ��</title>
        <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
        <style>
            <!--
            body,p,ol,ul,td
            {
                font-family: ����;
                font-size: 12px;
            }

            a:link { size:9px;color:#000000;text-decoration: none; line-height: 12px}
            a:visited { size:9px;color:#555555;text-decoration: none; line-height: 12px}
            a:hover { color:#ff9900;text-decoration: none; line-height: 12px}

            .style1 {
                color: #6b902a;
                font-weight: bold;
            }
            .style2 {
                color: #666666
            }
            .style3 {
                color: #3b5d00;
                font-weight: bold;
            }
            -->
        </style>
    </head>
		<body bgcolor="#FFFFFF" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>

		<center>
		<br/><br/><br/><br/><br/><br/>
		<span class="style1">������ ���� ��ûȭ�� Sample�Դϴ�.</span><br/>

		<form name="reqCBAForm" method="post" action="ipinRequestSeed.jsp">
		
                <table cellpadding=1 cellspacing=1>
                    <tr>
                        <td align=center>ȸ���� ID</td>
                        <td align=left><input type="text" name="id" size='41' maxlength ='8' value="QHT002"></td>
                    </tr>
                    <tr>
                        <td align=center>��û��ȣ</td>
                        <td align=left><input type="text" name="reqNum" size='41' maxlength ='30' value='<%=reqNum%>'></td>
                    </tr>
                    <tr>
                        <td align=center>�������URL</td> <!-- ������� URL(23http:// ������ �ּ�) -->
								  	     				  <!-- 23http:// �� ��� - ���� �����ӿ��� ��� �����ϴ� ���
															   24http:// �� ��� - �θ�â���� ��� �����ϴ� ��� -->
                        <td align=left><input type="text" name="retUrl" size='41' maxlength ='6' value="23http://localhost:8080/member/ipinPopupSeed.jsp"></td>
                    </tr>																		
                    <tr>
                        <td align=center>���񽺹�ȣ</td>  
                        <td><input type="text" name="srvNo" size='41' maxlength ='6' value="002001"></td>
                    </tr>
				</table> <br/><br/>
	    
					<input type="submit" value="�����ɼ��� ��û" >
					
					                                                  
				
		</form>


		<br/>
		<br/>
			<table width="450" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td width="130"><a href=http://www.siren24.com/v2alimi/comm/jsp/v2alimiAuth.jsp?id=SIR005&svc_seq=01 target=blank><img src="http://ntest.siren24.com/name/images/logo01.gif" width="122" height="41" border="0" alt="�ΰ�"></a></td>
				<td width="320"><span class="style2">�� ����Ʈ�� ����ſ�������(��)�� <span class="style3">���ǵ����������</span> �������Ʈ �Դϴ�. Ÿ���� ���Ǹ� �����Ͻ� ��� ���ù��ɿ� ���� ó�� ������ �� �ֽ��ϴ�.</span></td>
			  </tr>
			</table>
			  <br/>
			  <br/>
			<br/>
		  �� Sampleȭ���� i-PIN ���� ��ûȭ�� ���߽� ���� �ǵ��� �����ϰ� �ִ� ȭ���Դϴ�.<br/>
		  <br/>
		</center>

		</BODY>
		</HTML>