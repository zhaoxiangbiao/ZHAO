<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysLog/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSLOG_" ></c:set>
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
								<label  class="col-sm-4 control-label no-padding-right">登录IP</label>
								<div class="col-sm-8">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_logIp"  placeholder="登录IP">
								</div>
								</div>
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">用户</label>
								<div class="col-sm-8">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_logUser.name"  placeholder="用户">
								</div>
								</div>
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">登录时间（结束）</label>
								<div class="col-sm-8">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LED_logTime"  placeholder="登录时间（结束）">
								</div>
								</div>
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">登录时间（起始）</label>
								<div class="col-sm-8">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_GED_logTime"  placeholder="登录时间（起始）">
								</div>
								</div>
							
						</form>
					</div>
		</div>
				<div class="widget no-header ">
			
					<div class="widget-body">
						<table class="table table-condensed table-bordered table-hover" id="data-table-syslog-1">
						<thead>
									<tr>
										<th>用户</th>
										<th>登录IP</th>
										<th>登录类型</th>
										<th>登录结果</th>
										<th>登录时间</th>
										<th>操作</th>
									</tr>
								</thead>
						</table>
						
					</div>
				</div>
						
						</div>
				
				</div>
	</div>
	<!-- END ROW CONTENT-->
		

<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	 
	_GLOBAL.pushEnum('logType',<tag:enum  enumName="logType" tagType="json" />);
	_GLOBAL.pushEnum('logResultType',<tag:enum  enumName="logResultType" tagType="json" />);
	
	 TableAjax.init('data-table-syslog-1',{
		 "sAjaxSource": _GLOBAL.ctx+"/system/sysLog/listJSON",
		 "aaSorting": [
				[4, "desc" ]
				],
		 "aoColumns": [
		              
		               { 
		            	   "mData": "logUser.username",
		            	   "sDefaultContent": ""    
		               },
		               { "mData": "logIp" },
		               { "mData": "logType"  ,
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('logType',data);
		            	   }
		               },
		               { "mData": "logResultType"  ,
		            	   mRender:function(data){
		            		   return _GLOBAL.getEnum('logResultType',data);
		            	   }
		               },
		               { "mData": "logTime" ,
		            	   "mRender": Common.formatDateTime
		               },
		               { "mData": "id",
		            	 'bSortable': false,
		            	 "sWidth": "20px",
		            	 "mRender": function ( data, type, full ) {
		            		 	 
	                              return '<a href="'+_GLOBAL.ctx+'/system/sysLog/view?id='+data+'" class="btn  btn-xs blue dblclick" data-handler="MODAL" modal-size=500><i class="fa fa-info-circle"></i></a>';
	               	            }
		               }
		             ]
		           
	 });
	 
	

});




</script>