<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<%@ page import="java.util.Date"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">
<title>效果营销资源优化管理平台</title>
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
            <img src="images/bg.jpg" class="bg">
            <div class="top" style="padding-top:100px;">
        <img src="images/til.png">    
        </div>

                   <div class="content">
                        <div class="box">
                                 
                                 <form id="login-form" action="${ctx }/j_spring_security_check" method="post" onsubmit="">
                                      <div class="txtbox">
                                            <span class="txt">
                                                  <span class="icon icon01">用户名</span>
                                                  <input type="text" name="j_username"  placeholder="Username" class="user" id="user">
                                                  <div class="point"><P></P></div>
                                            </span>
                                      </div>
                                      
                                      
                                      <div class="txtbox">
                                             <span class="txt">
                                                    <span class="icon icon02">密码</span>
                                                    <input name="j_password" type="password" placeholder="Password" class="password" id="pass">
                                                    <div class="point"><P id="password"></P></div>
                                             </span> 
                                      </div>
                                      
                                      
                                      <div class="txtbox code">
                                            
                                            <span class="txt txt03">
                                                  <span class="icon icon03">验证码</span>
                                                  <span class="code_img vcode_img" id="">
                                                  <span class="code_img vcode_img" style="cursor: pointer; color:#696969;margin-top: 2px;  " id="vcode_span"></span>
                                                  </span>
                                                  
                                                  <input id="j_code" name="j_code" type="text" placeholder="Authcode" class="yzm" style="">
                                                  <div class="point"><P id="yzm"></P></div> 
                                            </span>
                                            

                                      </div>
                                      
                                      
                                      <div class="txtbox txtbox01">
                                            <div class="pass">
                                                  <div class="checkboxOne">
                                                     <input class="mui-switch" type="checkbox" checked id="rmbuser">
                                                     <label for="rmbuser"></label>
                                                    
                                                  </div>
                                                  <span class="rember">记住密码</span>
                                                  <span class="forget"><a>忘记密码？</a></span>
                                            </div>
                                            
                                      </div>
                                      <div class="txtbox">
                                      ${msg }
                                            <div class="but"><input type="submit" class="submit" value="登&nbsp;录"></input></div>
                                      </div>
                                </form>  
                        </div>
                    
                  
            </div>
            
            <div class="footer">

            </div>
      
      </div>

</body>
</html>