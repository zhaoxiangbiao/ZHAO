<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<ul id="myTab-sourceListPage" class="nav nav-tabs">  
        <li class="active">
        <a href="#ss1-page" data-toggle="tab" data-handler="DIV" target-div="#ss1-page" url="/ssp/logs/rsIncomeSlot/sourceList1?slotId=${slotId }&statDate=${statDate}" data-active=true >三方源</a></li>  
        <li><a href="#ss2-page" data-toggle="tab" data-handler="DIV" target-div="#ss2-page" url="/ssp/logs/rsIncomeSlot/sourceList2?slotId=${slotId }&statDate=${statDate}">三方DSP</a></li>  
        <li><a href="#ss3-page" data-toggle="tab" data-handler="DIV" target-div="#ss3-page" url="/ssp/logs/rsIncomeSlot/sourceList3?slotId=${slotId }&statDate=${statDate}">自有DSP</a></li>  
        
        <div class="widget-buttons pull-right">
<%-- 				<button href="${ctx }/ssp/logs/adSlotCount/countNow" class="btn btn-blue btn-xs "  data-handler="CONFIRM" >统计实时数据</button>	 --%>
		</div>
</ul>
<div class="tab-content">
	<div class="tab-pane fade in active" id="ss1-page"></div>
	<div class="tab-pane " id="ss2-page"></div>
	<div class="tab-pane " id="ss3-page"></div>
</div>

<script>

$(document).ready(function() {
	App.initAjax();
});
</script>