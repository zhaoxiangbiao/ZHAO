<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_system_sysGrant_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/system/sysGrant/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sysGrant.id}" />
			<form:field name="grantName" attrs="" label="权限名称"  value="${sysGrant.grantName}" ></form:field>
		
			<form:field name="desc" attrs="" label="权限描述"  value="${sysGrant.desc}" ></form:field>
		
			<form:field  label="权限分组"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="group" attrs=""  enumName="userType" inputType="radio"   enumKey="${sysGrant.group}"/>
			</form:field>
			
			
			
		</div>
		<div class="form-actions right">
			<button type="button" class="btn default remove">取消</button>
			<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
		</div>
	</form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>