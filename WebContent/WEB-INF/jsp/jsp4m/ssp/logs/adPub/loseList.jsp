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
<c:set scope="page" var="tableId" value="data_table_ssp_logs_loseList" ></c:set>
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
							<div class="widget-buttons">
							<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
										<div class="widget-buttons ">	
					<input type="hidden" id="clientTypeLoseList" name=clientType value="0" >
					<input type="hidden"  name="tableType" value="${tt}" >
					<input type="hidden" id="startDateLoseList" name="startDate" value="" >
					<input type="hidden" id="endDateLoseList" name="endDate" value="" >
						 <div class="">
<!-- 								<label class="control-label">终端类型：</label> -->
                                       <div class="radio">
                                           <label>
                                               <input name="clientTypeLoseList"  type="radio" checked="checked"  onclick="javascript:loadLoseList(this);" value="0" >
                                               <span class="text">全部 </span>
                                           </label>
                                       </div>
                                       <div class="radio">
                                           <label>
                                               <input name="clientTypeLoseList"   type="radio" value="1"   onclick="javascript:loadLoseList(this);" >
                                               <span class="text">PC </span>
                                           </label>
                                       </div>
                                       <div class="radio">
                                             <label>
                                                 <input name="clientTypeLoseList"   type="radio" value="2"  onclick="javascript:loadLoseList(this);" >
                                                 <span class="text">移动</span>
                                             </label>
                                       </div>
						</div>                                  
					 </div>
										<div class="widget-buttons" id="reservationDiv" >	
				                                 <div id="reservation-LoseList"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
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
var LoseListTable;
function loadLoseList(t){
	$('#clientTypeLoseList').val(t.value);
	LoseListTable.fnDraw();
}
$(document).ready(function() {
	
 	var cb = function(start, end, label) {
        $('#reservation-LoseList span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
        $('#startDateLoseList').val(start.format('YYYY-MM-DD'));
        $('#endDateLoseList').val(end.format('YYYY-MM-DD'));
        LoseListTable.fnDraw();
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
      $('#reservation-LoseList').daterangepicker(optionSet1,cb);  
      $('#reservation-LoseList span').html(moment().subtract(0, 'days').format('YYYY-MM-DD') + ' 至 ' + moment().format('YYYY-MM-DD'));
      $('#startDateLoseList').val(moment().subtract(0, 'days').format('YYYY-MM-DD'));
      $('#endDateLoseList').val(moment().format('YYYY-MM-DD'));
 	
      LoseListTable = TableAjax.init('${tableId}4',{
					 sAjaxSource: "${urlPrev }loseListJson",
					 aaSorting: [[1, "desc" ]], // 需要自定义
					 uxUrlPrev:"${urlPrev }",
					 uxDataTitle:"${dataTitle }",
					 uxCheckable:false,
					 uxCloseScroll:true,
					 uxDrapable:false,
					 aoColumns: [		
					         	
// 									{sTitle:'${ttName}id',  mData: "${tt}_id",bSortable:false,sWidth:"100px"},			
// 									{sTitle:'${ttName}名称',  mData: "${tt}_name",bSortable:true,uxCutText:10,sWidth:"150px"},				
									{sTitle:'状态',mData: "status" ,mRender:function(data,d,all){
	 									return data+"【"+requestStatus[data]+"】";
		 							}},
// 									{sTitle:'终端类型',mData: "client_type" ,mRender:function(data,d,all){
// 	 									return data==1?'PC':'移动';
// 		 							}},
									{sTitle:'数量',mData: "count" ,uxNumber:true}
				     ]
			 	});
			
	 });    
</script>