<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysMenu/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSMENU_" ></c:set>
<c:set scope="page" var="dataTitle" value="菜单" ></c:set>
<c:set scope="page" var="tableId" value="data-table-system-sysMenu-1" ></c:set>
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
								<sec:authorize ifAllGranted="${rolePrev }NEW">
									<button href="${urlPrev }new" class="btn btn-xs blue "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										<i class="fa fa-pencil"></i> 新增
									</button>
								</sec:authorize>
								<sec:authorize ifAllGranted="${rolePrev }DELETE">
									<button href="${urlPrev }delete" class="btn btn-xs red "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										<i class="fa fa-trash-o"></i> 删除
									</button>
								</sec:authorize>
									<button href="${urlPrev }copy" class="btn btn-xs green "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										<i class="fa fa-copy"></i> 复制菜单
									</button>
									<button href="${urlPrev }toCopyTo" class="btn btn-xs purple "  data-handler="MODAL" data-set="#${tableId } .checkboxes">
										<i class="fa fa-paste"></i> 复制菜单下的按钮到目标菜单
									</button>
							</div>
						</div>
						<div class="widget-body" >
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">菜单名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_menuDesc"  placeholder="菜单名称">
								</div>
								</div>
								
							
								<input  name="filter_EQL_parentId.id_OR_LIKES_menuDesc" type="hidden" />	
								
	 					
						</form>	
						</div>
					</div>
						<div class="widget no-header ">
			
			<div class="widget-body">
						<div class="row">
						<!-- tree -->
							<div class="col-md-3">
								<div class="widget-box transparent">
										<div class="widget-header widget-hea1der-small">
											<h6 class="widget-title">菜单结构</h6>

											<div class="widget-toolbar">
<!-- 												<a href="#" data-action="settings"> -->
<!-- 													<i class="ace-icon fa fa-cog"></i> -->
<!-- 												</a> -->

<!-- 												<a href="#" data-action="reload"> -->
<!-- 													<i class="ace-icon fa fa-refresh"></i> -->
<!-- 												</a> -->

												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body ">
											<div class="widget-main no-padding">
												<!-- #section:custom/scrollbar -->
												<div class="scrollable" >
													<div class="content">
															<ul id="_system_menu_listPage_tree_01" class="ztree"></ul>
														
													</div>
												</div>

												<!-- /section:custom/scrollbar -->
											</div>
										</div>
									</div>
								
							</div>
							<!-- tree end-->
						
						<div class="col-md-9">
						
						
						
						
						
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">
						</table>
						</div>
						</div>
						</div>
					</div>
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
	 aaSorting: [[1, "asc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'菜单序列',  mData: "menuSeq"},				
			{sTitle:'菜单名称',  mData: "menuDesc",mRender:function(data,type,full){
				var icon = full.icon;
				if(!icon){
					icon='fa fa-question';
				}
				return "<i class='"+icon+"'></i> "+data + '  '+ (full.badge?full.badge:'');
			}},				
// 			{sTitle:'菜单分组',mData: "menuGroup" ,uxEnum:'userType',uxFastSet:true},		
			{sTitle:'菜单类型',mData: "menuType" ,uxEnum:'menuType'},		
// 			{sTitle:'菜单URL',  mData: "menuName",uxLongText:true},				
// 			{sTitle:'权限名称',  mData: "authorityName",uxLongText:true},		
			{sTitle:'是否可用',mData: "enabled" ,uxEnum:'isOrNot',uxFastSet:true},
			{sTitle:'是否可见',mData: "visible" ,uxEnum:'isOrNot',uxFastSet:true},
			{sTitle:'是否IFRAME',mData: "external" ,uxEnum:'isOrNot'},
// 			{sTitle:'打开目标',mData: "target" ,uxEnum:'target'},		
// 			{sTitle:'简介',  mData: "summary",uxLongText:true},		
			{sTitle:'上级菜单',
			  mData: "parentId" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a class="btn  blue-stripe btn-xs" href="${ctx}/system/sysMenu/view?id='+data.id+'"  data-handler="MODAL" data-title="上级菜单">'+data.menuDesc+'</a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },        
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
 
 $.ajax({  
	    async:false,  
	    cache:false,  
	    type: 'POST',  
	    dataType : "json", 
	    url: "${ctx}/system/sysMenu/getTree",//请求的action路径  
	    error: function () {//请求失败处理函数  
	        alert('请求失败');  
	    },  
	    success:function(data){ //请求成功后处理函数。    
	    	var setting = {
	   			view: {
//	   				showIcon: false,
	   				selectedMulti: false
	   			},
	   			data: {
	   				simpleData: {
	   					enable: true
	   				}
	   			},
	  			callback: {
	  				onClick :function(event, treeId, treeNode){
//	  					console.log(treeNode);
	  					
	  					$('#form_${tableId}').find('input[name="filter_EQL_parentId.id_OR_LIKES_menuDesc"]').val(treeNode.id+"_OR_"+treeNode.name);
	  					$('#refresh-toggler').click();
	  					$('#form_${tableId}').find('input[name="filter_EQL_parentId.id_OR_LIKES_menuDesc"]').val('');
	  					
	  				}
				}
	  		};
	   		 $.fn.zTree.init($("#_system_menu_listPage_tree_01"),setting,  eval(data)).expandAll(true);
	    }
	});  

});
</script>
