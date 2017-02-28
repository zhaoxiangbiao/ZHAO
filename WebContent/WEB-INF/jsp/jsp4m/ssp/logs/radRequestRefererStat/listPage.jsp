<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/radRequestRefererStat/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_RADREQUESTREFERERSTAT_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告请求来源统计" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_radRequestRefererStat_1" ></c:set>
<%
 
SimpleDateFormat today1 =   new SimpleDateFormat( "yyyy-MM-dd");
 
Calendar theCa = Calendar.getInstance();
theCa.setTime(new Date());
Date date = theCa.getTime();
 
 
Calendar theCa1 = Calendar.getInstance();
theCa1.add(theCa1.DATE,   -1);
Date date1 = theCa1.getTime();
String yesterday=today1.format(date1);
request.setAttribute("yesterday", yesterday);


%>

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
							<input placeholder='' value="${yesterday}" class="form-control date-range-picker " name="datetime_statdate"  type="text" />
						</div>
						</div>
							
			
									<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">媒体</label>
									<div class="col-sm-8">
									<input placeholder='' style="width:100%" class=" select2 " name="filter_EQS_pub_name" type="hidden"  result-field="pub_name"  value-field="pub_name" lookup-url="/ssp/config/adPub/listJSON" filter="filter_LIKES_pub_name" />
									</div>
						</div>
						
						<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">广告位</label>
									<div class="col-sm-8">
									<input placeholder='' style="width:100%" class=" select2 " name="filter_EQS_slot_name"  type="hidden"  result-field="slot_name" value-field="slot_name" lookup-url="/ssp/config/adSlot/listJSON"  filter="filter_LIKES_slot_name" />
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
	 				
			{sTitle:'媒体名称',  mData: "pub_name",uxLongText:true},		
			{sTitle:'站点名',  mData: "site_name",uxLongText:true},				
			{sTitle:'广告位名称',  mData: "slot_name",uxLongText:true},				
			{sTitle:'终端类型',  mData: "client_type_name",uxLongText:true},				
			{sTitle:'广告来源域名',  mData: "referer_host",uxLongText:true},			 		
			{sTitle:'请求次数',  mData: "total",uxLongText:true}
        ]
	           
 });
});
$('.date-range-picker').datepicker();

</script>
