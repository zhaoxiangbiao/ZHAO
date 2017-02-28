<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/adDspPproportion/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_ADDSPPPROPORTION_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告源" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_adDspPproportion_1" ></c:set>
<style>
  .form-inline .form-group{
    width:auto;
  }
  input[type=checkbox].checkbox-slider~.text:before{
    content:"打开 &关闭"
  }
   .tab-content, .nav-tabs, .widget .widget-header,.ad-create-form .widget .widget-body,
         .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus
        {
            -webkit-box-shadow:none;
            box-shadow:none;
        }
         .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus{
            border-bottom: 2px solid #a0d468;
            border-top: 0px;
        }

        .nav-tabs,.tab-content{
            background-color: transparent;
        }
        .widget .widget-header{
            border: 1px solid #a0d468;
            border-bottom: 0px;
        }
        .widget .widget-body{
            border: 1px solid #a0d468;
            background-color: #f9fcff;
        }  
        .left10{
          margin-left: 10px;
        } 
        .width60{
          width:60px !important;
        }     
        .width90{
          width:90px !important;
        }
        .checkbox label span.text{
            text-indent: -110px;
        }
        div.checkbox{
          top: -7px;
        }
</style>
<div class="row">
	<input id="platform_type" type="hidden" value="${platform_type}"/>
				<div class="col-md-12">
<form id="${formId }_1" method="post" action="${ctx}/ssp/config/adDspPproportion/save" class="bv-form form-horizontal" >
  <div class="form-body">
    <div class="col-lg-12 col-sm-12 col-xs-12">
      <div class="well with-header clearfix">
        <div class="header bordered-palegreen"></div>
			<input type="submit" hidden="true"/>
        <div class="form-group clearfix">
          <ul class="nav nav-tabs ad-top-classif" id="myTab1">
            <li class="active tab-pc-end" id="tab-pc-end">
              <a data-toggle="tab" href="#pc-dsp-proportion" aria-expanded="true">PC</a>
            </li>
            <li id="tab-mobile-end" class="tab-mobile-end">
              <a data-toggle="tab" href="#mobile-dsp-proportion" aria-expanded="false">移动</a>
            </li>
          </ul>

          <div class="tab-content  ad-style ad-right-classif">
            <div id="pc-dsp-proportion" class="tab-pane active clearfix ">
              <div class="form-inline col-sm-12">
                <label for="id-date-picker-1" class="width90 pull-left" style=" top: 10px;position: relative; width: 150px !important;">第三方广告源 : DSP</label>
                <c:forEach items="${dspListPC}" var="item" varStatus="s">
                  <div class="form-group pull-left">
                    <input type="hidden" name="pcList[${s.index }].id" type="text" value="${item.id}"/> 
                    <input type="hidden" name="pcList[${s.index }].type" type="text" value="${item.type}"/> 
                    <input type="hidden" name="pcList[${s.index }].target_id" type="text" value="${item.target_id}"/> 
                    <input type="hidden" name="pcList[${s.index }].dsp_id" type="text" value="${item.dsp_id}"/> 
                    <input type="hidden" name="pcList[${s.index }].platform_type" type="text" value="${item.platform_type}"/> 
                    <input class="form-control " id="dsp_advert_pc${s.index }" name="pcList[${s.index }].proportion" type="text" value="${item.proportion}" data-bv-regexp="true" data-bv-regexp-regexp="0|(^[1-9]+\d*$)" data-bv-regexp-message="只能输入正整数或者零！"/> </div>
                </c:forEach>
              </div>
            </div>

            <div id="mobile-dsp-proportion" class="tab-pane clearfix">
              <div class="form-inline col-sm-12">
                <label for="id-date-picker-1" class="width90 pull-left" style=" top: 10px;position: relative;width: 150px !important;">第三方广告源 : DSP</label>
                <c:forEach items="${dspListMobile}" var="item" varStatus="s">
                  <div class="form-group pull-left">
                  	<input type="hidden" name="mobileList[${s.index }].id" type="text" value="${item.id}"/> 
                    <input type="hidden" name="mobileList[${s.index }].type" type="text" value="${item.type}"/> 
                    <input type="hidden" name="mobileList[${s.index }].target_id" type="text" value="${item.target_id}"/> 
                    <input type="hidden" name="mobileList[${s.index }].dsp_id" type="text" value="${item.dsp_id}"/> 
                    <input type="hidden" name="mobileList[${s.index }].platform_type" type="text" value="${item.platform_type}"/> 
                    <input class="form-control " id="dsp_advert_mobile${s.index }" name="mobileList[${s.index }].proportion" type="text" value="${item.proportion}" data-bv-regexp="true" data-bv-regexp-regexp="0|(^[1-9]+\d*$)" data-bv-regexp-message="只能输入正整数或者零！"/> </div>
                </c:forEach>
              </div>
            </div>
          </div>

        </div>

      </div>
    </div>
  </div>
</form>

<form id="${formId }_2" method="post" action="${ctx}/ssp/config/adSourceProportion/save" class=" bv-form" >
  <div class="form-body">
    <%
            int j1 = 0;     
      %>
    <div class="col-lg-12 col-sm-12 col-xs-12">
      <div class="well with-header clearfix">
        <div class="header bordered-palegreen">第三方广告源占比</div>
			<input type="submit" hidden="true"/>        
        <div class="form-group clearfix">
          <ul class="nav nav-tabs ad-top-classif" id="myTab2">
            <li class="active tab-pc-end">
              <a data-toggle="tab" href="#pc-source-proportion" aria-expanded="true">PC</a>
            </li>
            <li class="tab-mobile-end">
              <a data-toggle="tab" href="#mobile-source-proportion" aria-expanded="false">移动</a>
            </li>
          </ul>

          <div class="tab-content  ad-style ad-right-classif">
            <div id="pc-source-proportion" class="tab-pane active clearfix ">
              <div class="col-sm-12">
                <c:forEach items="${sourceListPC}" var="item" varStatus="s">
                  <div class="form-group form-inline">
                    <label for="id-date-picker-1" class="width90">${item.source_id.source_name}</label>
                    <div class="checkbox" >
                      <label>
                        <input  type="checkbox" id="dsp_status<%=++j1%>" class="checkbox-slider colored-palegreen" checked="checked">        
                        <span class="text">是否投放</span>
                      </label>
                    </div>
                    
                    <div class="form-group left10" >
                      <label for="proportion">所占比例:&nbsp;</label>
                      <input type="hidden" name="pcList[${s.index }].id" type="text" value="${item.id}"/> 
                    <input type="hidden" name="pcList[${s.index }].type" type="text" value="${item.type}"/> 
                    <input type="hidden" name="pcList[${s.index }].target_id" type="text" value="${item.target_id}"/> 
                    <input type="hidden" name="pcList[${s.index }].source_id.source_id" type="text" value="${item.source_id.source_id}"/> 
                    <input type="hidden" name="pcList[${s.index }].platform_type" type="text" value="${item.platform_type}"/> 
                      <input id="dsp_proportion<%=j1%>" class="form-control width60" name="pcList[${s.index }].proportion" type="text" value="${item.proportion}" data-bv-regexp="true" data-bv-regexp-regexp="0|(^[1-9]+\d*$)" data-bv-regexp-message="只能输入正整数或者零！"/> <label>%</label>
                    </div>
                    <c:if test="${item.source_id.backup==1}">
                    <span class="label label-warning">打底</span>
                    </c:if>
                  </div>
                </c:forEach>
              </div>
            </div>
			
			<%
				int j2 = j1;
			%>
            <div id="mobile-source-proportion" class="tab-pane clearfix">
              <div class="col-sm-12">
                <c:forEach items="${sourceListMobile}" var="item" varStatus="s">
                  <div class="form-group form-inline">
                    <label for="id-date-picker-1" class="width90">${item.source_id.source_name}</label>
                    <div class="checkbox">
                      <label>
                        <input  type="checkbox" id="dsp_status<%=++j2%>" checked="checked" class="checkbox-slider colored-palegreen">            
                        <span class="text">是否投放</span>
                      </label>
                    </div>
                    <div class="form-group left10" >
                      <label for="proportion">所占比例:&nbsp;</label>
                      <input type="hidden" name="mobileList[${s.index }].id" type="text" value="${item.id}"/> 
                    <input type="hidden" name="mobileList[${s.index }].type" type="text" value="${item.type}"/> 
                    <input type="hidden" name="mobileList[${s.index }].target_id" type="text" value="${item.target_id}"/> 
                    <input type="hidden" name="mobileList[${s.index }].source_id.source_id" type="text" value="${item.source_id.source_id}"/> 
                    <input type="hidden" name="mobileList[${s.index }].platform_type" type="text" value="${item.platform_type}"/> 
                      <input  id="dsp_proportion<%=j2%>" class="form-control width60" name="mobileList[${s.index }].proportion" type="text" value="${item.proportion}" data-bv-regexp="true" data-bv-regexp-regexp="0|(^[1-9]+\d*$)" data-bv-regexp-message="只能输入正整数或者零！"/> <label>%</label>
                    </div>
                    
                    <c:if test="${item.source_id.backup==1}">
                    <span class="label label-warning">打底</span>
                    </c:if>
                  </div>
              </c:forEach>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</form>
</div>
		<button id="commit1" class="btn btn-palegreen btn-xs pull-right" style="margin-right:30px;">
              <i class="ace-icon fa fa-check bigger-110"></i>
             	保存                  
        </button>
</div>

<script type="text/javascript">

	$("input").change(function(){
    	$('input[type="submit"]').removeAttr("disabled");
	}) 

	var platformType = $("#platform_type").val();
 
	//更加平台类型显示不同的tab
	if(platformType==1){//PC
      $(".tab-mobile-end").hide();
	}else if(platformType==2){//Mobile
		  $(".tab-pc-end").hide();
      $(".tab-mobile-end a").trigger("click");
	}else{
		
	}
	
	var dsp_proportion_pc;
	var dsp_proportion_mobile;

	var ad_proportion_pc;
	var ad_proportion_mobile;
	
	var sum_proportion_pc;
	var sum_proportion_mobile;
	
	var tab1SelectedHref="#pc-dsp-proportion";

    $('#myTab1 a').click(function (e) { 
        e.preventDefault();
        tab1SelectedHref = $(this).attr('href');
    });   
	
	$("#commit1").click(function(){
		dsp_proportion_pc = 0;
		dsp_proportion_mobile = 0;
		ad_proportion_pc = 0;
		ad_proportion_mobile = 0;
		
		sum_proportion_pc = parseInt($("#dsp_advert_pc0").val())+parseInt($("#dsp_advert_pc1").val());
		sum_proportion_mobile = parseInt($("#dsp_advert_mobile0").val())+parseInt($("#dsp_advert_mobile1").val());
		//首先判断用户当前点的是移动还是PC
		if(tab1SelectedHref=="#pc-dsp-proportion"){
			if(sum_proportion_pc<=0){
				alert("PC DSP : 直客占比之和必须大于0");
				return;
			}
 			 
		}else{
			if(sum_proportion_mobile<=0){
				alert("移动DSP : 直客占比之和必须大于0");
				return;
			}
			
		}
		
		$('input[type="submit"]').trigger("click");
	});


jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }_1',
		success:function(){}
	});
	FormSamples.init({
		formId:'${formId }_2',
		success:function(){}
	});
	

	
});


	
	
	
//投放关闭的时候，把对应的所占比例清空为0
//js闭包
	
	for (var a = 1; a <= <%=j2%>; a++) {
		(function(a) {
			$('#dsp_status' + a).click(function() {
				if (!$(this).is(":checked")) {
					$('#dsp_proportion' + a).val(0);
				}

			});
		})(a)
	}

	


<%--     

		
	
	var a;
	$("#sourceSubmit1").click(function(){
		var dspSumPC = 0;
		console.log("size:"+parseInt($("#sourceSize").val()));
		for (a=1; a <= parseInt($("#sourceSize").val()); a++) {
	    	(function(a) {
	    		console.log("click:"+$(this).is(":checked"));
	    		dspSumPC+=parseInt($('#dsp_proportion' + a).val());
	    	})(a)
	    }
		//alert(dspSumPC);
		if((dspSumPC-100)!=100){
			alert("各个广告源的DSP占比总和必须是100,请重新分配比例!");
		}else{
			$("#sourceSubmit1").trigger("click");
		}
	})
	
	$("#sourceSubmit2").click(function(){
		var dspSumMobile = 0;
		for (var b=a; b <= <%=j%>; b++) {
	    	(function(b) {
	    		dspSumMobile+=parseInt($('#dsp_proportion' + b).val());
	    	})(b)
	    }
		alert(dspSumMobile-100);
		if((dspSumMobile-100)!=100){
			alert("各个广告源的DSP占比总和必须是100,请重新分配比例!");
		}else{
			$("#sourceSubmit2").trigger("click");
		}
	})
	var adSumPC = 0;
	var adSumMobile =0;
	var c;
	$("#adSubmit1").click(function(){
		for (c=1; c <= ${adListPCSize}; c++) {
	    	(function(c) {
	    		adSumPC+=$('#ad_proportion' + c).val();
	    	})(c)
	    }
		if(adSumPC!=100){
			alert("各个直客的占比总和必须是100,请重新分配比例!");
		}else{
			$("#adSubmit1").trigger("click");
		}
	})
	
	$("#adSubmit2").click(function(){
		for (var d=1; d <= <%=k%>; d++) {
	    	(function(d) {
	    		adSumMobile+=$('#ad_proportion' + d).val();
	    	})(d)
	    }
		if(adSumMobile!=100){
			alert("各个直客的占比总和必须是100,请重新分配比例!");
		}else{
			$("#adSubmit2").trigger("click");
		}
	}) --%>

</script>
		