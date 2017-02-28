<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_showControl_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/showControl/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${showControl.id}" />
			<form:field name="phone_number" attrs="" label="账号码"  value="${showControl.phone_number}" ></form:field>
		
			<form:field  label="是否生效"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="is_active" attrs=""  enumName="isOrNot" inputType="radio"   enumKey="${showControl.is_active}"/>
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