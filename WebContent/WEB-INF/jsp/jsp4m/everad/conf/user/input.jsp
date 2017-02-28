<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_user_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/user/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${user.id}" />
			<form:field name="phone_number" attrs="" label="账号"  value="${user.phone_number}" ></form:field>
			
			<form:field name="label_count" attrs="" label="标签数量"  value="${user.label_count}" ></form:field>
		
			<%-- <form:field name="preference" attrs="" label="用户偏好"  value="${user.preference}" ></form:field>
		
			<form:field  label="是否是集团用户"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="del_flag" attrs=""  enumName="isOrNot" inputType="radio"   enumKey="${user.del_flag}"/>
			</form:field>
			
		
			<form:field  label="用户所属的运营商"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="operator" attrs=""  enumName="ea_operator1" inputType="radio"   enumKey="${user.operator}"/>
			</form:field> --%>
			
			
			
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