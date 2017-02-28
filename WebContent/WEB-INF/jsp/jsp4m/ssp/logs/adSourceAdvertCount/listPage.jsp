<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adSourceAdvertCount/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADSOURCEADVERTCOUNT_" ></c:set>
<c:set scope="page" var="dataTitle" value="来源数据统计分析" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adSourceAdvertCount_1" ></c:set>
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
									<button href="${ctx }/ssp/logs/adSourceData/summarizationOfData" class="btn btn-palegreen btn-xs "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										修改
									</button>
						&nbsp;		&nbsp;		
						       
		  
								</sec:authorize>
								
							</div>
						</div>
						<div class="widget-body">
						
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">日期</label>
							<div class="col-sm-8">
							  		<div id="reservation-site"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
						                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
						                  <span >${yestermonth } 至   ${today}</span> <b class="caret"></b>
						            </div>    
									<input id="-id-datetime_time" type="hidden" name="datetime_time" value="${yestermonth } 至   ${today }" />
							
							</div>
						</div>
							
						<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">广告主</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_dvertname"  placeholder="">
								</div>
						</div>

						<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">广告组</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_name"  placeholder="">
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
	$('.date-picker').datepicker();
	var cb = function(start, end, label) {
	    $('#reservation-site span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
	    $('#-id-datetime_time').val(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
	   // loadChartData();
	};

 	 var optionSet1 = {
//     startDate: moment().subtract(29, 'days'),
    startDate: moment(),
    endDate: moment(),
//     minDate: '',
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
  $('#reservation-site').daterangepicker(optionSet1,cb);  
	//look-up 查询条件 会员 
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
			{sTitle:'日期',  mData: "time" , mRender: Common.formatDate},	
			{sTitle:'广告主',  mData: "dvertname",uxLongText:true},				
			{sTitle:'广告组',  mData: "name",uxLongText:true},				
			{sTitle:'类别',  mData: "dsp_type",uxEnum:'dsp_type'},
			
			<form:grant name="price">
			{sTitle:'收入',  mData: "income",uxLongText:true},		        
			</form:grant>
			
			{sTitle:'自有请求',  mData: "request",uxLongText:true},				
			{sTitle:'自有展示',  mData: "show",uxLongText:true},				
			{sTitle:'自有点击',  mData: "click",uxLongText:true},				
			{sTitle:'自有点击率',  mData: "ctr",uxLongText:true},				
			{sTitle:'第三方展示',  mData: "lastpv",uxLongText:true},				
			{sTitle:'第三方点击',  mData: "lastclick",uxLongText:true},				
			{sTitle:'第三方点击率',  mData: "lastctr",uxLongText:true},				
			{sTitle:'操作',
				  mData: "id" ,
			 	  mRender:function(data,d,all){
				 	 return  '<a class="blue-stripes" style="margin:20px" data-handler="MODAL" data-title="查看详情" data-form=true  href="${ctx }/ssp/logs/radPubSlotStatDay/listPage?time='+Common.formatDate(all.time)+'&source_slot_id='+all.source_slot_id+'&source_id='+all.source_id+'&dsp_type='+all.dsp_type+'">查看详情</a>'
			 	  }
			}
        ]
	           
 });
});
</script>
