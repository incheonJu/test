package com.eip.template.common.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

public class FileUtil {
	
	public FileUtil(){
		
	}
	/**
	 * 파일을 저장한다.
	 * @param file 
	 * @param savePath 
	 * @return 파일명
	 */
	public static String saveFile(MultipartFile file, String savePath)
    {
		
        File uploadFile = null;
        String filePath = "";
        String fileName = "";
        try
        {
            // 확장자 체크 필요.
        	fileName = file.getOriginalFilename();
            filePath = savePath +"/"+ fileName;
            uploadFile = new File(filePath);
            
            if (!uploadFile.exists())
            {
                uploadFile.mkdirs();
            }
            file.transferTo(uploadFile);
        }
        catch (Exception e)
        {
            return "";
        }
        return fileName;
    }
	
	/**
	 * 파일을 저장한다.
	 * @param file 
	 * @param savePath 
	 * @return 파일명
	 */
	public static String saveFileRtnFullPath(MultipartFile file, String savePath)
    {
		
        File uploadFile = null;
        String filePath = "";
        String fileName = "";
        try
        {
            // 확장자 체크 필요.
        	fileName = file.getOriginalFilename();
            filePath = savePath +"/"+ fileName;
            uploadFile = new File(filePath);
            
            if (!uploadFile.exists())
            {
                uploadFile.mkdirs();
            }
            file.transferTo(uploadFile);
        }
        catch (Exception e)
        {
            return "";
        }
        return filePath;
    }
	
	/**
	 * 파일 확장자를 가져온다.
	 * @param filePath
	 * @return 
	 */
	public static String getFileExt(String filePath){
		return filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
	}
	
	/**
	 * 파일 타입을 가져온다.
	 * @param fileExt
	 * @return M - 비디오 파일, I - 이미지파일, E - 기타
	 */
	public static String getFileKind(String fileExt){
		String[] arrExtMovie = "mp4,avi,mpg,mpeg,wmv".split(",");
    	String[] arrExtImg = "bmp,gif,jpg,jpeg,png".split(",");
    	String[] arrExtXls = "xls,xlsx".split(",");
    	
    	for(int i=0;i<arrExtMovie.length;i++)
    	{
    		if(fileExt.indexOf(arrExtMovie[i]) >= 0)	return "M";
    	}
    	
    	for(int i=0;i<arrExtImg.length;i++)
    	{
    		if(fileExt.indexOf(arrExtImg[i]) >= 0)		return "I";
    	}
    	
    	for(int i=0;i<arrExtXls.length;i++)
    	{
    		if(fileExt.indexOf(arrExtXls[i]) >= 0)		return "X";
    	}
    	
    	return "E";
	}
	
	
	public static String getFileName(String fileFullPath) {
		String fileName = null;
		if (fileFullPath.lastIndexOf("/") != -1) {
			fileFullPath = fileFullPath.substring(fileFullPath.lastIndexOf("/")+1);
		} else if (fileFullPath.lastIndexOf("\\") != -1) {
			fileFullPath = fileFullPath.substring(fileFullPath.lastIndexOf("\\")+1);
		}
		return fileFullPath;
	}
	
	
}
