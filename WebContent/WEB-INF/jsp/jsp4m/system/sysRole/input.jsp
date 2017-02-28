<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<style type="text/css">
.ztree li span.button.add {margin-left:60px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>

<!-- BEGIN FORM-->
	<form id="system_sysRole_form_1" method="post" action="${ctx}/system/sysRole/save" class="form-horizontal">
	<!-- BEGIN FORM BODY-->
		<div class="form-body">
		<input type="hidden" id="_system_sysrole_edit_tree_sysRole_id" name="id" value="${sysRole.id}" />
		<input type="hidden" id="_system_sysrole_edit_tree_selected_id" name="ids" value="" />
		<div class="row ">
			<div class="col-md-12 ">
				<div class="form-group">
					<label  class="col-md-3 control-label">角色名称：</label>
					<div class="col-md-9">
						<input class="form-control"  name="roleName" type="text" value="${sysRole.roleName}" size="30"  maxlength=30 />
					</div>
				</div>
			</div>
		</div>
		
		<div class="row ">
			<div class="col-md-12 ">
				<div class="form-group">
					<label  class="col-md-3 control-label">角色描述：</label>
					<div class="col-md-9">
						
						<input class="form-control"  name="roleDesc" type="text" value="${sysRole.roleDesc}" size="30"  maxlength=30 />
					</div>
				</div>
			</div>
		</div>
		
			
		<div class="row">
			<div class="col-md-12 ">
				<div class="form-group">
					<label  class="col-md-3 control-label">角色授权信息：</label>
					<div class="col-md-9">
					
								<div class="tabbable-custom ">
									<ul class="nav nav-tabs ">
										<li class="active"><a href="#tab_5_1" data-toggle="tab">功能菜单权限</a></li>
										<li><a href="#tab_5_2" data-toggle="tab">通用项权限</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="tab_5_1">
											<ul id="_system_sysrole_edit_tree" class="ztree well"></ul>					
										</div>
										<div class="tab-pane fade" id="tab_5_2">
											<div class="checkbox-list">
												<c:forEach var="o" items="${grantList }">
													<div class="checkbox">
														
                                                        <label>
                                                            <input type="checkbox" name="grants" value="${o.grant.id }" <c:if test="${o.checked==1 }">  checked="checked"  </c:if> />
                                                            <span class="text"> ${o.grant.desc}</span>
                                                        </label>
                                                        
                                                    </div>
														<br/>
													
												</c:forEach>		
											</div>
										</div>
									</div>
								</div>
					</div>
				</div>
			</div>
		</div>
</div>
	<div class="form-actions right">
		<button type="button" class="btn default remove">取消</button>
		<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
	</div>
	</form>
<!-- END FORM BODY-->
		
<!-- END FORM -->

<script type="text/javascript">
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'system_sysRole_form_1'
	});
});
function system_sysrole_initMenuTree(roleType){
	$.ajax({  
	    async:false,  
	    cache:false,  
	    type: 'POST',  
	    dataType : "json", 
	    data:{roleId:${sysRole==null ?-1:sysRole.id},roleType:roleType},
	    url: "${ctx}/system/sysRole/getMenuTree",//请求的action路径  
	    error: function () {//请求失败处理函数  
	        alert('请求失败');  
	    },  
	    success:function(data){ //请求成功后处理函数。    
	    	var setting = {
	    			check: {
	    				enable: true,
	    				chkboxType :{"Y" : "s", "N" : "s"}
	    			},
	    			data: {
	    				simpleData: {
	    					enable: true
	    				}
	    			},
	    			callback: {
	    				onCheck:function (event, treeId, treeNode){
	    					var treeObj = $.fn.zTree.getZTreeObj(treeId);
	    					var ids=",";
	    					var checkedNodes = treeObj.getCheckedNodes(true);
	    				    for(var i=0;i<checkedNodes.length;i++ ){
	    				    	//alert(checkedNodes[i]);
	    				    	ids+=checkedNodes[i].id+",";
	    				    }
	    				    
	    				    //alert(ids);
	    				    $('#_system_sysrole_edit_tree_selected_id').val(ids);
	    				}
	    			}

	    		};
			
	    	$.fn.zTree.init($("#_system_sysrole_edit_tree"),setting, eval(data));
	    	//alert(1);
	    }
	});
}
system_sysrole_initMenuTree(1);
</script>
