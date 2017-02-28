<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/rc/tAdStatTask/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_RC_TADSTATTASK_" ></c:set>
<c:set scope="page" var="dataTitle" value="统计任务（从redis入库任务）" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_rc_tAdStatTask_1" ></c:set>
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
								
							</div>
						</div>
						<div class="widget-body">
						
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">任务ID</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_task_id"  placeholder="">
								</div>
								</div>
							
	
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">日期</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="datetime_stat_date"  type="text" />
						</div>
						</div>
							
			
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">统计周期 </label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQI_type"  attrs="placeholder=''" cssClass="form-control  select2me"  enumName="stat_cycle" tagType="edit" />
								
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">统计状态</label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQI_status"  attrs="placeholder=''" cssClass="form-control  select2me"  enumName="process_status" tagType="edit" />
								
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
	 aaSorting: [[6, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'任务ID',  mData: "task_id",uxLongText:true},		
			{sTitle:'日期',  mData: "stat_date" , mRender: Common.formatDate},					
			{sTitle:'小时',  mData: "hour",uxLongText:true},		
			{sTitle:'统计周期 ',mData: "type" ,uxEnum:'stat_cycle'},
			{sTitle:'统计状态',mData: "status" ,uxEnum:'process_status'},
			{sTitle:'开始时间',  mData: "start_time" , mRender: Common.formatDateTime},			
			{sTitle:'完成时间',  mData: "end_time" , mRender: Common.formatDateTime},			        
			{sTitle:'重新统计',  mData: "id" , mRender:function(data, type, full){
					return '<a href="${urlPrev}/view?id='+data+'" class="btn btn-xs prevent-double" data-handler="CONFIRM" ><i class="fa fa-info info" ></i>重新统计</a>'
				}
			}
        ]
	           
 });
});
</script>
