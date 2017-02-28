<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysKeyword/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSKEYWORD_" ></c:set>
<c:set scope="page" var="dataTitle" value="内容审计词库" ></c:set>
<c:set scope="page" var="tableId" value="data-table-system-sysKeyword-1" ></c:set>
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
								
									<a href="${urlPrev }importView" class="btn btn-sm blue "  data-handler="MODAL" data-title="导入" data-form=true>
										<i class="fa fa-download"></i> 导入
									</a>
									<a href="${urlPrev }exportExcel?excelName=关键词库&sheetName=关键词库&title=关键词库" class="btn btn-sm blue "  target="_BLANK">
										<i class="fa fa-upload "></i> 导出
									</a>
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
									<a href="${urlPrev }sync2Service" class="btn btn-sm purple "  data-handler="CONFIRM" data-title="确定要进行同步吗？" >
										<i class="fa fa-retweet"></i> 同步
									</a>
							</div>
						</div>
						<div class="portlet-body">
						<form class="table-toolbar-form" role="form" onsubmit="return false;" id="form_${tableId}">
								
								<a href="javascript:;" class="btn search default pull-right " ><i class="fa fa-search"></i></a>
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_keyword"  placeholder="关键词">
								</div>
							
								<div class="form-group pull-right">
									<input type="text" class="form-control form-control-inline input-small " name="filter_LIKES_type"  placeholder="违规类型">
								</div>
	
								<div class="form-group pull-right">
									<tag:enum name="filter_EQI_level"  attrs="placeholder='违规等级'" cssClass="form-control form-control-inline input-small select2me"  enumName="sys_keyword_leval" tagType="edit" />
								</div>
							
	
							
	 					
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
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'关键词',  mData: "keyword",uxLongText:true},		
			{sTitle:'违规类型',mData: "type" },        
			{sTitle:'违规等级',mData: "level" ,uxEnum:'sys_keyword_leval'},
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
