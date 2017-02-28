<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<head>
<title>终端明细号码</title>
</head>
	<form  class="form-horizontal" >
		<div class="form-body">
				<div style="padding-left: 15%;">
				<c:forEach items="${phoneNumbersDetail}" var="m">
	    		   终端号码：<span style="color:red">${m.key}</span> 号码权重：<span style="color:blue"> ${m.value}</span><br>
				</c:forEach>
			</div>			
		</div>
	</form>
