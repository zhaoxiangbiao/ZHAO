<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adSspDataCount/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADSSPDATACOUNT_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告媒体" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adsspdatacount_1" ></c:set>
<ul id="myTab" class="nav nav-tabs">  
        <li class="active">
        	<a href="#pub" data-toggle="tab" data-handler="DIV" target-div="#pub" url="/ssp/logs/adPub/listPage2${c}" data-active=true >媒体数据</a></li>  
        <li><a href="#pub" data-toggle="tab" data-handler="DIV" target-div="#pub" url="/ssp/logs/adPub/listPage3${c}">站点数据</a></li>  
        <li><a href="#pub" data-toggle="tab" data-handler="DIV" target-div="#pub" url="/ssp/logs/adPub/listPage4${c}">广告位数据</a></li>  
        
        <div class="widget-buttons pull-right">
				 <div class="checkbox" style="margin-right: 15px;">
                    <label>
                        <input id="compare_id" type="checkbox" onclick="changeMode()"  <c:if  test="${c != '' }"> checked="checked" </c:if> >
                        <span class="text">对比</span>
                    </label>
                </div>     
		</div>
</ul>
<div class="tab-content">
	<div class="tab-pane fade in active" id="pub"></div>
<!-- 	<div class="tab-pane" id="site"></div> -->
<!-- 	<div class="tab-pane" id="slot"></div> -->
</div>

