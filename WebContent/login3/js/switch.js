// JavaScript Document


$(document).ready(function() {
    
        $(".rember").click(function() {
            if($(".mui-switch").prop("checked")){
                $(".mui-switch").prop({"checked":false});
				$(".checkboxOne").css("background","url(images/checked02.png) center center no-repeat");
            }
            else{
                $(".mui-switch").prop({"checked":true});
				$(".checkboxOne").css("background","url(images/checked01.png) center center no-repeat");
            }
        });
   
   
       $('.checkboxOne').click(function(){
	   
            if($(".mui-switch").prop("checked")){
                $(".mui-switch").prop({"checked":false});
				$(".checkboxOne").css("background","url(images/checked02.png) center center no-repeat");
            }
            else{
                $(".mui-switch").prop({"checked":true});
				$(".checkboxOne").css("background","url(images/checked01.png) center center no-repeat");
            }

	   })
 

    
});


