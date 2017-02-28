<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/rsIncomeSlot/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_RSINCOMESLOT_" ></c:set>
<c:set scope="page" var="dataTitle" value="媒体收入汇总" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_rsIncomeSource_1" ></c:set>

	
<div class="data-div">
								<div class="alert alert-warning fade in">
	                                         <button class="close" data-dismiss="alert">
	                                             ×
	                                         </button>
	                                         <i class="fa-fw fa fa-warning"></i>
	                                         <strong>注意</strong> 由于收入分配过程中计算精度(小数点后4位之后的数值被截断)的原因 ,来源收入总计会比媒体收入总计多一些.
	                              </div>

					<div class="widget collapsed " style="margin-top:5px;margin-bottom:0px">
						<div class="widget-header ">
							<span id='list-title' class="widget-caption">${stat_date }</span>
							<div class="widget-buttons">
							<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
										<input type="hidden"  name="statDate" value="${stat_date}" >
<!-- 										广告位ID: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_EQI_slot_id"  placeholder=""> -->
<!-- 										广告位名称: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_LIKES_slot_name"  placeholder=""> -->
<!-- 										媒体ID: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_EQI_slot_id"  placeholder=""> -->
										来源名称: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="sName"  placeholder="">
										
							</form>
							</div>
					              <div class="widget-buttons">
				                        <button id="list_query_btn" href="javascript:;" class="btn btn-blue btn-xs search"  data-title="查询" data-form="true">查询</button>
										
				                     
				                    </div>
						</div>
						<div class="widget-body">
							
						</div>
				</div>
				<div class="widget no-header ">
						<div class="widget-body" id="${tableId }1div">
								<table class="table table-condensed table-bordered table-hover " id="${tableId }">							
								</table>		
						</div>
				</div>	
				
				</div>


<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	//look-up 查询条件 会员 
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	


	
	
 var oTable = TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSONSource",
	 aaSorting: [[5, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:false,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 uxSumConfig:{
		 title:{
			 text:'总计',
			 cols:[
			 	0,1
			 ]
		 },
		 hiddenCols:[4,6,7]
	 },
	 aoColumns: [		
// 			{sTitle:'媒体ID',  mData: "pub_id",uxLongText:true},				
			{sTitle:'来源名称',  sWidth:'200px', mData: "target_name",uxLongText:true},				
			{sTitle:'来源类型',   mData: "target_type",
				mRender:function(data){
					var d ={
						"1":"三方源",
						"2":"三方API",
						"3":"自有DSP"
					};
					return d[data];
				}},				
			{sTitle:'PV',  mData: "pv",uxLongText:true,uxNumber:true},				
			{sTitle:'点击',  mData: "cli",uxLongText:true,uxNumber:true},				
			{sTitle:'点击率',  mData: "cli_ratio",uxLongText:true,uxPrice:true},				
			{sTitle:'收入',  mData: "income",uxLongText:true,uxPrice:true},			
			{sTitle:'CPM',  mData: "cpm",uxLongText:true,uxPrice:true},			
			{sTitle:'CPC',  mData: "cpc",uxLongText:true,uxPrice:true}			
        ]
	           
 });
 
 
});
</script>
