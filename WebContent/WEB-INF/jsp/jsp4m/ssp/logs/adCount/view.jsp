<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label=""  value="${adCount.pub_id}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.site_id}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.slot_id}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.source_id}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.source_solt_id}" ></form:field>
		
			<form:field  label=""  useBody="true" type="p"  >
				<fmt:formatDate value="${adCount.time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label=""  value="${adCount.year}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.month}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.day}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.hour}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.client_type}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.request_count}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.request_success_count}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.show_count}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.click_count}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.close_count}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.advert_id}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.wh_id}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.dsp_type}" ></form:field>
		
			<form:field type="p" label=""  value="${adCount.houver_count}" ></form:field>
			
		</div>
	</form>
