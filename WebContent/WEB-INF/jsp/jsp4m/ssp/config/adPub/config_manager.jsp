<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/adPub/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_ADPUB_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告媒体" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_adPub_1" ></c:set>
<ul id="myTab" class="nav nav-tabs">  
        <li class="active"><a href="#pub" data-toggle="tab" data-handler="DIV" target-div="#pub" url="/ssp/config/adPub/listPage" data-active=true >媒体</a></li>  
        <li><a href="#site" data-toggle="tab" data-handler="DIV" target-div="#site" url="/ssp/config/adSite/listPage">站点</a></li>  
        <li><a href="#slot" data-toggle="tab" data-handler="DIV" target-div="#slot" url="/ssp/config/adSlot/listPage">广告位</a></li>  
</ul>
<div class="tab-content">
	<div class="tab-pane fade in active" id="pub"></div>
	<div class="tab-pane" id="site"></div>
	<div class="tab-pane" id="slot"></div>
</div>

