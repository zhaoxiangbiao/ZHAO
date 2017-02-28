<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/everad/logs/lcTask/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_EVERAD_LOGS_LCTASK_" ></c:set>
<c:set scope="page" var="dataTitle" value="任务统计结果表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_everad_logs_lcTask_1" ></c:set>
<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="data-div">
					<div class="widget collapsed " style="margin-bottom:5px;">
			<div class="widget-header ">
				<span class="widget-caption">数据列表</span>
                  <div class="widget-buttons">
                        
                        <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="广告来源" data-form="true">查询</button>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-chevron-down"></i>
                        </a>
                    </div>
<!--                   <div class="widget-buttons buttons-bordered"> -->
<%-- 									<button href="${urlPrev }new" class="btn btn-palegreen btn-xs "  data-handler="INLINE" data-title="${dataTitle }" data-form=true> --%>
<!-- 										新增 -->
<!-- 									</button> -->
<%-- 									<button href="${urlPrev }delete" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes"> --%>
<!-- 										删除 -->
<!-- 									</button> -->
<!-- 							</div> -->
						</div>
						<div class="widget-body">
						
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
																
								<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">任务</label>
									<div class="col-sm-8">
									<input placeholder='' style="width:400px;"  class="form-control select2 " name="filter_EQL_task.id" type="hidden"  result-field="task_des"   lookup-url="${ctx }/everad/conf/task/listJSON" filter="filter_LIKES_task_des" />
									</div>
								</div>
							
	
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">日期</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="datetime_counttime"  type="text" />
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

 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[1, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:false,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [
			{sTitle:'任务',
			  mData: "task" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a  href="${ctx}/everad/conf/task/view?id='+data.id+'"  data-handler="MODAL" data-title="任务">'+data.task_des+'<i class="ace-icon fa fa-external-link"></i></a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },
			{sTitle:'日期',  mData: "counttime" , mRender: Common.formatDate},					
			{sTitle:'推送总数量',  mData: "rs",uxLongText:true},				
			{sTitle:'展示总数量',  mData: "pv",uxLongText:true},				
			{sTitle:'用户数',  mData: "uv",uxLongText:true},				
			{sTitle:'总点击量',  mData: "cli",uxLongText:true},				
			{sTitle:'总关闭数量',  mData: "clo",uxLongText:true},		        
          {uxCogs:[
	          {name:"查看"}
          ]}
        ]
	           
 });
});
</script>
