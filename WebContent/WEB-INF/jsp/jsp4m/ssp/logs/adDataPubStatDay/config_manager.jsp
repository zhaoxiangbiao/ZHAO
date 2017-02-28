<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adDataPubStatDay/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADDATAPUBSTATDAY_" ></c:set>
<c:set scope="page" var="dataTitle" value="收入报表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adDataPubStatDay_1" ></c:set>
<ul id="myTab" class="nav nav-tabs">  
        <li class="active">
        	<a href="#source" data-toggle="tab" data-handler="DIV" target-div="#source" url="/ssp/logs/adDataSourceStatDay/listPage?statDate=${statDate}" data-active=true >收入来源</a></li>  
        <li><a href="#pub" data-toggle="tab" data-handler="DIV" target-div="#pub" url="/ssp/logs/adDataPubStatDay/listPage?statDate=${statDate}">收入分成</a></li>  
        
</ul>
<div class="tab-content">
	<div class="tab-pane fade in active" id="source"></div>
	<div class="tab-pane" id="pub"></div>
</div>

<script>
App.initAjax();
</script>