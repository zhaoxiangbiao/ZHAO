<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>ip</title>
    <meta name="description" content="login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<%
	String ip = request.getRemoteAddr();
	String host =request.getRemoteHost();
	int port = 	request.getRemotePort();
%>
<body>
   <br>
   <br>
   <br>
   <center>
   	ip:<%=ip %> <br>
   	host:<%=host %> <br>
   	port:<%=port %> <br>
   </center>
</body>
</html>
