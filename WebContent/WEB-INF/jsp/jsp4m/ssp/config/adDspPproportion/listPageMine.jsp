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
<form id="${formId }_1" method="post" action="${ctx}/ssp/config/adDspPproportion/save" class="bv-form " >
  <div class="form-body">
    <%
            int i= 1;             
      %>
    <div class="col-lg-12 col-sm-12 col-xs-12">
      <div class="well with-header clearfix">
        <div class="header bordered-palegreen"></div>

        <div class="form-group clearfix">
          <ul class="nav nav-tabs ad-top-classif" id="myTab1">
            <li class="active">
              <a data-toggle="tab" href="#pc-dsp-proportion" aria-expanded="true">PC</a>
            </li>
            <li>
              <a data-toggle="tab" href="#mobile-dsp-proportion" aria-expanded="false">移动</a>
            </li>
          </ul>

          <div class="tab-content  ad-style ad-right-classif">
            <div id="pc-dsp-proportion" class="tab-pane active clearfix ">
              <div class="form-inline col-sm-12">
                <label for="id-date-picker-1" class="">DSP : 直客</label>
                <c:forEach items="${dspListPC}" var="item" >
                  <div class="form-group">
                    <input class="form-control " name="proportion<%=i++%>" type="text" value="${item.proportion}"/> ：</div>
                </c:forEach>
                <button type="submit" class="btn btn-default">保存</button>
              </div>
            </div>

            <div id="mobile-dsp-proportion" class="tab-pane clearfix">
              <div class="form-inline col-sm-12">
                <label for="id-date-picker-1" class="">DSP : 直客</label>
                <c:forEach items="${dspListMobile}" var="item" >
                  <div class="form-group">
                    <input class="form-control " name="proportion<%=i++%>" type="text" value="${item.proportion}"/> ：</div>
                </c:forEach>
                <button type="submit" class="btn btn-default">保存</button>
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
            int j= 0;             
      %>
    <div class="col-lg-12 col-sm-12 col-xs-12">
      <div class="well with-header clearfix">
        <div class="header bordered-palegreen">DSP占比</div>
        <div class="form-group clearfix">
          <ul class="nav nav-tabs ad-top-classif" id="myTab2">
            <li class="active">
              <a data-toggle="tab" href="#pc-source-proportion" aria-expanded="true">PC</a>
            </li>
            <li>
              <a data-toggle="tab" href="#mobile-source-proportion" aria-expanded="false">移动</a>
            </li>
          </ul>

          <div class="tab-content  ad-style ad-right-classif">
            <div id="pc-source-proportion" class="tab-pane active clearfix ">
              <div class="col-sm-12">
                <c:forEach items="${sourceListPC}" var="item">
                  <div class="form-group form-inline">
                    <label for="id-date-picker-1" class="width90">${item.source_id.source_name}</label>
                    <div class="checkbox" >
                      <label>
                        <input  type="checkbox" id="dsp_status<%=j%>" class="checkbox-slider colored-palegreen" checked="">  <!-- lisa -->          
                        <span class="text">是否投放</span>
                      </label>
                    </div>
                    <div class="form-group left10" >
                      <label for="proportion">所占比例:&nbsp;</label>
                      <input id="dsp_proportion<%=j%>" class="form-control width60" name="proportion" type="text" value="${item.proportion}" /> <label>%</label>
                    </div>
                  </div>
                </c:forEach>
              </div>
              <button id="sourceSubmit1" type="submit" class="btn btn-default pull-right">保存</button>
            </div>

            <div id="mobile-source-proportion" class="tab-pane clearfix">
              <div class="col-sm-12">
                <c:forEach items="${sourceListMobile}" var="item">
                  <div class="form-group form-inline">
                    <label for="id-date-picker-1" class="width90">${item.source_id.source_name}</label>
                    <div class="checkbox">
                      <label>
                        <input  type="checkbox" id="dsp_status<%=++j%>" checked="" class="checkbox-slider colored-palegreen">            
                        <span class="text">是否投放</span>
                      </label>
                    </div>
                    <div class="form-group left10" >
                      <label for="proportion">所占比例:&nbsp;</label><!-- lisa -->
                      <input  id="dsp_proportion<%=j%>" class="form-control width60" name="proportion" type="text" value="${item.proportion}" /> <label>%</label>
                    </div>
                  </div>
              </c:forEach>
              </div>
              <button id="sourceSubmit2" type="submit" class="btn btn-default pull-right">保存</button>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</form>

<form id="${formId }_3" method="post" action="${ctx}/ssp/config/adAadProportion/save" class=" bv-form" >
  <div class="form-body">
    <%
            int k= 0;             
      %>
    <div class="col-lg-12 col-sm-12 col-xs-12">
      <div class="well with-header clearfix">
        <div class="header bordered-palegreen">直客占比</div>
        <div class="form-group clearfix">
          <ul class="nav nav-tabs ad-top-classif" id="myTab3">
            <li class="active">
              <a data-toggle="tab" href="#pc-ad-proportion" aria-expanded="true">PC</a>
            </li>
            <li>
              <a data-toggle="tab" href="#mobile-ad-proportion" aria-expanded="false">移动</a>
            </li>
          </ul>
          <div class="tab-content  ad-style ad-right-classif">
            <div id="pc-ad-proportion" class="tab-pane active clearfix ">
              <div class="col-sm-12">
                <c:forEach items="${adListPC}" var="item">        
                  <div class="form-group form-inline">
                    <label for="id-date-picker-1" class="width90">${item.advert_id.name}</label>
                    <div class="checkbox">
                      <label>
                        <input  type="checkbox" id="ad_status<%=++k%>" checked="checked" class="checkbox-slider colored-palegreen">            
                        <span class="text">是否投放</span>
                      </label>
                    </div>
                    <div class="form-group left10" >
                      <label for="proportion">所占比例:&nbsp;</label><!-- lisa -->
                      <input  id="ad_proportion<%=k%>" class="form-control width60" name="proportion" type="text" value="${item.proportion}" /> <label>%</label>
                    </div>
                  </div>

                </c:forEach>
              </div>
              <button type="submit" class="btn btn-default pull-right">保存</button>
            </div>

            <div id="mobile-ad-proportion" class="tab-pane clearfix">
              <div class="col-sm-12 ">
                <c:forEach items="${adListMobile}" var="item">
                  <div class="form-group form-inline">
                    <label for="id-date-picker-1" class="width90">${item.advert_id.name}</label>
                    <div class="checkbox ">
                      <label>
                        <input  type="checkbox" id="ad_status<%=++k%>" checked="checked" class="checkbox-slider colored-palegreen">            
                        <span class="text">是否投放</span>
                      </label>
                    </div>
                    <div class="form-group left10" >
                      <label for="proportion">所占比例:&nbsp;</label><!-- lisa -->
                      <input  id="ad_proportion<%=k%>" class="form-control width60" name="proportion" type="text" value="${item.proportion}" /> <label>%</label>
                    </div>
                  </div>

                </c:forEach>
              </div>
              <button type="submit" class="btn btn-default pull-right">保存</button>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</form>


<script type="text/javascript">

$("input").change(function(){
    $('button[type="submit"]').removeAttr("disabled");
})

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }_1'
	});
	FormSamples.init({
		formId:'${formId }_2'
	});
	FormSamples.init({
		formId:'${formId }_3'
	});
	

});

//投放关闭的时候，把对应的所占比例清空为0
//js闭包
	
	for (var a = 0; a <= <%=j%>; a++) {
    	(function(a) {
    		$('#dsp_status' + a).click(function() {
          console.log("click:"+$(this).is(":checked"));
    			if (!$(this).is(":checked")) {
    				$('#dsp_proportion' + a).val(0);
    			}

    		});
    	})(a)
    }
    
	for (var a = 0; a <= <%=k%>; a++) {
    	(function(a) {
    		$('#ad_status' + a).click(function() {
    			if (!$(this).is(":checked")) {
    				$('#ad_proportion' + a).val(0);
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
		