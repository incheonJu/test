
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>PradiseCasino Administrator</title>
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">

<link href="/resources/kor/css/admin/admin.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/kor/css/ui/jquery.ui.all.css" />
<script type="text/javascript" src="/resources/kor/js/jquery-1.8.2.min.js"></script>
</head>
<body>

<script type="text/javascript">
//alert("준비중입니다.");
//window.close();
</script>

<div class="content">
	<h1 style="font-size:20px;padding:10px 0 0 10px;">사진 올리기</h1>
	<table width="100%" cellpadding="0" cellspacing="0" border="0" class="mt10 entry_table">
	<form name="myform" method="POST" enctype="multipart/form-data" accept-charset="utf-8" action="/common/editorImageUploadProc.do" onSubmit="return myformSubmit();return false;">
	<tr>
		<td>이미지 파일 선택</td>
		<td><input id="attach1" name="attach1" type="file" style="width:100%;"/></td>
	</tr>
	</table>

	<div style="padding-top:10px;margin:0 auto;text-align:center;">
		<input type="submit" value="사진 올리기"/>
		<input type="button" value="창닫기" onclick="window.close();"/>
	</div>	
	</form>	
</div>
<script type="text/javascript">
function myformSubmit(){
	if ($("#attach1").val()==""){
		alert("이미지  파일을 선택해 주세요.");
		return false;
	}
}
</script>
</body></html>