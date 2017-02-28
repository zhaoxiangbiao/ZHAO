<%@page import="org.ever4j.system.entity.SysOperLog"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String serverName =  request.getServerName();
String ctx =  request.getContextPath();
response.sendRedirect(ctx+"/login/ch/index.jsp");

%>
