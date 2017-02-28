<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/sysconf/sysConfIitem/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSCONF_SYSCONFIITEM_" ></c:set>
<c:set scope="page" var="dataTitle" value="配置项" ></c:set>
<c:set scope="page" var="tableId" value="data-table-sysconf-sysConfIitem-1" ></c:set>
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
						
							<button href="${urlPrev }/new?pid=${pageData.filtraMap["EQL_confType.id"]}" class="btn btn-palegreen btn-xs" data-handler="INLINE" data-title="广告来源" data-form="true">
								 新增
							</button>
						
						
							<button href="${urlPrev }/delete" class="btn btn-darkorange btn-xs" data-handler="CONFIRM" data-set="#${tableId} .checkboxes">
								 删除
							</button>
						
                  </div>
			</div>
			<div class="widget-body" >
					<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
														
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right"></label>
							<div class="col-sm-8">
								<input id="sysconf_confType_confName_list" type="hidden" name="filter_EQL_confType.id" value='${pageData.filtraMap["EQL_confType.id"]}' />
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
			
			{sTitle:'配置项名称',  mData: "itemName",uxLongText:true},				
			{sTitle:'配置项key',  mData: "itemKey",uxLongText:true},				
			{sTitle:'值类型',mData: "valueType" ,uxEnum:'sys_conf_value_type'},
			{sTitle:'值枚举类型',
			  mData: "enumType" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/system/sysEnum/view?id='+data.id+'"  data-handler="MODAL" data-title="值枚举类型">'+data.enumDesc+'</a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },		
			{sTitle:'配置项描述',  mData: "des",uxLongText:true},		        
          {uxCogs:[
                   {name:"查看"}
 		          <%-- 		          <sec:authorize ifAllGranted="${rolePrev }EDIT"> --%>
 		          ,{name:"修改"}
 		          <%-- 		 </sec:authorize> --%>
 		          <%--<sec:authorize ifAllGranted="${rolePrev }DELETE"> --%>
 		          ,{name:"删除"}
 		          <%--</sec:authorize>--%>
          ]}
        ]
	           
 });
});
</script>
