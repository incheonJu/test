<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<title>금호폴리켐 관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- CSS -->
<link type="text/css" rel="stylesheet" href="/resources/css/admin/admin_default.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />

<!-- js Library -->
<script type="text/javascript" src="/resources/js/common/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/resources/js/common/common.js"></script>
<script type="text/javascript" src="/resources/js/common/event_bind.js"></script>
<script type="text/javascript" src="/resources/js/common/smarteditor/se2.3/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="/resources/js/common/jquery.autogrowtextarea.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script>
    var message = "${message}";
    if (message != ""){
        if(message == "Bad credentials"){
            common.commonModule.openAlert("로그인 실패! 아이디 혹은 패스워드를 확인하세요!");
        } else {
            common.commonModule.openAlert(message);
        }
    }
</script>
<% request.getSession().setAttribute("message", ""); %>
