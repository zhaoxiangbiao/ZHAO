<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

	<form id="system_sysUser_form_1" method="post" action="${ctx}/system/sysUser/save" class="form-horizontal" >
	  <div class="form-body">
		<input type="hidden" name="id" value="${sysUser.id}" />
		<c:if test="${sysUser.username==null}">
		<form:field name="username" label="账号" value="${sysUser.username}" required="true" ></form:field>
		</c:if>
		<c:if test="${sysUser.username!=null}">
		<form:field  label="账号" value="${sysUser.username}" type="p"></form:field>
		<input type="hidden" name="username" value="${sysUser.username}">
		</c:if>
		<form:field name="password" label="密码" value="${sysUser.password}" type="password" required="true" ></form:field>
		<form:field name="name" label="昵称" value="${sysUser.name}" ></form:field>
		<!--<form:field  label="所属用户组"  useBody="true"  attrs="">
				<input class=" select2"  style="width:100%" name="userGroup.group_id"  type="hidden"  value="${sysUser.userGroup.group_id}" display-value="${sysUser.userGroup.group_name}"  result-field="group_name" value-field="group_id" lookup-url="/system/sysUserGroup/listJSON" filter="filter_LIKES_group_name" />
		</form:field>-->
		<form:field name="" label="所属角色" value="" required="true" useBody="true"  >
			<input class="select2" style="width:100%" name="userRole.id" type="hidden" value="${sysUser.userRole.id}" display-value="${sysUser.userRole.roleName}" result-field="roleName" result-formatter="displayRole"  lookup-url="${ctx }/system/sysRole/listJSON" filter="filter_LIKES_roleName" />
		</form:field>
		<form:field name="userDesc" label="用户描述" type="textarea" value="${sysUser.userDesc}" attrs=' rows="4" ' ></form:field>
		
	  </div>
	<div class="form-actions right">
		<button type="button" class="btn default remove">取消</button>
		<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
	</div>
	</form>
		

<script type="text/javascript">
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'system_sysUser_form_1',
		select2:{
			displaymac:function(m){
				var markup = [
				                "<table class='movie-result'>",
   			 					"<tr><td valign='top'>",
   			 				  	"<h5>" + m.mac + "</h5>",
             					"<div class='movie-synopsis'>" + m.description + "</div>",
   			 					"</td></tr>",
   			 					"<tr><td>",
   			 					"位置:"+m.location,
   			 					"</td></tr>",
   								"</table>"
   			 					].join('');
   			 
   			 return markup;
			},
			displaymall:function(m){
				var markup = [
				                "<table class='movie-result'>",
   			 					"<tr><td valign='top'>",
   			 				  	"<h5>" + m.name + "</h5>",
             					"<div class='movie-synopsis'>" + m.address + "</div>",
   			 					"</td></tr>",
   								"</table>"
   			 					].join('');
   			 
   			 return markup;
			}
		}
	});
});
</script>
