<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adDspPproportion_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/adDspPproportion/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adDspPproportion.id}" />
			<form:field name="type" attrs="" label="目标类型：0=全局 1=pub  2=site  3=slot"  value="${adDspPproportion.type}" ></form:field>
		
			<form:field name="target_id" attrs="" label="目标ID（pub_id | site_id | slot_id）"  value="${adDspPproportion.target_id}" ></form:field>
		
			<form:field name="dsp_id" attrs="" label="dsp 唯一标识"  value="${adDspPproportion.dsp_id}" ></form:field>
		
			<form:field name="proportion" attrs="" label="展示量占比（百分制）"  value="${adDspPproportion.proportion}" ></form:field>
			
			
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