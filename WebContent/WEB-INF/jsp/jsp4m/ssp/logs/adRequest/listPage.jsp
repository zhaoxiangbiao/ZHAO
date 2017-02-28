<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adRequest/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADREQUEST_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告请求" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adRequest_1" ></c:set>
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
                  <div class="widget-buttons">
                        
                       <sec:authorize ifAllGranted="${rolePrev }DELETE">
									<button onclick="$('#form_${tableId}').submit();" class="btn btn-xs btn-darkorange "  >
										导出
									</button>
								</sec:authorize>
                    </div>
                  
						</div>
						<div class="widget-body">
						
						<form class="form-inline" role="form"  id="form_${tableId}"  method="post" target="_BLANK" action="${urlPrev }exportExcel" >
								<input type="hidden" name="excelName" value="${dataTitle }">
								<input type="hidden" name="sheetName" value="${dataTitle }">
								<input type="hidden" name="title" value="${dataTitle }">
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">日期</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="action_time"  type="text" />
						</div>
						</div>
						
						<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">媒体</label>
									<div class="col-sm-8">
									<input placeholder='' style="width:100%" class=" select2 " name="filter_EQI_pub_id" type="hidden"  result-field="pub_name"  value-field="pub_id" lookup-url="${ctx }/ssp/config/adPub/listJSON" filter="filter_LIKES_pub_id" />
									</div>
						</div>
						
						<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">广告位</label>
									<div class="col-sm-8">
									<input placeholder='' style="width:100%" class=" select2 " name="filter_EQI_slot_id"  type="hidden"  result-field="slot_name" value-field="slot_id" lookup-url="${ctx }/ssp/config/adSlot/listJSON"  filter="filter_LIKES_slot_id" />
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
	 aaSorting: [[0, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:false,
	 uxCloseScroll:false,
	 uxDrapable:false,
	 aoColumns: [
			{sTitle:'时间',  mData: "action_time" , mRender: Common.formatDateTime},					
			//{sTitle:'广告物料ID',  mData: "advert_id",uxLongText:true},				
// 			{sTitle:'',  mData: "client_id",uxLongText:true},				
			//{sTitle:'媒体',  mData: "pub_id.pub_name",uxLongText:true},	
			
			{sTitle:'媒体',mData: "pub_id" ,uxLongText:true},
			
			{sTitle:'广告位',  mData: "slot_id",uxLongText:true},	
			
/* 			{sTitle:'广告位',
				  mData: "slot_id" ,
			 	  mRender:function(data){
			 		  if(data && data.id){
			 		  	  return '<a  href="${ctx}/ssp/config/adSlot/view?id='+data.id+'"  data-handler="MODAL" data-title="广告位">'+data.slot_name+'<i class="ace-icon fa fa-external-link"></i></a>'
			 		  }else{
			 			  return data;
			 		  }
			 	  }
			 }, */
// 			{sTitle:'广告位尺寸',  mData: "ad_size",uxLongText:true},				
// 			{sTitle:'内网ip',  mData: "intranet_ip",uxLongText:true},				
// 			{sTitle:'外网IP',  mData: "client_ip",uxLongText:true},				
// 			{sTitle:'客户端浏览器类型',  mData: "browser_type",uxLongText:true},				
// 			{sTitle:'客户端浏览器语言',  mData: "browser_language",uxLongText:true},				
			{sTitle:'终端类型',  mData: "client_type",uxEnum:'t_ad_target_type'},				
// 			{sTitle:'终端分辨率',  mData: "client_resolution",uxLongText:true},				
// 			{sTitle:'操作系统类型',  mData: "os_type",uxLongText:true},				
// 			{sTitle:'是否支持cookie',  mData: "allow_cookie",uxLongText:true},				
// 			{sTitle:'是否成功',  mData: "success",uxLongText:true},				
			{sTitle:'广告所在URL地址',  mData: "referer",mRender:function(value){
				if(value){
					return Common.cutText(value,50);
				}else{
					return "无";
				}
			}},				
			{sTitle:'搜狐统计ip',  mData: "sohu_ip",uxLongText:true},				
			{sTitle:'搜狐统计城市',  mData: "sohu_city",uxLongText:true},				
			//{sTitle:'',  mData: "source_solt_id",uxLongText:true},				
			//{sTitle:'',  mData: "source_id",uxLongText:true},		        
          {uxCogs:[
	          {name:"查看"}
          ]}
        ]
	           
 });
});

$('.date-range-picker').datepicker();
</script>
