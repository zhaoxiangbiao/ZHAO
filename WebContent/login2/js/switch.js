// JavaScript Document


$(document).ready(function() {
    
        $(".checkboxOne").click(function() {
            if($(".mui-switch").prop("checked")){
                $(".mui-switch").prop({"checked":false});
				$(".checkboxOne").css("background","#c8c1bf");
            }
            else{
                $(".mui-switch").prop({"checked":true});
				$(".checkboxOne").css("background","#f55c33");
            }
        });
   
 

    
});


