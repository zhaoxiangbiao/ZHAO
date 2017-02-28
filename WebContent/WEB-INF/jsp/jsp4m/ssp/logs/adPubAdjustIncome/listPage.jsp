<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adPubAdjustIncome/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADPUBADJUSTINCOME_" ></c:set>
<c:set scope="page" var="dataTitle" value="媒体收入调整" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adPubAdjustIncome_1" ></c:set>


<div class="widget radius-bordered">
    <div class="widget-header">
        <span class="widget-caption">【${m}】</span>
        
        <div class="widget-buttons ">
        	总收入：<span style="font-weight: bold;"><fmt:formatNumber groupingUsed="true" value="${sumData.gross_income }"></fmt:formatNumber> </span> 
        	&nbsp;&nbsp;&nbsp;媒体分成：<span style="font-weight: bold;"><fmt:formatNumber groupingUsed="true" pattern="#,#00.00#" maxFractionDigits="2" value="${sumData.net_income }"></fmt:formatNumber></span>
        	&nbsp;&nbsp;&nbsp;媒体最终收入：<span style="font-weight: bold;"><fmt:formatNumber groupingUsed="true" pattern="#,#00.00#" maxFractionDigits="2" value="${sumData.final_income }"></fmt:formatNumber></span>
        	&nbsp;&nbsp;&nbsp;平台服务费：<span style="font-weight: bold;"><fmt:formatNumber groupingUsed="true" pattern="#,#00.00#" maxFractionDigits="2" value="${sumData.service_charge }"></fmt:formatNumber></span>
        	&nbsp;&nbsp;&nbsp;补贴：<span style="font-weight: bold;"><fmt:formatNumber groupingUsed="true" pattern="#,#00.00#" maxFractionDigits="2" value="${sumData.subsidy }"></fmt:formatNumber></span>
            <ul class="pagination pagination-sm" style="margin-left: 15px;margin-top: 3px;">
                <li><a href="/ssp/logs/adPubAdjustIncome/listPage?month=${p}" data-handler='DIV' target-div='#_main-page-body'>«</a></li>
                <li class="active"><a style="cursor: pointer;" id="_income_refresh_current_month" href="/ssp/logs/adPubAdjustIncome/listPage?month=${m}" murl="/ssp/logs/adPubAdjustIncome/listPage?month=${m}"  data-handler='DIV' target-div='#_main-page-body'>${m}</a></li>
                <li><a href="/ssp/logs/adPubAdjustIncome/listPage?month=${n }" data-handler='DIV' target-div='#_main-page-body'>»</a></li>
            </ul>
        </div>
    </div>
    <div class="widget-body">
        <div class="dashboard-box" >
        	<div class="box-days">
        	<div class="row">
           							<c:forEach var="aaa" items="${allDay}">
									<div class=" col-lg-1 col-md-1 col-sm-6 col-xs-12">
                                                    <a   data-container="body" data-titleclass="bordered-info" data-placement="top" data-toggle="popover-hover" data-title="日期:${aaa.stat_date}"
                                                    	<c:if test="${aaa.stating == true}">  data-content="正在结算中..."</c:if>
                                                    	 data-content = "审核完成度:${aaa.complete>100?100:aaa.complete }%<br/>总收入:<fmt:formatNumber groupingUsed="true"  pattern="#,##0.00" maxFractionDigits="2" value="${aaa.gross_income }"></fmt:formatNumber><br/>补贴:<fmt:formatNumber groupingUsed="true" pattern="#,##0.00" maxFractionDigits="2"  value="${aaa.subsidy}"></fmt:formatNumber> "
                                                     	id="_income_stat_date_menue_${aaa.stat_date}" class="day-container "  href="/ssp/logs/rsIncomeSlot/listPage?stat_date=${aaa.stat_date }&stat_month=${m}" onclick="incomeDayMenuClick(this);" stat_date="${aaa.stat_date }" data-handler='DIV' target-div='#div-1'>
                                                        <div class="day">${aaa.day }</div>
                                                        
                                                        <div class="month ${aaa.complete==100?'p100':(aaa.complete==0?'':'p50')}" >${aaa.complete>100?100:aaa.complete }%</div>
                                                        <div class="month " ><fmt:formatNumber groupingUsed="true" pattern="#,##0.00" maxFractionDigits="2"  value="${aaa.gross_income }"></fmt:formatNumber></div>
                                                        <c:if test="${(aaa.subsidy) < 0 }">
                                                        <div class="month " style="color: green;" >
                                                        <fmt:formatNumber groupingUsed="true" pattern="#,##0.00" maxFractionDigits="2"  value="${aaa.subsidy}"></fmt:formatNumber>
                                                        </div>
                                                        </c:if>
                                                        <c:if test="${(aaa.subsidy) >0 }">
                                                        <div class="month "style="color: red;" >+
                                                        <fmt:formatNumber groupingUsed="true" pattern="#,##0.00" maxFractionDigits="2"  value="${aaa.subsidy}"></fmt:formatNumber>
                                                        </div>
                                                        </c:if>
                                                        <c:if test="${!(aaa.subsidy > 0) && !(aaa.subsidy < 0)  }">
                                                        <div class="month "style="color: ;" >
                                                        <fmt:formatNumber groupingUsed="true" pattern="#,##0.00" maxFractionDigits="2"  value="${aaa.subsidy}"></fmt:formatNumber>
                                                        </div>
                                                        </c:if>
                                                        
                                                        
                                                        <c:if test="${aaa.stating == true}">
                                                        <b class="day-pin" ></b>
														</c:if>
                                                    </a>
                                                </div>
									</c:forEach>
        	</div>
        </div>
       </div>
       
       </div>
</div>
        <div class="" id="div-1" style="height: 800px;"></div>



<script type="text/javascript">
function incomeDayMenuClick(t){
	$('#_income_refresh_current_month').attr('href',$('#_income_refresh_current_month').attr('murl')+'&statDate='+$(t).attr('stat_date'));
	
	$('div.box-days').find('a.day-container').removeClass('highlight');
	
	$(t).addClass('highlight');
}
	var timeId;
$(document).ready(function() {
	setTimeout(function(){
		$('#_income_stat_date_menue_${statDate}').click();
	},0)
	
	
	var flushPage = function(){
		var dp = $('div.dashboard-box').find("b.day-pin");
		if(dp && dp.length>0){
			clearTimeout(timeId);
			$('#_income_refresh_current_month').click();
			timeId = setTimeout(flushPage,3000);
		}
	}
	flushPage();
});

</script>
