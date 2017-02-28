// JavaScript Document

$(function(){
	
	var navigatorName = "Microsoft Internet Explorer"; 
	if( navigator.appName == navigatorName ){ 
	/*alert("ie"); */
	/*$(".mui-switch[checked]").css("background","transparent");*/
	
	$(".mui-switch").css({"background":"transparent","border":"none"});
	
	if ($(".mui-switch").is(':checked')) { 
	
	
	
	$(this).css("visibility","hidden");
	
	}

	
	
	}
	

	})