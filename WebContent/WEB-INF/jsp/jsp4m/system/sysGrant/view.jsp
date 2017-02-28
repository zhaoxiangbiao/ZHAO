<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="权限名称"  value="${sysGrant.grantName}" ></form:field>
		
			<form:field type="p" label="权限描述"  value="${sysGrant.desc}" ></form:field>
		
			<form:field  label="权限分组"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="userType" enumKey="${sysGrant.group}" />
			</form:field>
			
			
		</div>
	</form>
