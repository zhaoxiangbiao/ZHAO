<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/radPubSlotStatDay/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_RADPUBSLOTSTATDAY_" ></c:set>
<c:set scope="page" var="dataTitle" value="媒体收入统计表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_radPubSlotStatDay_1" ></c:set>
<div class="row">
	<div class="col-md-12">
				<div class="data-div">
				<div class="widget no-header ">
					<div class="widget-body">
						<div   style="background: #fff; cursor: pointer; border: 0px solid #ccc;padding: 5px 10px;align-right: 10px;line-height:16px;">		
							<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">	
								<div class="widget-buttons">	
                                    <div id="reservation-pub1"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
						                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
						                  <span >${time } 至   ${time}</span> <b class="caret"></b>
						            </div>    
			                   	</div>
			                   	<input id="-id-datetime_time1" type="hidden" name="datetime_statdate" value="${time } 至   ${time }" />
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
<!-- END ROW CONTENT-->
<script>
$(document).ready(function() {
	//look-up 查询条件 会员 
	 $('.date-picker').datepicker();
	 	var cb = function(start, end, label) {
	        $('#reservation-pub1 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
	        $('#-id-datetime_time1').val(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
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
	      $('#reservation-pub1').daterangepicker(optionSet1,cb);  
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	

 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON?source_slot_id=${source_slot_id}&source_id=${source_id}&dsp_type=${dsp_type}",
	 aaSorting: [[0, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [
			{sTitle:'日期',  mData: "statdate" , mRender: Common.formatDate},								
			{sTitle:'广告位名称',  mData: "slotid.slot_name",uxLongText:true},
			{sTitle:'客户端类型',  mData: "client_type",uxEnum:'t_ad_target_type'},				
			{sTitle:'请求次数',  mData: "request_count",uxLongText:true},				
			{sTitle:'有效请求次数',  mData: "request_success_count",uxLongText:true},				
			{sTitle:'展示次数',  mData: "show_count",uxLongText:true},				
			{sTitle:'点击次数',  mData: "click_count",uxLongText:true},				
			{sTitle:'关闭次数',  mData: "close_count",uxLongText:true},
			
			<form:grant name="price">
			{sTitle:'收入',  mData: "last_income",uxLongText:true},							         
			</form:grant>
        ]
	           
 });
});
</script>
