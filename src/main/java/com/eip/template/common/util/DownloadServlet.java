package com.eip.template.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UriUtils;

@Component
public class DownloadServlet extends HttpServlet
{
    // Constants ----------------------------------------------------------------------------------


    private static final long serialVersionUID = 1L;
    private static final int DEFAULT_BUFFER_SIZE = 10240; // 10KB.

    // Properties ---------------------------------------------------------------------------------
    private String filePath;

    // Actions ------------------------------------------------------------------------------------

    public void init() throws ServletException {

        // Define base path somehow. You can define it as init-param of the servlet.
        this.filePath = "D:\\home\\polychem";

        // In a Windows environment with the Applicationserver running on the
        // c: volume, the above path is exactly the same as "c:\files".
        // In UNIX, it is just straightforward "/files".
    }

    public void fileDownload(HttpServletRequest request, HttpServletResponse response){
    	try {
    		init();
    		String rootPath = this.filePath;

    		String fileName = request.getParameter("fileName").toString();
			String docName = URLEncoder.encode(fileName,"UTF-8");

			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\""+docName+"\"");

			OutputStream os = response.getOutputStream();
			String path = request.getParameter("filePath");
			path = path.replace("http://"+request.getHeader("host")+"/download","");

			String realPath = rootPath+path;

			FileInputStream fis = new FileInputStream(realPath);

			int n = 0;
	        byte[] b = new byte[512];
	        while((n = fis.read(b)) != -1 ) {
	            os.write(b, 0, n);
	        }
	        fis.close();
	        os.close();
    	} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e){
			e.printStackTrace();
		} catch (ServletException e){
			e.printStackTrace();
		}
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {

        // 경로 정보에 의해 요청 된 파일을 가져옵니다.
        String requestedFile = request.getPathInfo();
        // 실제로 파일이 요청 URI에 공급되어 있는지 확인합니다.
        if (requestedFile == null) {
            // 파일이 요청 URI에 제공되지 않는 경우 일을 할.
            // 예외를 던져, 또는 404을 보내거나 기본 / 경고 페이지를 표시하거나, 그냥 무시합니다.
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            return;
        }
        // 파일 이름을 디코딩 (에 공백 등을 포함 할 수 있습니다) 및 파일 객체를 준비합니다.
        File file = new File(filePath, URLDecoder.decode(requestedFile, "UTF-8"));
        // 파일이 실제로 파일 시스템에 존재하는지 확인합니다.
        if (!file.exists()) {
            // 파일이 존재하지 않는 것으로 나타납니다 경우 일을 할.
            // 예외를 던져, 또는 404을 보내거나 기본 / 경고 페이지를 표시하거나, 그냥 무시합니다.
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            return;
        }
        // Get news type by filename.
        String contentType = getServletContext().getMimeType(file.getName());

        // If news type is unknown, then set the default value.
        // For all news types, see: http://www.w3schools.com/media/media_mimeref.asp
        // To add new news types, add new mime-mapping entry in web.xml.
        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        // Init servlet response.
        response.reset();
        response.setBufferSize(DEFAULT_BUFFER_SIZE);
        response.setContentType(contentType);
        response.setHeader("Content-Length", String.valueOf(file.length()));
        response.setHeader("Content-Disposition", "attachment; filename=\"" + UriUtils.encodeFragment(file.getName(), "UTF-8") + "\"");

        // Prepare streams.
        BufferedInputStream input = null;
        BufferedOutputStream output = null;

        try {
            // Open streams.
            input = new BufferedInputStream(new FileInputStream(file), DEFAULT_BUFFER_SIZE);
            output = new BufferedOutputStream(response.getOutputStream(), DEFAULT_BUFFER_SIZE);

            // Write file contents to response.
            byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        } finally {
            // Gently close streams.
            close(output);
            close(input);
        }
    }

    // Helpers (can be refactored to public utility class) ----------------------------------------

    private static void close(Closeable resource) {
        if (resource != null) {
            try {
                resource.close();
            } catch (IOException e) {
                // Do your thing with the exception. Print it, log it or mail it.
                e.printStackTrace();
            }
        }
    }
}
