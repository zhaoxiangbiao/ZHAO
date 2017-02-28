<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adAdvertiser_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/adAdvertiser/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adAdvertiser.id}" />
			<input type="hidden" name="advert_id" value="${AutoId}"/>
		
			<form:field name="name" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"' label="直客名称"  value="${adAdvertiser.name}" ></form:field>
		
			<form:field name="des" attrs="" label="直客描述"  value="${adAdvertiser.des}" ></form:field>
			
			<form:field  label="目标平台类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="platform_type" attrs=""  enumName="t_platform_type" inputType="radio"  enumKey="${adAdvertiser.platform_type}"/>
			</form:field>
			<form:field  label="计费类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="cost_type" attrs=""  enumName="t_cost_type" inputType="radio"  enumKey="${adAdvertiser.cost_type}"/>
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