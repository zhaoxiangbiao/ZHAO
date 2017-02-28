// JavaScript Document

$(function(){
	
	  var W = $(window).width();
	  var H = $(window).height();

	  $('.bg').width(W).height(H);

	$(window).resize(function() {

  	
	  var W1 = $(window).width();
	  var H1 = $(window).height();
  
      
	  $('.bg').width(W1).height(H1);


    });
	
})

