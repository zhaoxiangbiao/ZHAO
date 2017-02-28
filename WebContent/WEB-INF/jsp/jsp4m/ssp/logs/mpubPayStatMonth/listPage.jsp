<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/mpubPayStatMonth/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_MPUBPAYSTATMONTH_" ></c:set>
<c:set scope="page" var="dataTitle" value="媒体月收入结算表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_mpubPayStatMonth_1" ></c:set>
<%
SimpleDateFormat today =   new SimpleDateFormat( "yyyy-MM");
String newDate=today.format(new Date());
Calendar theCa = Calendar.getInstance();
theCa.setTime(new Date());
theCa.set(theCa.DAY_OF_MONTH, 1);
Date date = theCa.getTime();
String yestermonth=today.format(date);
request.setAttribute("endDate", yestermonth);
theCa.add(theCa.DAY_OF_MONTH, -15);
Date date1 = theCa.getTime();
String yesterday=today.format(date1);
request.setAttribute("startDate", yesterday);
%>

<div class="row">
	<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
		<div class="data-div">
				<div class="widget collapsed " style="margin-bottom:5px;">
					<div class="widget-header ">
						<span class="widget-caption">数据列表</span>
		                  <div class="widget-buttons">  
		                        <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="收入分成" data-form="true">查询</button>
		                        <a href="#" data-toggle="collapse">
		                            <i class="fa blue fa-plus"></i>
		                        </a>
		                   </div>
					</div>
					<div class="widget-body">	
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
						
								<input type="hidden" name=""   id="picker_startdate1" value="${startDate }" />
								
								<input type="hidden" name=""   id="picker_enddate1" value="${startDate }" />
								
								<input id="-id-datetime_time1" type="hidden" name="datetime_statdate" value="${startDate } 至   ${startDate }" />
						
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">媒体名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_pub_name"  placeholder="">
								</div>
								</div>

								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">发票编号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_invoicenumber"  placeholder="">
								</div>
								</div>
						
						</form>
					</div>
				</div>
				<div class="widget no-header ">
						<div class="widget-body">
								<table class="table table-condensed table-bordered table-hover " id="${tableId }"></table>		
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
	thisDate = function(){
		
    	$('#-id-datetime_time1').val( $('#picker_startdate1').val()+'-01'+'至'+ $('#picker_enddate1').val()+'-31');
    //	loadSumIncome($('#picker_startdate').val()+'-01',$('#picker_enddate').val()+'-01');
    //	alert($('#picker_startdate').val()+'-01'+'至'+ $('#picker_enddate').val()+'-31');
	}
	thisDate();
	
	
	
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	

 	TableAjax.init('${tableId}',{
		 sAjaxSource: "${urlPrev }listJSON",
		 aaSorting: [[0, "desc" ]], // 需要自定义
		 uxUrlPrev:"${urlPrev }",
		 uxDataTitle:"${dataTitle }",
		 uxCheckable:false,
		 uxCloseScroll:true,
		 uxDrapable:false,
		 aoColumns: [
				{sTitle:'媒体名称',  mData: "pub_name",uxLongText:true},
				{sTitle:'发票编号',  mData: "invoicenumber",uxLongText:true},				
				{sTitle:'发票类型',  mData: "invoicetype",uxEnum:'invoiceType'},	
				{sTitle:'税前费用',  mData: "income",uxLongText:true},				
				{sTitle:'代扣税',  mData: "tax",uxLongText:true},				
				{sTitle:'实际收入',  mData: "last_income",uxLongText:true},
				{sTitle:'审核状态 ',  mData: "checkstatus",uxEnum:'t_pub_income_checkstatus'},//0：待审核,1:初审通过,2:复审通过
				{sTitle:'付款状态 ',  mData: "paystatus",uxEnum:'payStatus'},//0：未支付,1:已支付,2:支付返回
				{sTitle:'付款时间',  mData: "paytime" , mRender: Common.formatDate},
				{sTitle:'操作',
					  mData: "site_id" ,
				 	  mRender:function(data,d,all){
					 	 return  '<a class="blue-stripes" style="margin:20px" data-handler="INLINE" data-title="历史明细" data-form=true  href="${ctx }/ssp/logs/mpubPayStatMonth/listPageMx?id='+all.pub_id+'">历史账单</a>'
					 			 +'|<a class="blue-stripes" style="margin:20px" data-handler="INLINE" data-title="修改" data-form=true  href="${ctx }/ssp/logs/mpubPayStatMonth/edit?id='+all.id+'">修改</a>';
				 	  }
				}
	        ]
		           
	 });
});
</script>
