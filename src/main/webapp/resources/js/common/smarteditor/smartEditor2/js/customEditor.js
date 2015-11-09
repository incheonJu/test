

//업로드 이미지 파일 정보 받기
function addUploadImageFile(attachId,altVal,FileType,FileName,SaveFileName,FileLen,ImageWidth,ImageHeight)
{
	
	//alert(attachId+"_|_"+FileName+"_|_"+SaveFileName+"_|_"+FileLen+"_|_"+ImageWidth+"_|_"+ImageHeight);
	//var f=document.getElementById("writeForm");
	var fileInfo = "new_|_"+altVal+"_|_"+FileType+"_|_"+FileName+"_|_"+SaveFileName+"_|_"+FileLen+"_|_"+ImageWidth+"_|_"+ImageHeight;
	//attachId = "AttachFile";

	var f=document.getElementById(attachId);
	var opt = document.createElement("option");
	opt.text=FileName+' ('+FileLen+'byte)';	//보여질 option 텍스트내용
	opt.value=fileInfo;											// 첨부파일정보
	/*
	opt.value=FileName;										// 첨부파일이름
	opt.FileType=FileType;									// 첨부파일타입 : attach, image
	opt.SaveFileName=SaveFileName;			// 저장첨부파일이름
	opt.FileLen=FileLen;										// 첨부파일용량
	opt.ImageWidth=ImageWidth;					// 이미지일경우 가로사이즈 : 아닐경우 0
	opt.ImageHeight=ImageHeight;				// 이미지일경우 세로사이즈 : 아닐경우 0
	opt.FileMode='new';										// 신규 첨부파일
	*/
	f.options.add(opt);
}