<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${adSourceAdvertCount.time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.source_slot_id}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.source_id}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.dsp_type}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.name}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.dvertname}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.request}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.show}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.click}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.ctr}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.lastpv}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.lastclick}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.lastctr}" ></form:field>
		
			<form:field type="p" label=""  value="${adSourceAdvertCount.income}" ></form:field>
			
		</div>
	</form>
