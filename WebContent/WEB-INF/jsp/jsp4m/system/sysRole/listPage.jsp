<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysRole/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSROLE_" ></c:set>
<c:set scope="page" var="dataTitle" value="角色信息" ></c:set>
<c:set scope="page" var="tableId" value="data-table-system-sysRole-1" ></c:set>
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
                  <div class="widget-buttons buttons-bordered">
						
							<button href="${urlPrev }/new" class="btn btn-palegreen btn-xs" data-handler="INLINE" data-title="广告来源" data-form="true">
								 新增
							</button>
						
						
							<button href="${urlPrev }/delete" class="btn btn-darkorange btn-xs" data-handler="CONFIRM" data-set="#${tableId} .checkboxes">
								 删除
							</button>
						
                  </div>
			</div>
			<div class="widget-body" >
			
               <form class="form-inline" role="form" action="${urlPrev }exportExcel?excelName=${dataTitle }&sheetName=${dataTitle }&title=${dataTitle }" id="form_${tableId}">
                  
                   
               </form>
			</div>
		</div>
		<div class="widget no-header ">
			
			<div class="widget-body">
			
			<table class="table table-striped table-bordered table-hover  dataTable no-footer" id="${tableId}" >
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
	 TableAjax.init('${tableId}',{
		 sAjaxSource: "${urlPrev }listJSON",
	 	 aaSorting: [[1, "desc" ]], // 需要自定义
		 uxUrlPrev:"${urlPrev }",
		 uxDataTitle:"${dataTitle }",
		 uxCheckable:true,
		 uxCloseScroll:true,
		 uxDrapable:false,
		 aoColumns: [
	   		  {sTitle:'角色名称', mData: "roleName"},
	          {sTitle:'角色描述', mData: "roleDesc" },
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