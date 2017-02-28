<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/adSlot/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_ADSLOT_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告位信息" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_adSlot_1" ></c:set>
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
									<button href="${urlPrev }delete" class="btn btn-palegreen btn-xs "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										查看代码
									</button>
								</sec:authorize>
								
								<sec:authorize ifAllGranted="${rolePrev }DELETE">
									<button href="${urlPrev }sync" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM" >
										同步
									</button>
								</sec:authorize>
							</div>
						</div>
						<div class="widget-body">
						
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
										
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">广告位名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_slot_name"  placeholder="">
								</div>
								</div>
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">目标平台类型 </label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQI_slot_target_floor"  attrs="placeholder=''" cssClass="form-control  select2me"  enumName="t_ad_target_type" tagType="edit" />
								
								</div>
								</div>
						<!-- 
							<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">创建时间</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="datetime_slot_create_time"  type="text" />
						</div>
						</div>
						 -->	
						
							
			
						<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">广告位状态</label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQI_status"  attrs="placeholder=''" cssClass="form-control  select2me"  enumName="t_ad_status" tagType="edit" />
								
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
	 aaSorting: [[5, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'广告位ID',  mData: "slot_id",uxLongText:true},				
			{sTitle:'广告位名称',  mData: "slot_name",uxLongText:true},		
			{sTitle:'广告位状态 ',  mData: "status" ,uxEnum:'t_ad_status'},	
			{sTitle:'目标平台类型 ',mData: "slot_target_floor" ,uxEnum:'t_ad_target_type'},
			{sTitle:'创建时间',  mData: "slot_create_time" , mRender: Common.formatDate},
          {uxCogs:[
	          {name:"查看"}
	         , {
	 			name:'查看代码',
				uri:'viewCode',
				aclsss:'btn btn-xs',
				dataHandler:'MODAL',
				modalSize:'',
				simple:false,
				iclass:'fa fa-info info',
				dataForm:false
			}
          ]}
        ]
	           
 });
});
$('.date-range-picker').datepicker();
</script>
