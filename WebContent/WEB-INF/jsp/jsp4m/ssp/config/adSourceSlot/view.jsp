<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="原始广告位id"  value="${adSourceSlot.source_slot_id}" ></form:field>
		
			<form:field type="p" label="原始广告位number"  value="${adSourceSlot.source_slot_number}" ></form:field>
		
			<form:field type="p" label="广告位名称"  value="${adSourceSlot.source_slot_name}" ></form:field>
		
			<form:field  label="来源"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adSource/view?id=${adSourceSlot.source_id.id}"  data-handler="MODAL" data-title="信息">${adSourceSlot.source_id.source_name}</a>
			</form:field>
		
			<form:field  label="宽度"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="t_slot_width" enumKey="${adSourceSlot.source_slot_width}" />
			</form:field>
			
		
			<form:field  label="高度"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="t_slot_height" enumKey="${adSourceSlot.source_slot_height}" />
			</form:field>
			
		
			<form:field type="p" label="代码"  value="${adSourceSlot.source_slot_code}" ></form:field>

			
		</div>
	</form>
