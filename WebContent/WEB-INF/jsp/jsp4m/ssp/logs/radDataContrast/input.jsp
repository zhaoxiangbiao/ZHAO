<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_radDataContrast_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/radDataContrast/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${radDataContrast.id}" />
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=statdate  value="<fmt:formatDate value="${radDataContrast.statdate}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="source_id" attrs="" label=""  value="${radDataContrast.source_id}" ></form:field>
		
			<form:field name="source_solt_id" attrs="" label=""  value="${radDataContrast.source_solt_id}" ></form:field>
		
			<form:field name="request_count" attrs="" label=""  value="${radDataContrast.request_count}" ></form:field>
		
			<form:field name="request_success_count" attrs="" label=""  value="${radDataContrast.request_success_count}" ></form:field>
		
			<form:field name="show_count" attrs="" label=""  value="${radDataContrast.show_count}" ></form:field>
		
			<form:field name="click_count" attrs="" label=""  value="${radDataContrast.click_count}" ></form:field>
		
			<form:field name="close_count" attrs="" label=""  value="${radDataContrast.close_count}" ></form:field>
		
			<form:field name="houver_count" attrs="" label=""  value="${radDataContrast.houver_count}" ></form:field>
		
			<form:field name="pv" attrs="" label=""  value="${radDataContrast.pv}" ></form:field>
		
			<form:field name="click" attrs="" label=""  value="${radDataContrast.click}" ></form:field>
		
			<form:field name="income" attrs="" label="结算收入"  value="${radDataContrast.income}" ></form:field>
		
			<form:field name="advert_id" attrs="" label="广告主id"  value="${radDataContrast.advert_id}" ></form:field>
		
			<form:field name="wh_id" attrs="" label="广告物料id"  value="${radDataContrast.wh_id}" ></form:field>
		
			<form:field name="dsp_type" attrs="" label="1:自有2：第三方"  value="${radDataContrast.dsp_type}" ></form:field>
			
			
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