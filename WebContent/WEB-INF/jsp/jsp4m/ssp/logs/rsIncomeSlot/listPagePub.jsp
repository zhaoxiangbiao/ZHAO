<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/rsIncomeSlot/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_RSINCOMESLOT_" ></c:set>
<c:set scope="page" var="dataTitle" value="媒体收入汇总" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_rsIncomeSlot_2" ></c:set>

	
<div class="data-div">
					<div class="widget collapsed " style="margin-top:5px;margin-bottom:0px">
						<div class="widget-header ">
							<span id='list-title' class="widget-caption">${stat_date }</span>
							<div class="widget-buttons">
							<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
										<input type="hidden"  name="statDate" value="${stat_date}" >
<!-- 										广告位ID: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_EQI_slot_id"  placeholder=""> -->
<!-- 										广告位名称: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_LIKES_slot_name"  placeholder=""> -->
<!-- 										媒体ID: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_EQI_slot_id"  placeholder=""> -->
										媒体名称: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="pubName"  placeholder="">
										
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
	 sAjaxSource: "${urlPrev }listJSONPub",
	 aaSorting: [[3, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:false,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 uxSumConfig:{
		 title:{
			 text:'总计',
			 cols:[
			 	0
			 ]
		 },
		 hiddenCols:[]
	 },
	 aoColumns: [		
// 			{sTitle:'媒体ID',  mData: "pub_id",uxLongText:true},				
			{sTitle:'媒体名称',  sWidth:'140px', mData: "pub_name",uxLongText:true},				
			{sTitle:'PV',  mData: "pv",uxLongText:true,uxNumber:true},				
			{sTitle:'点击',  mData: "cli",uxLongText:true,uxNumber:true},				
			{sTitle:'毛收入',  mData: "gross_income",uxLongText:true,uxPrice:true},				
			{sTitle:'净收入',  mData: "net_income",uxLongText:true,uxPrice:true},				
			{sTitle:'最终收入',  mData: "final_income",uxLongText:true,uxPrice:true},				
			{sTitle:'平台服务费',  mData: "service_charge",uxLongText:true,uxPrice:true},				
			{sTitle:'补贴',  mData: "subsidy",uxLongText:true,uxPrice:true},				
// 			{sTitle:'最终单价',  mData: "final_price",uxLongText:true,uxPrice:true}			
			
        ]
	           
 });
 
 
});
</script>
