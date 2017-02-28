<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_differentNumber_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/differentNumber/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${differentNumber.id}" />
			<form:field name="phone_number" attrs="" label="账号码"  value="${differentNumber.phone_number}" ></form:field>
		
			<form:field name="phone_different_number" attrs="" label="异网账号码"  value="${differentNumber.phone_different_number}" ></form:field>
		
			<form:field  label="异网运营商"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="operator" attrs=""  enumName="ea_operator" inputType="radio"   enumKey="${differentNumber.operator}"/>
			</form:field>
			
			<form:field name="weight" attrs="" label="用户标签权重"  value="${differentNumber.weight}" ></form:field>
			
			
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