<%@tag import="org.ever4j.system.entity.SysOperLog"%>
<%@tag pageEncoding="UTF-8"%>

<%@ attribute name="value" type="java.lang.String" required="true" %>
<%@ attribute name="maxLength" type="java.lang.Integer" required="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String showText = value;
	if(maxLength==null||maxLength<=0){
		maxLength = 5;
	}
	if(value!=null && value.length()>maxLength){
		showText = value.substring(0,maxLength)+"...";
	}
	
	
%>
<span class="tooltips" data-container="body" data-original-title="<%=value%>"><%=showText%></span>
