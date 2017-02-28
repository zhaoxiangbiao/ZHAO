<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adDataContrast/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADDATACONTRAST_" ></c:set>
<c:set scope="page" var="dataTitle" value="自有统计与第三方统计数据对比" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adDataContrast_1" ></c:set>
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
								<!--<sec:authorize ifAllGranted="${rolePrev }NEW">
									<button href="${urlPrev }new" class="btn btn-palegreen btn-xs "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										新增
									</button>
								</sec:authorize>
								<sec:authorize ifAllGranted="${rolePrev }DELETE">
									<button href="${urlPrev }delete" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										删除
									</button>
								</sec:authorize>-->
							</div>
						</div>
						<div class="widget-body">
						
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">统计日期</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="datetime_count_time"  type="text" />
						</div>
						</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">原始广告位id</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_source_slot_number"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">广告位名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_source_slot_name"  placeholder="">
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
			{sTitle:'统计日期',  mData: "count_time" , mRender: Common.formatDate},					
			{sTitle:'原始广告位id',  mData: "source_slot_number",uxLongText:true},				
			{sTitle:'广告位名称',  mData: "source_slot_name",uxLongText:true},				
			{sTitle:'第三方统计pv',  mData: "t_pv",uxLongText:true},				
			{sTitle:'第三方统计点击',  mData: "t_click",uxLongText:true},				
			{sTitle:'第三方统计点击率(%)',  mData: "t_ctr",uxLongText:true},				
			{sTitle:'自有统计pv',  mData: "s_pv",uxLongText:true},				
			{sTitle:'自有统计点击',  mData: "s_click",uxLongText:true},				
			{sTitle:'自有统计点击率(%)',  mData: "s_ctr",uxLongText:true}	        
 
        ]
	           
 });
});
$('.date-range-picker').datepicker();
</script>
