<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/sysconf/sysConfType/"></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSCONF_SYSCONFTYPE_"></c:set>
<c:set scope="page" var="dataTitle" value="配置类型"></c:set>
<c:set scope="page" var="tableId"
	value="data-table-sysconf-sysConfType-1"></c:set>
<div class="row">
	<div class="col-md-12">
		<div class="data-div">

			<div class="widget collapsed " style="margin-bottom: 5px;">
				<div class="widget-header ">
					<span class="widget-caption">数据列表</span>
					<div class="widget-buttons">

						<button href="javascript:;" class="btn btn-blue btn-xs search"
							data-title="广告来源" data-form="true">查询</button>
						<a href="#" data-toggle="collapse"> <i class="fa blue fa-plus"></i>
						</a>
					</div>
					<div class="widget-buttons buttons-bordered">

						<button href="${urlPrev }/new" class="btn btn-palegreen btn-xs"
							data-handler="INLINE" data-title="广告来源" data-form="true">
							新增</button>


						<button href="${urlPrev }/delete"
							class="btn btn-darkorange btn-xs" data-handler="CONFIRM"
							data-set="#${tableId} .checkboxes">删除</button>

					</div>
				</div>
				<div class="widget-body">
					<form class="form-inline" role="form" onsubmit="return false;"
						id="form_${tableId}">
						<div class="form-group ">
							<label class="col-sm-4 control-label no-padding-right">配置名称</label>
							<div class="col-sm-8">
								<input type="text"
									class="form-control form-control-inline input-medium "
									name="filter_LIKES_confName" placeholder="配置名称">
							</div>
						</div>

						<div
							class="form-group">
									<label  class="col-sm-4 control-label no-padding-right">配置标识</label>
									<div class="col-sm-8">
										<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_confKey"  placeholder="配置标识">
								</div>
								</div>
								
								<div class="form-group">
									<label  class="col-sm-4 control-label no-padding-right">配置描述</label>
									<div class="col-sm-8">
										<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_confDes"  placeholder="配置描述">
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
	</div>
</div>
		

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
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'配置名称',  mData: "confName",uxLongText:true},				
			{sTitle:'配置标识',  mData: "confKey",uxLongText:true},				
			{sTitle:'配置描述',  mData: "confDes",uxLongText:true},				
	        {uxCogs:[
		          {name:"查看"}
		          ,{name:"修改"}
		          ,{name:"删除"}
	          ]}
        ]
	           
 });
});
</script>
