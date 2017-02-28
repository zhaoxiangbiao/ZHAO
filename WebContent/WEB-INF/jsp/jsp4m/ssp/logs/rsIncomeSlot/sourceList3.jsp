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
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adPub_SS3" ></c:set>
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
					<input type="hidden" id="clientTypeSS3" name=clientType value="0" >
					<input type="hidden"  name="tableType" value="slot" >
					<input type="hidden" id="startDateSS3" name="startDate" value="${statDate }" >
					<input type="hidden" id="endDateSS3" name="endDate" value="${statDate }" >
<!-- 						 <div class=""> -->
<!-- 								<label class="control-label">终端类型：</label>  -->
<!--                                        <div class="radio"> -->
<!--                                            <label> -->
<!--                                                <input name="clientTypeSS3"  type="radio" checked="checked"  onclick="javascript:loadSS3(this);" value="0" > -->
<!--                                                <span class="text">全部 </span> -->
<!--                                            </label> -->
<!--                                        </div> -->
<!--                                        <div class="radio"> -->
<!--                                            <label> -->
<!--                                                <input name="clientTypeSS3"   type="radio" value="1"   onclick="javascript:loadSS3(this);" > -->
<!--                                                <span class="text">PC </span> -->
<!--                                            </label> -->
<!--                                        </div> -->
<!--                                        <div class="radio"> -->
<!--                                              <label> -->
<!--                                                  <input name="clientTypeSS3"   type="radio" value="2"  onclick="javascript:loadSS3(this);" > -->
<!--                                                  <span class="text">移动</span> -->
<!--                                              </label> -->
<!--                                        </div> -->
<!-- 						</div>                                   -->
					 </div>
<!-- 										<div class="widget-buttons" >	 -->
<!-- 				                                 <div id="reservation-SS3"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;"> -->
<!-- 									                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i> -->
<%-- 									                  <span>${today } 至   ${today }</span> <b class="caret"></b> --%>
<!-- 									            </div>         -->
<!-- 				                   		</div> -->
										
										<input type="hidden"  style="height:26px;margin-top:-1px;" class="form-control  " name="itemId" value="${slotId }" placeholder="">
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
function loadSS3(t){
	$('#clientTypeSS3').val(t.value);
	dailyTable.fnDraw();
}
$(document).ready(function() {

 	
      dailyTable = TableAjax.init('${tableId}4',{
					 sAjaxSource: "${urlPrev }ss3Json",
					 aaSorting: [[5, "desc" ]], // 需要自定义
					 uxUrlPrev:"${urlPrev }",
					 uxDataTitle:"${dataTitle }",
					 uxCheckable:false,
					 uxCloseScroll:true,
					 uxDrapable:false,
					 uxSumConfig:{
						 title:{
							 text:'总计',
							 cols:[
							 	0,1
							 ]
						 },
						 hiddenCols:[]
					 },
					 aoColumns: [		
									{sTitle:'创意ID',mData: "creative_id" },
									{sTitle:'创意',mData: "creative_name" },
									{sTitle:'广告主',mData: "advert_name" },
									{sTitle:'计划',mData: "plan_name" },
									{sTitle:'策略',mData: "scheme_name" },
// 									{sTitle:'终端类型',mData: "client_type" ,mRender:function(data,d,all){
// 	 									return data==1?'PC':'移动';
// 		 							}},
									{sTitle:'展示(PV)',mData: "pv" ,uxNumber:true},
									{sTitle:'点击',mData: "cli" ,uxNumber:true},
									{sTitle:'点击率(%)',mData: "rate" ,uxNumber:true},
									{sTitle:'流量质量',mData: "qua" ,uxPrice:true},
									{sTitle:'分成收入',mData: "income" ,uxPrice:true}
				     ]
			 	});
			
	 });    
</script>