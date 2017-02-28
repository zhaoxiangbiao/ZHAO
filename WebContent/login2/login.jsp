<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<%@ page import="java.util.Date"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">

<title><%=sysTitle%></title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/swtich01.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/star.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/switch.js" type="text/javascript"></script>
<script src="js/yanzheng.js" type="text/javascript"></script>
</head>

<body>

      <div class="contain">
            <img src="images/login2_bg.jpg" class="bg">
            <div class="top">
            	<a href="//www.admai.com" target="_blank">
                   <img src="images/logo.png">
            	</a>
            </div>
            <div class="img data" id="data"><img src="images/data01.png"></div>
            <div class="img accurate" id="accurate"><img src="images/accurate01.png"></div>
            <div class="img marketing" id="marketing"><img src="images/marketing01.png"></div>
            
            <div class="content1">
                   <img src="images/login_bg2.png" class="login_bg2">
                   <div class="content">
                        <div class="box">
                                 
                                 <form id="login-form" action="${ctx }/j_spring_security_check" method="post" onsubmit="">
                                      <div class="txtbox">
                                            <span class="icon">用户名</span>
                                            <span class="txt"><input type="text" name="j_username"  placeholder="Username" class="user" id="user"></span>
                                            <span class="sign">*</span>
                                      </div>
                                      
                                      <div class="point"><P></P></div>
                                      <div class="txtbox">
                                            <span class="icon">密&nbsp;&nbsp;&nbsp;码</span>
                                            <span class="txt"><input name="j_password" type="password" placeholder="Password" class="password" id="pass"></span>
                                            <span class="sign">*</span>
                                      </div>
                                      
                                      <div class="point"><P id="password"></P></div>
                                      <div class="txtbox code">
                                            <span class="icon">验证码</span>
                                            <span class="txt"><input id="j_code" name="j_code" type="text" placeholder="Authcode" class="yzm"></span>                                       <span class="sign">*</span>
                                            <span class="code_img vcode_img" style="cursor: pointer;" id="vcode_span"></span>

                                      </div>
                                      
                                      <div class="point"><P id="yzm">${msg }</P></div>
                                      <div class="point pass">
                                            <div class="checkboxOne" style="cursor: pointer;">
                                               <input class="mui-switch" type="checkbox" checked id="rmbuser">
                                               <label for="rmbuser"></label>
                                              
                                            </div>
                                            <span class="rember">记住密码</span>
                                            <span class="forget"><a>忘记密码？</a></span>
                                      </div>
                                      <div class="but"><input type="submit" class="submit" value="登&nbsp;录"></input></div>
                                </form>  
                        </div>
                   </div>     
                  
            </div>
            
            <div class="footer">

                  <P>Copyright 2016 上海骏数信息技术有限公司</P>
            </div>
      
      </div>

</body>
</html>