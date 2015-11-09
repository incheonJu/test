<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
       <tiles:insertAttribute name="header" />
   </head>
   <body>
      <tiles:insertAttribute name="top" />
      <tiles:insertAttribute name="left" />
      <tiles:insertAttribute name="content" />
      <tiles:insertAttribute name="footer" />
   </body>
</html>
