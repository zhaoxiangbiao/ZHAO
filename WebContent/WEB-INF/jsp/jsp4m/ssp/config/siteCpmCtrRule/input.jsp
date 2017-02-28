<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_siteCpmCtrRule_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/siteCpmCtrRule/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${siteCpmCtrRule.id}" /> 
			<input type="hidden" name="createtime" value="${siteCpmCtrRule.createtime}" />
			<input type="hidden" name="status" value="${siteCpmCtrRule.status}" /> 
			<input type="hidden" name="pub_id" value="${pubid}" /> 
			<input type="hidden" name="site_id" value="${siteid}" /> 
			
 
		
			<form:field name="pc_min_ctr" attrs="" label="pc转化率最低值"  value="${siteCpmCtrRule.pc_min_ctr}" ></form:field>
		
			<form:field name="pc_max_ctr" attrs="" label="pc转化率最高值"  value="${siteCpmCtrRule.pc_max_ctr}" ></form:field>
 
 			<form:field name="mobile_min_ctr" attrs="" label="移动转化率最低值"  value="${siteCpmCtrRule.mobile_min_ctr}" ></form:field>
		
			<form:field name="mobile_max_ctr" attrs="" label="移动转化率最高值"  value="${siteCpmCtrRule.mobile_max_ctr}" ></form:field>
 
			
			
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