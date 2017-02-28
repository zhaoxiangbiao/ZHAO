<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${radDataContrast.statdate}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.source_id}" ></form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.source_solt_id}" ></form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.request_count}" ></form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.request_success_count}" ></form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.show_count}" ></form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.click_count}" ></form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.close_count}" ></form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.houver_count}" ></form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.pv}" ></form:field>
		
			<form:field type="p" label=""  value="${radDataContrast.click}" ></form:field>
		
			<form:field type="p" label="结算收入"  value="${radDataContrast.income}" ></form:field>
		
			<form:field type="p" label="广告主id"  value="${radDataContrast.advert_id}" ></form:field>
		
			<form:field type="p" label="广告物料id"  value="${radDataContrast.wh_id}" ></form:field>
		
			<form:field type="p" label="1:自有2：第三方"  value="${radDataContrast.dsp_type}" ></form:field>
			
		</div>
	</form>
