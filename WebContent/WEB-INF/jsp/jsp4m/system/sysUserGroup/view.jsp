<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  name="group_name"  label="用户组名称"  value="${sysUserGroup.group_name}" type="p" ></form:field>
		
			<form:field  name="group_desc"  label="用户组描述"  value="${sysUserGroup.group_desc}" type="p"></form:field>
		
			<form:field type="p" label="用户组id"  value="${sysUserGroup.group_id}" ></form:field>
			
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${sysUserGroup.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="最后更新时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${sysUserGroup.update_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
		</div>
	</form>
