<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_rsIncomeSlot_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/rsIncomeSlot/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${rsIncomeSlot.id}" />
			<form:field name="pub_id" attrs="" label=""  value="${rsIncomeSlot.pub_id}" ></form:field>
		
			<form:field name="pub_name" attrs="" label=""  value="${rsIncomeSlot.pub_name}" ></form:field>
		
			<form:field name="site_id" attrs="" label=""  value="${rsIncomeSlot.site_id}" ></form:field>
		
			<form:field name="site_name" attrs="" label=""  value="${rsIncomeSlot.site_name}" ></form:field>
		
			<form:field name="slot_id" attrs="" label=""  value="${rsIncomeSlot.slot_id}" ></form:field>
		
			<form:field name="slot_name" attrs="" label=""  value="${rsIncomeSlot.slot_name}" ></form:field>
		
			<form:field  label=""  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=stat_date  value="<fmt:formatDate value="${rsIncomeSlot.stat_date}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="client_type" attrs="" label=""  value="${rsIncomeSlot.client_type}" ></form:field>
		
			<form:field name="ra" attrs="" label=""  value="${rsIncomeSlot.ra}" ></form:field>
		
			<form:field name="rs" attrs="" label=""  value="${rsIncomeSlot.rs}" ></form:field>
		
			<form:field name="pv" attrs="" label=""  value="${rsIncomeSlot.pv}" ></form:field>
		
			<form:field name="cli" attrs="" label=""  value="${rsIncomeSlot.cli}" ></form:field>
		
			<form:field name="clo" attrs="" label=""  value="${rsIncomeSlot.clo}" ></form:field>
		
			<form:field name="uv" attrs="" label=""  value="${rsIncomeSlot.uv}" ></form:field>
		
			<form:field name="ip" attrs="" label=""  value="${rsIncomeSlot.ip}" ></form:field>
		
			<form:field name="status_group_0" attrs="" label=""  value="${rsIncomeSlot.status_group_0}" ></form:field>
		
			<form:field name="status_group_1" attrs="" label=""  value="${rsIncomeSlot.status_group_1}" ></form:field>
		
			<form:field name="status_group_2" attrs="" label=""  value="${rsIncomeSlot.status_group_2}" ></form:field>
		
			<form:field name="status_group_3" attrs="" label=""  value="${rsIncomeSlot.status_group_3}" ></form:field>
		
			<form:field name="status_group_4" attrs="" label=""  value="${rsIncomeSlot.status_group_4}" ></form:field>
		
			<form:field name="status_group_5" attrs="" label=""  value="${rsIncomeSlot.status_group_5}" ></form:field>
		
			<form:field name="gross_income" attrs="" label=""  value="${rsIncomeSlot.gross_income}" ></form:field>
		
			<form:field name="gross_price" attrs="" label=""  value="${rsIncomeSlot.gross_price}" ></form:field>
		
			<form:field name="ratio" attrs="" label="收入分成（1-服务费率）"  value="${rsIncomeSlot.ratio}" ></form:field>
		
			<form:field name="net_income" attrs="" label="净收入"  value="${rsIncomeSlot.net_income}" ></form:field>
		
			<form:field name="net_price" attrs="" label="净单价"  value="${rsIncomeSlot.net_price}" ></form:field>
		
			<form:field name="final_income" attrs="" label="最终收入"  value="${rsIncomeSlot.final_income}" ></form:field>
		
			<form:field name="final_price" attrs="" label="最终单价"  value="${rsIncomeSlot.final_price}" ></form:field>
		
			<form:field name="source_income_count" attrs="" label="收入源数量"  value="${rsIncomeSlot.source_income_count}" ></form:field>
		
			<form:field name="source_flow_count" attrs="" label="流量源数量"  value="${rsIncomeSlot.source_flow_count}" ></form:field>
		
			<form:field name="status" attrs="" label="状态 0=初始  1=自动分成完成 2=审核通过"  value="${rsIncomeSlot.status}" ></form:field>
		
			<form:field  label=""  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=create_time  value="<fmt:formatDate value="${rsIncomeSlot.create_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
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