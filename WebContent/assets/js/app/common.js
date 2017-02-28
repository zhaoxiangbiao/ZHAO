Array.prototype.contains = function (element) {
		  
		    for (var i = 0; i < this.length; i++) {
		        if (this[i] == element) {
		            return true;
		        }
		    }
		    return false;
}
var Common = function () {
	
    // private functions & variables

    var myFunc = function(text) {
        alert(name);
    }
    var name="";
    // public functions
    return {
    	
    	toUpperCase1:function(str){ 
    	       var reg = /\b(\w)|\s(\w)/g; 
//    	       str = str.toLowerCase(); 
    	       return str.replace(reg,function(m){return m.toUpperCase()}) 
    	 },
        //main function
    	formatDateTime: function (data) {
    		if(data){
        		return new Date(data).format('yyyy-MM-dd hh:mm:ss');
        	}else{
        		return "";
        	}
        },
        formatDate: function (data) {
        	if(data){
        		return new Date(data).format('yyyy-MM-dd');
        	}else{
        		return "";
        	}
        },
        formatTime: function (data) {
        	if(data){
        		return new Date(data).format('hh:mm:ss');
        	}else{
        		return "";
        	}
        },
        round: function (v,e) 
        { 
       	 var t=1; 
       	 for(;e>0;t*=10,e--); 
       	 for(;e<0;t/=10,e++); 
       	 return Math.round(v*t)/t; 
        },
        toThousands:function (num,n) {
        	if(num==null){
        		return num;
        	}
        	if(!isNaN(num) ){
        		if(num==Infinity){
        			return n?"0."+"00000000000".substr(0,n):"0";
        		}
        		var fu=false;
        		if(num<0){
        			fu=true;
        			num=Math.abs(num);
        		}
        		var ns=num+"";
        		var n1=num+"";
        		var n2="";
        		if(ns.indexOf('.')!=-1){
        			n1 = ns.split('.')[0];
        			n2 = ns.split('.')[1];
        			if(n){
        				n2 = n2.length>2?n2.substr(0,2):n2;
        				n2 = n2+"00000000000".substr(0,(n-n2.length));
        			}
        		}
        		
        		if(n && ns.indexOf('.')==-1){
        			n2="00000000000".substr(0,n);
        		}
        		
        		num = n1*1;
        		
        		return (fu?"-":"")+(num || 0).toString().replace(/(\d)(?=(?:\d{3})+$)/g, '$1,')+(n2?"."+n2:"");
        	}else{
        		return num;
        	}
		},
		
		
        img:function(data){
        	 return '<img width="22" height="22"  src="'+_GLOBAL.imgUrlPrev+'/'+data+'" alt="" />';
        },
        star:function(data){
        	if(data){
        		var d = data/2;
        		var fullNum = Math.floor(d);
        		var isHalf = false;
        		if((d-fullNum)>=0.5){
        			isHalf = true;
        		}
        		var resultArray = ["<span style='color:#35aa47;'>"];
        		var i=0;
        		for(;i<fullNum;i++){
        			resultArray.push("<i class='fa fa-star'></i>");
        		}
        		if(isHalf){
        			resultArray.push("<i class='fa fa-star-half-o'></i>");
        			i++;
        		}
        		for(;i<5;i++){
        			resultArray.push("<i class='fa fa-star-o'></i>");
        		}
        		resultArray.push("</span>");
        		return resultArray.join('');
        	}else{
        		return "无";
        	}
        },
        
        cutText:function(value,maxLength){
        	var showText = value;
        	if(!maxLength){
        		maxLength = 5;
        	}
        	if(value && value.length>maxLength){
        		showText = value.substring(0,maxLength)+"...";
        	}
        	return '<span class="tooltips" data-toggle="tooltip" data-placement="top"  data-original-title="'+value+'">'+showText+'</span>';
        },
        
        pulsate:function(opt){
        	var cc = {
        			title:'',
        			pulsate:'warning',
        			icon:'fa fa-warning warning'
        		}
        	cc = $.extend(cc,opt);
        	return '<span class="pull-right tooltips" pulsate="warning" data-container="body" data-placement="top" data-original-title="'+cc.title+'" ><i class="'+cc.icon+'"></i></span>';
        },
        badge:function(opt){
        	var cc = {
        			title:'',
        			color:'info',
        			value:'0'
        	}
        	cc = $.extend(cc,opt);
        	return '<span class="pull-right tooltips badge badge-info"  data-container="body" data-placement="top" data-original-title="'+cc.title+'">'+cc.value+'</span>';
        },
        
        iframeResize:function(iframe){

            // Check if browser is Opera or Safari(Webkit so Chrome as well)
            if ($.browser.safari || $.browser.opera) {
                    var delayedResize = function () {
                        resizeHeight(iframe);
                    };
                    setTimeout(delayedResize, 0);
                    // Safari and Opera need a kick-start.
                    var source = $(this).attr('src');
                    $(iframe).attr('src', '');
                    $(iframe).attr('src', source);
            }else {
                    resizeHeight(iframe);
            }

            // resizeHeight
            function resizeHeight(iframe) {
                // Set inline style to equal the body height of the iframed content plus a little
                var newHeight = iframe.contentWindow.document.body.offsetHeight + options.heightOffset;
                iframe.style.height = newHeight + 'px';
            }
        }
        
    };

}();