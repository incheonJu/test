<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.http.client.*"%>
<%@page import="org.apache.http.client.methods.*"%>
<%@page import="org.apache.http.impl.client.*"%>
<%@page import="org.apache.http.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// Naver Map API Key
    String key = "7276475101770f31656fd24df7177556";
	// Search Query
    String query = request.getParameter("query");
    String url = "http://openapi.map.naver.com/api/geocode.php?key=" + key +"&encoding=utf-8&coord=LatLng&query=" + query;
    
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
        System.out.println("XML:" + str);
        System.out.println(rh.toString());
        out.println(str);
    }

    finally
    {
    	client.getConnectionManager().shutdown();
    }
%>