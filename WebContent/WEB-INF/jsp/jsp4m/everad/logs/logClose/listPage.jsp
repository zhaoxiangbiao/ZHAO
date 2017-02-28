<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<%
SimpleDateFormat today =   new SimpleDateFormat( "yyyy-MM-dd");
String newDate=today.format(new Date());
request.setAttribute("today", newDate);

%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/everad/logs/logClose/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_EVERAD_LOGS_LOGCLOSE_" ></c:set>
<c:set scope="page" var="dataTitle" value="关闭日志表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_everad_logs_logClose_1" ></c:set>
<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="data-div">
					<div class="widget collapsed " style="margin-bottom:5px;">
			<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
			<div class="widget-header ">
				<span class="widget-caption">数据列表</span>
				
				<div class="widget-buttons">
							<div class="widget-buttons" id="reservationDiv" >	
	                                 <div id="reservation-daily"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
						                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
						                  <span> ${today }</span> <b class="caret"></b>
						            </div>        
	                   		</div>
							
					</div>
                  <div class="widget-buttons">
                        
                        <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="广告来源" data-form="true">查询</button>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-chevron-down"></i>
                        </a>
                    </div>
						</div>
						<div class="widget-body">
						
						<input id="action_time" class="form-control date-range-picker " name="action_time"  type="hidden" value="${today }" />
							
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">账号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_EQL_phone_number"  placeholder="">
								</div>
								</div>
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">任务ID</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_EQL_taskid"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">终端类型</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_terminal"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">域名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_domain"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">url地址</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_url"  placeholder="">
								</div>
								</div>
							
			
			
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">UA</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_ua"  placeholder="">
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
	//look-up 查询条件 会员 
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	
	var cb3 = function(start, end, label) {
        $('#reservation-daily span').html(start.format('YYYY-MM-DD'));
        $('#action_time').val(start.format('YYYY-MM-DD'));
        $('.btn.search').click();
      };

      var optionSet3 = {
  			singleDatePicker:true,
  			currentText: 'Now',
  	        format: 'YYYY-MM-DD',
  	        locale: {
  	            daysOfWeek: ['日', '一', '二', '三', '四', '五','六'],
  	            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
  	            firstDay: 1
  	        }
  	      };
      $('#reservation-daily').daterangepicker(optionSet3,cb3);  
 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[0, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:false,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
		    {sTitle:'请求时间',sWidth:"150px", mData: "action_time" , mRender: Common.formatDateTime},					
			{sTitle:'账号', sWidth:"120px", mData: "phone_number",uxLongText:true},		
			{sTitle:'ip',  mData: "ip",uxLongText:true},
			{sTitle:'终端类型', sWidth:"100px", mData: "ct",uxEnum:'ea_target_platform'},				
			/* {sTitle:'域名',  mData: "domain",uxLongText:true}, */				
			{sTitle:'url地址',  mData: "url",uxLongText:true},				
			/* {sTitle:'推送状态 ',  mData: "status",uxLongText:true},				
			{sTitle:'任务id',  mData: "taskid",uxLongText:true},				
			{sTitle:'UA',  mData: "ua",uxLongText:true},				
			{sTitle:'序列号',  mData: "sn",uxLongText:true},		 */        
          {sTitle:'操作',
				sWidth:"50px",
				uxCogs:[
	          {name:"查看"}
	        /*   <sec:authorize ifAllGranted="${rolePrev }EDIT">
	          ,{name:"修改"}
	          </sec:authorize>
	          <sec:authorize ifAllGranted="${rolePrev }DELETE"> 
	          ,{name:"删除"}
	          </sec:authorize> */
          ]}
        ]
	           
 });
});
</script>
