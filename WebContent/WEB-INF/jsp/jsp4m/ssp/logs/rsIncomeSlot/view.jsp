<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label=""  value="${rsIncomeSlot.pub_id}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.pub_name}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.site_id}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.site_name}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.slot_id}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.slot_name}" ></form:field>
		
			<form:field  label=""  useBody="true" type="p"  >
				<fmt:formatDate value="${rsIncomeSlot.stat_date}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.client_type}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.ra}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.rs}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.pv}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.cli}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.clo}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.uv}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.ip}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.status_group_0}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.status_group_1}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.status_group_2}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.status_group_3}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.status_group_4}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.status_group_5}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.gross_income}" ></form:field>
		
			<form:field type="p" label=""  value="${rsIncomeSlot.gross_price}" ></form:field>
		
			<form:field type="p" label="收入分成（1-服务费率）"  value="${rsIncomeSlot.ratio}" ></form:field>
		
			<form:field type="p" label="净收入"  value="${rsIncomeSlot.net_income}" ></form:field>
		
			<form:field type="p" label="净单价"  value="${rsIncomeSlot.net_price}" ></form:field>
		
			<form:field type="p" label="最终收入"  value="${rsIncomeSlot.final_income}" ></form:field>
		
			<form:field type="p" label="最终单价"  value="${rsIncomeSlot.final_price}" ></form:field>
		
			<form:field type="p" label="收入源数量"  value="${rsIncomeSlot.source_income_count}" ></form:field>
		
			<form:field type="p" label="流量源数量"  value="${rsIncomeSlot.source_flow_count}" ></form:field>
		
			<form:field type="p" label="状态 0=初始  1=自动分成完成 2=审核通过"  value="${rsIncomeSlot.status}" ></form:field>
		
			<form:field  label=""  useBody="true" type="p"  >
				<fmt:formatDate value="${rsIncomeSlot.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
			
		</div>
	</form>
