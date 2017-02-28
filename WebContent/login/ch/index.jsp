<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>SSP系统登录</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	 <link rel="shortcut icon" href="${ctx}/favicon.png" type="image/x-icon">
	<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
	<div class="htmleaf-container">
		<header class="htmleaf-header">
		</header>
		<div class="wrapper">
			<div class="container">
				<h1>SSP平台</h1>
				<c:if test="${not empty sessionScope.msg}">
                <div style="color:orange;">
                    <span>${msg}</span>
                </div>
                <c:set scope="session" var="msg" value=""></c:set>
            	</c:if>
				<form class="form" action="${ctx }/j_spring_security_check"  method="post"  >
					<input name="j_username" type="text" placeholder="用户名">
					<input name="j_password" type="password" placeholder="密    码">
					<button type="submit" id="login-button">登录</button>
				</form>
			</div>
			
			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		
	
	<script src="${ctx }/assets/js/jquery.min.js" type="text/javascript"></script>
<!-- 	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script> -->
	<script>
	//$('#login-button').click(function (event) {
	//    event.preventDefault();
	//    $('form').fadeOut(500);
	//    $('.wrapper').addClass('form-success');
	//});
	</script>
</body>
</html>