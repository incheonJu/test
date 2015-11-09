<!--#include virtual="/common/PWF_FUNCTION.asp"--> 
<!-- #include virtual="/common/fileupload/freeaspupload.asp" -->
<%
Dim Upload, fileName, fileSize, ks, fileKey, uploadsDirVar, uploadsUrl
Dim arrReturnValue(1)

'스마트에디터2 - 이미지 파일 업로드 임시 폴더
uploadsDirVar = UPLOAD_IMAGE_FILE_PHYSICAL_TEMP_FOLDER
uploadsUrl = UPLOAD_IMAGE_FILE_LOGICAL_TEMP_FOLDER

Set Upload = New FreeASPUpload

'이미지 파일인지 체크
fileExeType = getFileNameSplit(Upload.getRequestFileName(0,""),1) 
Select Case(fileExeType)
	Case "jpg", "png", "gif", "bmp", "jpeg"
	Case Else :
		createSession "msg","이미지파일을 선택해 주세요.(예:jpg, png, gif, bmp)"
		Response.redirect "/common/smartEditor2/photo_uploader/popup/photo_uploader.asp"
		Response.End 
End Select 



Dim saveLocalFileName
saveLocalFileName = getRndFileName(Upload.getRequestFileName(0,""),"temp") '"test.jpg"

'Upload.Save(uploadsDirVar)
Upload.SaveOne uploadsDirVar, 0,,,saveLocalFileName

If Err.Number<>0 then 
	%>
	<script type="text/javascript">
	opener.parent.pasteHtmlMsg("네트워크에 문제가 생겨 이미지 업로드가 실패하였습니다.");
	window.close();
	</script>
	<%
Else 
		
	Dim originalFileName,fileLength,fileStart,fileContentType
	originalFileName = Upload.UploadedFiles("attach1").FileName
	fileLength = Upload.UploadedFiles("attach1").Length
	fileStart = Upload.UploadedFiles("attach1").Start
	fileContentType = Upload.UploadedFiles("attach1").ContentType

	Dim altText
	altText = Upload.Form("altText")
	
	%>
	<!-- #include virtual="/layout/proc/top.asp" -->
	<img />
	<script type="text/javascript">
	var uploadPath = "<%=uploadsUrl%><%=saveLocalFileName%>";
	var altString = "<%=altText%>"; //이미지 alt 값 부분

	var getImageSize = function(callback){
		$('<img>').attr({
			'src':uploadPath
		}).on('load',function(){
			if (typeof callback==="function"){
				callback($(this).width(), $(this).height());
			}
		}).appendTo('body');
	
	};
	getImageSize(function(imgWidth,imgHeight){
	
		opener.parent.pasteHTML("<img src='"+uploadPath+"' alt='"+altString+"' width='"+imgWidth+"px' height='"+imgHeight+"px'/>");
		opener.parent.addUploadImageFile("uploadImageFile",'<%=altText%>','<%=fileContentType%>','<%=originalFileName%>','<%=saveLocalFileName%>','<%=fileLength%>',imgWidth,imgHeight);
		window.close();

	});
	
	$(document).ready(function(){
		getImageSize();
	});
	</script>
	<!-- #include virtual="/layout/proc/bottom.asp" -->
	<%
End If 
%>

