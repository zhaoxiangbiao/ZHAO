<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adCount_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adCount/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adCount.id}" />
			<form:field name="pub_id" attrs="" label=""  value="${adCount.pub_id}" ></form:field>
		
			<form:field name="site_id" attrs="" label=""  value="${adCount.site_id}" ></form:field>
		
			<form:field name="slot_id" attrs="" label=""  value="${adCount.slot_id}" ></form:field>
		
			<form:field name="source_id" attrs="" label=""  value="${adCount.source_id}" ></form:field>
		
			<form:field name="source_solt_id" attrs="" label=""  value="${adCount.source_solt_id}" ></form:field>
		
			<form:field  label=""  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=time  value="<fmt:formatDate value="${adCount.time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="year" attrs="" label=""  value="${adCount.year}" ></form:field>
		
			<form:field name="month" attrs="" label=""  value="${adCount.month}" ></form:field>
		
			<form:field name="day" attrs="" label=""  value="${adCount.day}" ></form:field>
		
			<form:field name="hour" attrs="" label=""  value="${adCount.hour}" ></form:field>
		
			<form:field name="client_type" attrs="" label=""  value="${adCount.client_type}" ></form:field>
		
			<form:field name="request_count" attrs="" label=""  value="${adCount.request_count}" ></form:field>
		
			<form:field name="request_success_count" attrs="" label=""  value="${adCount.request_success_count}" ></form:field>
		
			<form:field name="show_count" attrs="" label=""  value="${adCount.show_count}" ></form:field>
		
			<form:field name="click_count" attrs="" label=""  value="${adCount.click_count}" ></form:field>
		
			<form:field name="close_count" attrs="" label=""  value="${adCount.close_count}" ></form:field>
		
			<form:field name="advert_id" attrs="" label=""  value="${adCount.advert_id}" ></form:field>
		
			<form:field name="wh_id" attrs="" label=""  value="${adCount.wh_id}" ></form:field>
		
			<form:field name="dsp_type" attrs="" label=""  value="${adCount.dsp_type}" ></form:field>
		
			<form:field name="houver_count" attrs="" label=""  value="${adCount.houver_count}" ></form:field>
			
			
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