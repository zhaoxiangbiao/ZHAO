<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/demo/Buo/moren/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_DEMO_BUO_MOREN_" ></c:set>
<c:set scope="page" var="dataTitle" value="魔人" ></c:set>
<c:set scope="page" var="tableId" value="data_table_demo_Buo_moren_1" ></c:set>
<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>${dataTitle }列表</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="javascript:;" class="reload"></a>
							</div>
							
							<div class="actions">
								<sec:authorize ifAllGranted="${rolePrev }NEW">
									<a href="${urlPrev }new" class="btn btn-sm blue "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										<i class="fa fa-pencil"></i> 新增
									</a>
								</sec:authorize>
								<sec:authorize ifAllGranted="${rolePrev }DELETE">
									<a href="${urlPrev }delete" class="btn btn-sm red "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										<i class="fa fa-trash-o"></i> 删除
									</a>
								</sec:authorize>
									<a href="javascript:$('#form_${tableId}').submit();" class="btn btn-xs btn-info " >
										<i class="fa fa-download "></i> 导出EXCEL
								   </a>
								   <a href="${urlPrev }importView" class="btn btn-sm blue "  data-handler="MODAL" data-title="导入" data-form=true>
										<i class="fa fa-download"></i> 导入
									</a>
							</div>
						</div>
						<div class="portlet-body">
						<form class="table-toolbar-form" role="form" method="post" target="_BLANK" action="${urlPrev }exportExcel?excelName=${dataTitle }&sheetName=${dataTitle }&title=${dataTitle }" id="form_${tableId}">
								
							<!--	<a href="javascript:;" class="btn search default pull-right " ><i class="fa fa-search"></i></a> -->
								<div class="form-group pull-left">
									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_name"  placeholder="名字">
								</div>
							
	
						<div class="form-group input-icon input-medium pull-left ">
							<i class="fa fa-calendar"></i>
							<input placeholder='出生日期' class="form-control date-range-picker input-xlarge" name="datetime_age"  type="text" />
						</div>
							
	
								<div class="form-group pull-left">
									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_changeTime"  placeholder="变身时间">
								</div>
							
	 					
<a href="javascript:;" class="btn blue btn-block   search pull-left" >查询 <i class="fa fa-search"></i></a>
						</form>
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">
						</table>
						
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
	 uxCheckable:true,
	 uxCloseScroll:false,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'名字',  mData: "name",mRender:function(v){
				return Common.cutText(v,20);
			}},		
			{sTitle:'出生日期',  mData: "age" , mRender: Common.formatDateTime},					
			{sTitle:'变身时间',  mData: "changeTime",uxLongText:false},		        
          {uxCogs:[
	          {name:"查看"}
	          <sec:authorize ifAllGranted="${rolePrev }EDIT">
	          ,{name:"修改"}
	          </sec:authorize>
	          <sec:authorize ifAllGranted="${rolePrev }DELETE"> 
	          ,{name:"删除"}
	          </sec:authorize>
          ]}
        ]
	           
 });
});
</script>
