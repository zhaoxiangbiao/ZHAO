<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_labels_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/labels/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${labels.id}" />
			<form:field name="label" attrs="" label="标签名"  value="${labels.label}" ></form:field>
		
			<form:field name="user_count" attrs="" label="标签下对应的人数"  value="${labels.user_count}" ></form:field>
			
			
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