<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<%
String taskId = request.getParameter("id");
request.setAttribute("taskId", taskId);
%>
<!DOCTYPE html>
<head>
	<meta charset="utf-8" />
	<title>策略预览</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body >
	<script type="text/javascript" src="//192.168.200.221/jsyd/ecover.js?_zxcvb_upn=18600001111&_host=192.168.200.221:8989&_cs=192.168.200.221&_d=1&_taskId=${taskId}"></script>
</body>
<!-- END BODY -->
</html>