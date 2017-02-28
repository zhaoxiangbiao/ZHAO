<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/adPubSlotIncomeAdjustDay/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_ADPUBSLOTINCOMEADJUSTDAY_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告位收入结算表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_adPubSlotIncomeAdjustDay_1" ></c:set>
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
							<label  class="col-sm-4 control-label no-padding-right">日期</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="datetime_statdate"  type="text" />
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
			{sTitle:'日期',  mData: "statdate" , mRender: Common.formatDate},					
			{sTitle:'媒体id',  mData: "pub_id",uxLongText:true},				
			{sTitle:'站点id',  mData: "site_id",uxLongText:true},				
			{sTitle:'广告id',  mData: "slot_id",uxLongText:true},				
			{sTitle:'请求次数',  mData: "request_count",uxLongText:true},				
			{sTitle:'有效请求次数',  mData: "request_success_count",uxLongText:true},				
			{sTitle:'展示次数',  mData: "show_count",uxLongText:true},				
			{sTitle:'点击次数',  mData: "click_count",uxLongText:true},				
			{sTitle:'关闭次数',  mData: "close_count",uxLongText:true},				
			{sTitle:'悬浮次数',  mData: "houver_count",uxLongText:true},				
			{sTitle:'分成比例',  mData: "ratio",uxLongText:true},				
			{sTitle:'原始收入',  mData: "income",uxLongText:true},				
			{sTitle:'净收入（应支出）',  mData: "last_income",uxLongText:true},				
			{sTitle:'原始单价',  mData: "cpm",uxLongText:true},				
			{sTitle:'调整后单价',  mData: "cpm_adjust",uxLongText:true},				
			{sTitle:'实际支出',  mData: "pay_adjust",uxLongText:true},				
			{sTitle:'状态 0=初始  1=待审核 2=审核通过 3=审核不同过',  mData: "status",uxLongText:true},		        
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
