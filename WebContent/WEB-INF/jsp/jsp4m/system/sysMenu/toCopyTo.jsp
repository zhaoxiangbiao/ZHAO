<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_system_sysMenu_2" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/system/sysMenu/copyTo" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="ids" value="${ids}" />
		
			<form:field  label="目标菜单"  useBody="true" >
				<input class="form-control select2" name="targetId" type="hidden"   value="${sysMenu.parentId.id}" display-value="${sysMenu.parentId.menuDesc}" result-field="menuDesc" result-formatter="system_menu"   lookup-url="${ctx}/system/sysMenu/listJSON?filter_EQS_menuType=2" filter="filter_LIKES_menuDesc"  />
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