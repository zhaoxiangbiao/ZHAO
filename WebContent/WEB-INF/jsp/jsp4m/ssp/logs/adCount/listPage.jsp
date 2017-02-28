<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adCount/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADCOUNT_" ></c:set>
<c:set scope="page" var="dataTitle" value="数据统计表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adCount_1" ></c:set>
<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="data-div">
					<div class="widget collapsed " style="margin-bottom:5px;">
			<div class="widget-header ">
				<span class="widget-caption">数据列表</span>
                  <div class="widget-buttons">
                        
                        <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="广告来源" data-form="true">查询</button>
                        <a href="#" data-toggle="collapse">
                            <i class="fa blue fa-plus"></i>
                        </a>
                    </div>
                  <div class="widget-buttons buttons-bordered">
								<sec:authorize ifAllGranted="${rolePrev }NEW">
									<button href="${urlPrev }new" class="btn btn-palegreen btn-xs "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										新增
									</button>
								</sec:authorize>
								<sec:authorize ifAllGranted="${rolePrev }DELETE">
									<button href="${urlPrev }delete" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										删除
									</button>
								</sec:authorize>
							</div>
						</div>
						<div class="widget-body">
						
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
										
			
			
			
			
	
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right"></label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="datetime_time"  type="text" />
						</div>
						</div>
							
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	 					
						</form>
						</div>
						</div>
						
						
						<div class="widget no-header ">
			
			<div class="widget-body">
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">
						</table>
						
						</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
</div>
	<!-- END ROW CONTENT-->
		

<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	//look-up 查询条件 会员 
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	

 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[1, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'',  mData: "pub_id",uxLongText:true},				
			{sTitle:'',  mData: "site_id",uxLongText:true},				
			{sTitle:'',  mData: "slot_id",uxLongText:true},				
			{sTitle:'',  mData: "source_id",uxLongText:true},				
			{sTitle:'',  mData: "source_solt_id",uxLongText:true},		
			{sTitle:'',  mData: "time" , mRender: Common.formatDate},					
			{sTitle:'',  mData: "year",uxLongText:true},				
			{sTitle:'',  mData: "month",uxLongText:true},				
			{sTitle:'',  mData: "day",uxLongText:true},				
			{sTitle:'',  mData: "hour",uxLongText:true},				
			{sTitle:'',  mData: "client_type",uxLongText:true},				
			{sTitle:'',  mData: "request_count",uxLongText:true},				
			{sTitle:'',  mData: "request_success_count",uxLongText:true},				
			{sTitle:'',  mData: "show_count",uxLongText:true},				
			{sTitle:'',  mData: "click_count",uxLongText:true},				
			{sTitle:'',  mData: "close_count",uxLongText:true},				
			{sTitle:'',  mData: "advert_id",uxLongText:true},				
			{sTitle:'',  mData: "wh_id",uxLongText:true},				
			{sTitle:'',  mData: "dsp_type",uxLongText:true},				
			{sTitle:'',  mData: "houver_count",uxLongText:true},		        
          {uxCogs:[
	          {name:"查看"}
	          <sec:authorize ifAllGranted="${rolePrev }EDIT">
	          ,{name:"修改"}
	          </sec:authorize>
	          <sec:authorize ifAllGranted="${rolePrev }DELETE"> 
	          ,{name:"删除"}
	          </sec:authorize>
          ]}
        ]
	           
 });
});
</script>
