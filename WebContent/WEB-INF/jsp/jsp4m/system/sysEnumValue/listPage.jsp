<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysEnumValue/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSENUMVALUE_" ></c:set>
<c:set scope="page" var="dataTitle" value="" ></c:set>
<c:set scope="page" var="tableId" value="data-table-system-sysEnumValue-1" ></c:set>
<div class="note note-info fade in">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>

							<h4 class="block">${e.enumDesc } 【 ${e.enumName } 】</h4>
							<p>
								java 获取参数值：SessionUtil.getEnumValue("${e.enumName }", "key");
								
							</p>
</div>

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
                  <div class="widget-buttons buttons-bordered">
<%-- 								<sec:authorize ifAllGranted="${rolePrev }NEW"> --%>
									<button href="${urlPrev }new?pid=${pageData.filtraMap["EQL_enumId.id"]}" class="btn btn-xs blue "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										<i class="fa fa-pencil"></i> 新增
									</button>
<%-- 								</sec:authorize> --%>
<%-- 								<sec:authorize ifAllGranted="${rolePrev }DELETE"> --%>
									<button href="${urlPrev }delAll" class="btn btn-xs red "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										<i class="fa fa-trash-o"></i> 删除
									</button>
<%-- 								</sec:authorize> --%>
							 </div>
			</div>
			<div class="widget-body" >
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
															
							<input  type="hidden" name="filter_EQL_enumId.id" value='${pageData.filtraMap["EQL_enumId.id"]}' />
	 					
						</form>
						
						</div>
		</div>
		<div class="widget no-header ">
			
			<div class="widget-body">
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">
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
			{sTitle:'代号',  mData: "enumKey"},				
			{sTitle:'名称',  mData: "enumVal",uxLongText:true},				
// 			{sTitle:'排序',  mData: "enumSeq"},		
          {uxCogs:[
	          {name:"查看"}
	          <%-- <sec:authorize ifAllGranted="${rolePrev }EDIT">--%>
	          ,{name:"修改"}
	          <%-- </sec:authorize>--%>
	          <%-- <sec:authorize ifAllGranted="${rolePrev }DELETE"> --%>
	          ,{name:"删除"}
	          <%-- </sec:authorize>--%>
          ]}
        ]
	           
 });
});
</script>
