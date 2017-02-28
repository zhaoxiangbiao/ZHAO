<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysOperLog/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSOPERLOG_" ></c:set>
<c:set scope="page" var="dataTitle" value="日志信息" ></c:set>
<c:set scope="page" var="tableId" value="data-table-system-sysLog-1" ></c:set>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
	<div class="row">
				<div class="col-md-12">
					
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
                 
			</div>
						
				<div class="widget-body" >		
						<form class="form-inline" role="form" onsubmit="return false;">
						
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">登录账号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_operUser.username"  placeholder="登录账号">
									
								</div>
								</div>
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">操作时间</label>
								<div class="col-sm-8">
									<div id="reservation"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
						                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
						                  <span> </span> <b class="caret"></b>
						                  <input  type="hidden" name="datetime_createTime" value="" /> 
						            </div>
								</div>
								</div>
							
						</form>
					</div>
		</div>
						
				<div class="widget no-header ">
			
					<div class="widget-body">
						
						
						<table class="table table-condensed table-bordered table-hover" id="data-table-sysOperLog-1">
								<thead>
									<tr>
										<th>登录账号</th>
										<th>用户</th>
										<th>操作动作</th>
										<th>操作模块</th>
										<th>操作结果</th>
										<th>用户IP</th>
										<th>操作时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody></tbody>
						</table>
						
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
	</div>
</div>
	<!-- END ROW CONTENT-->
		

<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	 

	 TableAjax.init('data-table-sysOperLog-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/system/sysOperLog/listJSON",
		 "aaSorting": [
						[6, "desc" ]
						],
		 "aoColumns": [
		              
		               { 
		            	   "mData": "operUser.username",
		            	   "sDefaultContent": "无" 
		            	   
		               },
		               { 
		            	   "mData": "operUser.name",
		            	   "sDefaultContent": "无" 
		            	   
		               },
		               { "mData": "operAction" },
		               { "mData": "operModule" },
		               { "mData": "operResult" },
		               { "mData": "ip" },
		               { "mData": "createTime" ,
		            	   "mRender": Common.formatDateTime
		               },
		               { "mData": "id",
		            	 'bSortable': false,
		            	 "sWidth": "20px",
		            	 "mRender": function ( data, type, full ) {
		            		 	 
	                              return '<a href="'+_GLOBAL.ctx+'/system/sysOperLog/view?id='+data+'" class="btn  btn-xs blue dblclick" data-handler="MODAL"><i class="fa fa-info-circle"></i></a>';
	               	            }
		               }
		             ]
		           
	 });
	 
	
	 
	 var cb = function(start, end, label) {
	        $('#reservation span').html(start.format('YYYY-MM-DD') + '至' + end.format('YYYY-MM-DD'));
	        $('#reservation input').val(start.format('YYYY-MM-DD') + '至' + end.format('YYYY-MM-DD'));
	       // loadChartData();
	      };

	      var optionSet1 = {
//	         startDate: moment().subtract(29, 'days'),
// 	        startDate: moment(),
// 	        endDate: moment(),
//	         minDate: '',
	         maxDate: moment().subtract(0, 'days'),
	        dateLimit: { days: 60 },
	        showDropdowns: true,
	        showWeekNumbers: true,
	        timePicker: true,
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
	        separator: '至',
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
	      $('#reservation').daterangepicker(optionSet1,cb);  

});


</script>