<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="来源ID"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/config/adSource/view?id=${adSourceData.source_id.id}"  data-handler="MODAL" data-title="信息">${adSourceData.source_id.source_name}</a>
			</form:field>
		
			<form:field  label="原始广告位number"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/view?id=${adSourceData.source_slot_id.id}"  data-handler="MODAL" data-title="信息">${adSourceData.source_slot_id.source_slot_number}</a>
			</form:field>
		
			<form:field  label="统计时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adSourceData.statdate}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="广告源PV"  value="${adSourceData.pv}" ></form:field>
		
			<form:field type="p" label="广告源点击量"  value="${adSourceData.click}" ></form:field>
		
			<form:field type="p" label="收入"  value="${adSourceData.income}" ></form:field>
			
		</div>
	</form>
