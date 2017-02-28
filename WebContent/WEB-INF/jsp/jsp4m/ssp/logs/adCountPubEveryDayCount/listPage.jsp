<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adCountPubEveryDayCount/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADCOUNTPUBEVERYDAYCOUNT_" ></c:set>
<c:set scope="page" var="dataTitle" value="站点每日明细" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adCountPubEveryDayCount_1" ></c:set>
<%
SimpleDateFormat today =   new SimpleDateFormat( "yyyy-MM-dd");
String newDate=today.format(new Date());
request.setAttribute("today", newDate);
Calendar theCa = Calendar.getInstance();
theCa.setTime(new Date());
theCa.add(theCa.DATE, -30);
Date date = theCa.getTime();
String yestermonth=today.format(date);
request.setAttribute("yestermonth", yestermonth);
Calendar theCa1 = Calendar.getInstance();
theCa1.add(theCa1.DATE,   -1);
Date date1 = theCa1.getTime();
String yesterday=today.format(date1);
request.setAttribute("yesterday", yesterday);
%>
<div class="row">
	<div class="col-md-12">
			<div class="data-div">
				<div class="widget no-header ">
					<div class="widget-body">
						<div   style="background: #fff; cursor: pointer; border: 0px solid #ccc;padding: 5px 10px;align-right: 10px;line-height:16px;">		
							<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">	
								<div class="widget-buttons">	
                                       <div id="reservation-pub"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
						                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
						                  <span >${yestermonth } 至   ${today}</span> <b class="caret"></b>
						            </div>    
						            
						                
			                   	</div>
			                   	<input id="-id-datetime_time" type="hidden" name="datetime_date" value="${yestermonth } 至   ${today }" />
			                   	 <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="查询" data-form="true">查询</button>			 
							</form>
						</div>
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">							
						</table>		
					</div>
				</div>	
			</div>
						
		</div>
</div>		

<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	//look-up 查询条件 会员 
	 $('.date-picker').datepicker();
	 	var cb = function(start, end, label) {
	        $('#reservation-pub span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
	        $('#-id-datetime_time').val(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
	       // loadChartData();
	      };

	      var optionSet1 = {
//	         startDate: moment().subtract(29, 'days'),
	        startDate: moment(),
	        endDate: moment(),
//	         minDate: '',
	         maxDate: moment().subtract(0, 'days'),
	        dateLimit: { days: 365 },
	        showDropdowns: true,
	        showWeekNumbers: true,
	        timePicker: false,
	        ranges: {
	           '今天': [moment(), moment()],
	           '昨天': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	           '最近 7 天': [moment().subtract(6, 'days'), moment()],
	           '最近 30 天': [moment().subtract(29, 'days'), moment()],
	           '本月 ': [moment().startOf('month'), moment().endOf('month')],
	           '上月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	        },
	        opens: 'left',
	        buttonClasses: ['btn btn-green'],
	        applyClass: 'btn-sm btn-primary',
	        cancelClass: 'btn-sm',
	        format: 'YY/MM/DD',
	        separator: ' 到 ',
	        locale: {
	            applyLabel: '确定',
	            cancelLabel: '取消',
	            fromLabel: '开始',
	            toLabel: '结束',
	            customRangeLabel: '自定义',
	            daysOfWeek: ['日', '一', '二', '三', '四', '五','六'],
	            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
	            firstDay: 1
	        }
	      };
	      $('#reservation-pub').daterangepicker(optionSet1,cb);  
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
			{sTitle:'日期',  mData: "date" , mRender: Common.formatDate},					
			{sTitle:'媒体名称',  mData: "pubname",uxLongText:true},				
			{sTitle:'请求量',  mData: "request",uxLongText:true},				
			{sTitle:'展示量',  mData: "show",uxLongText:true},				
			{sTitle:'点击量',  mData: "click",uxLongText:true},				
			{sTitle:'点击率',  mData: "ctr",uxLongText:true},	
			<form:grant name="price">
			{sTitle:'收入',  mData: "income",uxLongText:true},	
			</form:grant>
			
        ]
	           
 });
});
</script>
