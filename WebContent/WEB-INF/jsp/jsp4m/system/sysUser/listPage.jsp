<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="urlPrev" value="${ctx }/system/sysUser/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SYSTEM_SYSUSER_" ></c:set>
<c:set scope="page" var="dataTitle" value="用户信息" ></c:set>
<c:set scope="page" var="tableId" value="data-table-system-sysUser-1" ></c:set>
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
						
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
						
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">账号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control form-control-inline input-medium " name="filter_LIKES_username"  placeholder="账号">
								</div>
								</div>
								
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">用户类型</label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQS_userType"  attrs="placeholder='用户类型'" cssClass="form-control form-control-inline input-medium select2me"  enumName="userType" tagType="edit" />
								</div>
								</div>
								
						</form>
						</div>
		</div>
		<div class="widget no-header ">
			
			<div class="widget-body">
						<table class="table table-condensed table-bordered table-hover" id="${tableId }">
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
		 TableAjax.init('${tableId}',{
			 sAjaxSource: "${urlPrev }listJSON",
		 	 aaSorting: [[1, "desc" ]], // 需要自定义
			 uxUrlPrev:"${urlPrev }",
			 uxDataTitle:"${dataTitle }",
			 uxCheckable:true,
			 uxCloseScroll:true,
			 uxDrapable:false,
		 	 aoColumns: [
		              
		               {sTitle:'用户名', "mData": "username" },
		               {sTitle:'昵称', "mData": "name" },
		               {sTitle:'用户类型',  "mData": "userType" ,uxEnum:'userType'},
		              /*  { sTitle:'所属商场',
		            	   "mData": "mall.name",
		            	   "sDefaultContent": "无" 
		            	},
		              { sTitle:'所属商铺',
		            	   "mData": "shop.name",
		            	   "sDefaultContent": "无" 
		            	},
		            	{sTitle:'所属用户组',
		            		 "mData": "userGroup.group_name",
		            		 "sDefaultContent": "无" 
						}, */
		               { sTitle:'所属角色',
		            	   "mData": "userRole.roleName",
		            	   "sDefaultContent": "无" 	
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
	 
	

});


</script>