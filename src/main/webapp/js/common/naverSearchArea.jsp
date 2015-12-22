<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.http.client.*"%>
<%@page import="org.apache.http.client.methods.*"%>
<%@page import="org.apache.http.impl.client.*"%>
<%@page import="org.apache.http.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	
	// Naver Search API Key
    String key = "581186506c221d89ba68d89f71f9fd33";
	// Search Query
    String query = request.getParameter("query");
	query = URLEncoder.encode(query, "UTF-8");
	
    String url = "http://openapi.naver.com/search?key=" + key + "&target=local&sort=comment&start=1&display=10&query=" + query;
    System.out.println("지역 검색:" + url);
    
    request.setCharacterEncoding("UTF-8");
    HttpClient client = new DefaultHttpClient();
    HttpGet httpget = new HttpGet(url);
    try
    {
    	ResponseHandler<String> rh = new BasicResponseHandler();
        String str = client.execute(httpget, rh);
        response.reset();
        response.setContentType("application/xml");
        response.setCharacterEncoding("UTF-8");
        System.out.println(str);
        System.out.println(rh.toString());
        out.println(str);
    }

    finally
    {
    	client.getConnectionManager().shutdown();
    }
%>