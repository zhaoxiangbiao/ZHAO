<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_conf_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/conf/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${conf.id}" />
			<form:field name="conf_key" attrs="" label="配置项key"  value="${conf.conf_key}" ></form:field>
		
			<form:field name="name" attrs="" label="配置项名称name"  value="${conf.name}" ></form:field>
		
			<form:field name="conf_value" attrs="" label="配置项值"  value="${conf.conf_value}" ></form:field>
			
			
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