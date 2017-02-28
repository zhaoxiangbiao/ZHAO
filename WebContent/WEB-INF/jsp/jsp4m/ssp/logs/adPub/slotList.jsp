<%@page import="java.util.Calendar"%>
<%@page import="com.junfu360.common.utils.AdDateUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adPub/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADPUB_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告媒体" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adPub_SS1" ></c:set>
<%
SimpleDateFormat today =   new SimpleDateFormat( "yyyy-MM-dd");
String newDate=today.format(new Date());
request.setAttribute("today", newDate);
String date2 = AdDateUtil.getYesterday("yyyy-MM-dd");
request.setAttribute("date2", date2);
// request.setAttribute("tt", "pub");
// request.setAttribute("ttName", "媒体");

int maxHour = 23;
Calendar calendar = Calendar.getInstance();
   calendar.setTime(new Date());
   maxHour = calendar.get(Calendar.HOUR_OF_DAY)-1;
   request.setAttribute("maxHour",maxHour);

%>

<div class="row">
	<div class="col-md-12">
	<div class="data-div">
					
			
				<div class="widget collapsed " style="margin-top:5px;margin-bottom:0px">
						<div class="widget-header ">
							<span class="widget-caption">数据列表</span>
							<div class="widget-buttons">
							<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
										<div class="widget-buttons " style="display: none;">	
					<input type="hidden" id="clientTypeSS1" name=clientType value="0" >
					<input type="hidden"  name="tableType" value="${tt}" >
					<input type="hidden" id="startDateSS1" name="startDate" value="" >
					<input type="hidden" id="endDateSS1" name="endDate" value="" >
						 <div class="" style="display: none;">
<!-- 								<label class="control-label">终端类型：</label> -->
                                       <div class="radio">
                                           <label>
                                               <input name="clientTypeSS1"  type="radio" checked="checked"  onclick="javascript:loadSS1(this);" value="0" >
                                               <span class="text">全部 </span>
                                           </label>
                                       </div>
                                       <div class="radio">
                                           <label>
                                               <input name="clientTypeSS1"   type="radio" value="1"   onclick="javascript:loadSS1(this);" >
                                               <span class="text">PC </span>
                                           </label>
                                       </div>
                                       <div class="radio">
                                             <label>
                                                 <input name="clientTypeSS1"   type="radio" value="2"  onclick="javascript:loadSS1(this);" >
                                                 <span class="text">移动</span>
                                             </label>
                                       </div>
						</div>                                  
					 </div>
										<div class="widget-buttons" >	
				                                 <div id="reservation-slot"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
									                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
									                  <span>${today } 至   ${today }</span> <b class="caret"></b>
									            </div>        
				                   		</div>
										
										<input type="hidden"  style="height:26px;margin-top:-1px;" class="form-control  " name="itemId" value="${itemId }" placeholder="">
<!-- 										媒体名称: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="itemName"  placeholder=""> -->
										
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
						<div class="widget-body" id="${tableId }4div">
								<table class="table table-condensed table-bordered table-hover " id="${tableId }4">							
								</table>		
						</div>
						
				</div>	
			</div>
	</div>
					<!-- END SAMPLE TABLE PORTLET-->
</div>
<script>
var dailyTable;
function loadSS1(t){
	$('#clientTypeSS1').val(t.value);
	dailyTable.fnDraw();
}
$(document).ready(function() {
	
 	var cb = function(start, end, label) {
        $('#reservation-slot span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
        $('#startDateSS1').val(start.format('YYYY-MM-DD'));
        $('#endDateSS1').val(end.format('YYYY-MM-DD'));
        dailyTable.fnDraw();
      };

      var optionSet1 = {
        startDate: moment().subtract(0, 'days'),
        endDate: moment(),
//         minDate: '',
//         maxDate: '12/31/2015',
        dateLimit: { days: 60 },
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
        buttonClasses: ['btn btn-default'],
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
      $('#reservation-slot').daterangepicker(optionSet1,cb);  
      $('#reservation-slot span').html(moment().subtract(0, 'days').format('YYYY-MM-DD') + ' 至 ' + moment().format('YYYY-MM-DD'));
      $('#startDateSS1').val(moment().subtract(0, 'days').format('YYYY-MM-DD'));
      $('#endDateSS1').val(moment().format('YYYY-MM-DD'));
 	
      dailyTable = TableAjax.init('${tableId}4',{
					 sAjaxSource: "${urlPrev }slotJson",
					 aaSorting: [[2, "desc" ]], // 需要自定义
					 uxUrlPrev:"${urlPrev }",
					 uxDataTitle:"${dataTitle }",
					 uxCheckable:false,
					 uxCloseScroll:true,
					 uxDrapable:false,
					 aoColumns: [		
									{sTitle:'广告位ID',mData: "slot_id" },
									{sTitle:'广告位',mData: "slot_name" },
// 									{sTitle:'终端类型',mData: "client_type" ,mRender:function(data,d,all){
// 	 									return data==1?'PC':'移动';
// 		 							}},
									{sTitle:'展示(PV)',mData: "pv" ,uxNumber:true},
									{sTitle:'点击',mData: "cli" ,uxNumber:true},
									{sTitle:'点击率(%)',mData: "rate" ,uxNumber:true}
// 									{sTitle:'UV',mData: "uv" ,uxNumber:true},
// 									{sTitle:'IP',mData: "ip" ,uxNumber:true}
				     ]
			 	});
			
	 });    
</script>