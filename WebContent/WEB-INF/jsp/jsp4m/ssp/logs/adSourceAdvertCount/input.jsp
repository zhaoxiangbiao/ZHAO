<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adSourceAdvertCount_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adSourceAdvertCount/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adSourceAdvertCount.id}" />
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=time  value="<fmt:formatDate value="${adSourceAdvertCount.time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="source_slot_id" attrs="" label=""  value="${adSourceAdvertCount.source_slot_id}" ></form:field>
		
			<form:field name="source_id" attrs="" label=""  value="${adSourceAdvertCount.source_id}" ></form:field>
		
			<form:field name="dsp_type" attrs="" label=""  value="${adSourceAdvertCount.dsp_type}" ></form:field>
		
			<form:field name="name" attrs="" label=""  value="${adSourceAdvertCount.name}" ></form:field>
		
			<form:field name="dvertname" attrs="" label=""  value="${adSourceAdvertCount.dvertname}" ></form:field>
		
			<form:field name="request" attrs="" label=""  value="${adSourceAdvertCount.request}" ></form:field>
		
			<form:field name="show" attrs="" label=""  value="${adSourceAdvertCount.show}" ></form:field>
		
			<form:field name="click" attrs="" label=""  value="${adSourceAdvertCount.click}" ></form:field>
		
			<form:field name="ctr" attrs="" label=""  value="${adSourceAdvertCount.ctr}" ></form:field>
		
			<form:field name="lastpv" attrs="" label=""  value="${adSourceAdvertCount.lastpv}" ></form:field>
		
			<form:field name="lastclick" attrs="" label=""  value="${adSourceAdvertCount.lastclick}" ></form:field>
		
			<form:field name="lastctr" attrs="" label=""  value="${adSourceAdvertCount.lastctr}" ></form:field>
		
			<form:field name="income" attrs="" label=""  value="${adSourceAdvertCount.income}" ></form:field>
			
			
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