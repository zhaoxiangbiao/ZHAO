<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/mpubPayStatMonth/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_MPUBPAYSTATMONTH_" ></c:set>
<c:set scope="page" var="dataTitle" value="媒体月收入历史明细" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_mpubPayStatMonth_2" ></c:set>
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
		
		<div class="alert alert-info fade in radius-bordered alert-shadowed" style="margin-bottom: 0px;">
           
            <strong>提示:</strong> 每月5日结算上月的收入
        </div>
		<div class="data-div">	
				 <div class="widget-header bordered-bottom bordered-themeprimary">
	                <i class="widget-icon fa fa-tasks themeprimary"></i>
	                <span class="widget-caption themeprimary">历史分成明细</span>       
		           
						<form class="form-inline pull-right form-group" role="form" onsubmit="return false;" id="form_${tableId}">
							<div   style="background: #fff; border: 0px solid #ccc;padding:3px;">
								<input type="text" name="" id="picker_startdate" value="${startDate }" onclick="javascript:thisDate();"/>
								至
								<input type="text" name="" id="picker_enddate" value="${endDate }" onclick="javascript:thisDate();"/>
		
								
								<input id="-id-datetime_time" type="hidden" name="datetime_statdate" value="${startDate } 至   ${endDate }" />
		
								<button style="top:-2px;" href="javascript:;" class="btn btn-blue btn-xs search"  data-title="查询" data-form="true" onclick="javascript:thisDate();">查询</button>
							</div>
						</form>
				</div>	
				
				<div class="widget no-header " style="background: #fff">
					<div class="widget-body">					
						<table class="table table-condensed table-bordered table-hover " id="${tableId }" ></table>
					</div>
					
				</div>
				
		</div>
		<!-- END SAMPLE TABLE PORTLET-->
	</div>
</div>

<script>

$(document).ready(function() {	
	

		$('#picker_startdate').datePicker({
			followOffset:[0, 24],
			altFormat : 'yyyy-mm',
			showMode : 1
		});
		$('#picker_enddate').datePicker({
			followOffset:[0, 24],
			altFormat : 'yyyy-mm',
			showMode : 1
		});
		

	

	thisDate = function(){
		
    	$('#-id-datetime_time').val( $('#picker_startdate').val()+'-01'+'至'+ $('#picker_enddate').val()+'-31');
    //	loadSumIncome($('#picker_startdate').val()+'-01',$('#picker_enddate').val()+'-01');
	}
	thisDate();

	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	

 	TableAjax.init('${tableId}',{
		 sAjaxSource: "${urlPrev }listJSON?pubid=${pubid}",
		 aaSorting: [[0, "desc" ]], // 需要自定义
		 uxUrlPrev:"${urlPrev }",
		 uxDataTitle:"${dataTitle }",
		 uxCheckable:false,
		 uxCloseScroll:true,
		 uxDrapable:false,
		 aoColumns: [
		 		{sTitle:'日期',  mData: "statdate", mRender: Common.formatDate},				
				{sTitle:'发票编号',  mData: "invoicenumber",uxLongText:true},				
				{sTitle:'发票类型',  mData: "invoicetype",uxEnum:'invoiceType'},	
				{sTitle:'税前费用',  mData: "income",uxLongText:true},				
				{sTitle:'代扣税',  mData: "tax",uxLongText:true},				
				{sTitle:'实际收入',  mData: "last_income",uxLongText:true},	
				{sTitle:'审核状态 ',  mData: "checkstatus",uxEnum:'t_pub_income_checkstatus'},//0：待审核,1:初审通过,2:复审通过
				{sTitle:'付款状态 ',  mData: "paystatus",uxEnum:'payStatus'},//0：未支付,1:已支付,2:支付返回
				{sTitle:'付款时间',  mData: "paytime" , mRender: Common.formatDate},			
	        ]          
	 });
});
</script>
