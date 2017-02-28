$(document).ready(function(){
	var userReg = /^\w{3,16}$/;
	var passReg = /^.{6,16}$/;
	var vcodeReg = /^\w{4}$/;
	
	var _SN=0;

	function checkInput(inputEle,reg,msgEle,regMsg,nullMsg){
		var value = $(inputEle).val();
		var r = true;
		if(!value){
			$(msgEle).html(nullMsg);
			r=false;
		}
		else if(!reg.test(value)){
			$(msgEle).html(regMsg);
			r=false;
		}
		if(r)
		$(msgEle).html("");
		
/*		var imgId =  "img-"+_SN++;
		
		flagEle.html("<img id='"+imgId+"' style='display:none;' src='images/"+(r?'true':'false')+".png'>");
		if(r){
			
			$('#'+imgId).show();
		}else{
			
			$('#'+imgId).fadeIn();
		}*/
		if(!r){
			$(inputEle).hide().fadeIn();
			$(msgEle).hide().fadeIn();
		}
		return r;
	}


	function checkUser(){
		var c= checkInput($('#user'),userReg,$(".point").children().eq(0),"只能输入3-16位数字、字母、下划线的组合！","请输入用户名!");
//		if(!c){
//			document.getElementById('user').focus();
//		}else{
//			document.getElementById('pass').focus();
//		}
		return c;
	}
	function checkPass(){
		var c= checkInput($('#pass'),passReg,$(".point").children().eq(1),"只能输入6-16位的密码组合！","请输入密码!");
//		if(!c){
//			document.getElementById('pass').focus();
//		}else{
//			document.getElementById('j_code').focus();
//		}
		return c;
	}
	function checkVcode(){
		return checkInput($('#j_code'),vcodeReg,$(".point").children().eq(2),"只能输入4位数字、字母、下划线的组合！","请输入验证码!");
	}

	function checkForm(){
		var c1 =  checkUser();
		var c2 = checkPass();
		var c3 = checkVcode();
		if(c1 && c2 &&  c3){
			saveuserinfo();
			return true;
		}else{
			return false;
		}
	}

	function initCheck(){
		$('#user').blur(function(){
			checkUser(); 
		})
		$('#pass').blur(function(){
			checkPass();
		})
		$('#j_code').blur(function(){
			checkVcode();
		})
	}

	//保存用户信息
	function saveuserinfo() {
		
		  if ($("#rmbuser").is(':checked')) {
			  var username = $("#user").val();
			  var password = $("#pass").val();
			  $.cookie("dsp_rmbuser", "true"); // 存储一个带30天期限的 cookie
			  $.cookie("dsp_username", username); // 存储一个带30天期限的 cookie
			  $.cookie("dsp_password", password); // 存储一个带30天期限的 cookie
		  }
		  else {
			  $.cookie("dsp_rmbuser", "false");
			  $.cookie("dsp_username", '', { expires: -1 });
			  $.cookie("dsp_password", '', { expires: -1 });
		  }
	}

	//获取用户信息
	function getUserInfo() {
		  var rmbuser = $.cookie("dsp_rmbuser"); 
		  var username = $.cookie("dsp_username"); 
		  var pwd = $.cookie("dsp_password"); 
		  
//		  console.log(rmbuser);
		  if (rmbuser && rmbuser=='true') {
//	 		  console.log(pwd)
//	 		  console.log(username)
			   $("#user").val(username);
			   $("#pass").val(pwd);
			   
			   setTimeout(function(){
					checkUser(); 
					checkPass(); 
					document.getElementById('j_code').focus();
			   },300);
		  }else if(rmbuser=="false"){
			  document.getElementById('user').focus();
			  $(".checkboxOne").css("background","#cfcfcf");
			  $("#rmbuser").attr('checked',false);
		  }else{
			  document.getElementById('user').focus();
		  }
	}

	function changeVcodeImg(){
		var url='/verifycode?='+ new Date().getTime();
		$('#vcode_span').css({"background-image":"url("+url+")","filter":"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+url+"',sizingMethod='scale')"});
	}
	
	
	$('#vcode_span').on('click',changeVcodeImg);
	$('#login-form').on('submit',function(){
		return checkForm();
	});
	
	getUserInfo();
	initCheck();
	changeVcodeImg();
	
	
	// 效果
	$('.img').hover(function(){	

		var id=$(this).attr("id");

		$(this).children().attr("src","images/"+id+"02.png");
	},
	function(){
		var id=$(this).attr("id");
		
		$(this).children().attr("src","images/"+id+"01.png");
		
	});
	
})