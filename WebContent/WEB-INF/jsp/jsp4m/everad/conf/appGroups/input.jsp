<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_appGroups_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/appGroups/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${appGroups.id}" />
			<form:field name="name" attrs="" label="APP组名称"  value="${appGroups.name}" ></form:field>
		
			<form:field type="textarea" rows="10" fwidth="7" id="form_everad_conf_appGroups_1_import" name="items" attrs="" label="项目列表（app明细）"  value="${appGroups.items}" >
				<a href="${ctx}/everad/conf/appGroups/importView1" class="btn btn-sm blue "  data-handler="MODAL" data-title="导入" data-form=true>
						<i class="fa fa-download"></i> 导入
				</a>
			</form:field>
			
			
		</div>
	<div class="  form-group ">
		<div class="pull-right form-btn">
			<button class="btn btn-warning" type="reset"><i class="ace-icon fa fa-undo bigger-110"></i> 重置	</button>
			<button type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>确认</button>
		</div>
	</div>
	</form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>