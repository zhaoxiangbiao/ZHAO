<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="统计日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${adDataContrast.count_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="原始广告位id"  value="${adDataContrast.source_slot_number}" ></form:field>
		
			<form:field type="p" label="广告位名称"  value="${adDataContrast.source_slot_name}" ></form:field>
		
			<form:field type="p" label="第三方广告PV"  value="${adDataContrast.t_pv}" ></form:field>
		
			<form:field type="p" label="第三方广告点击"  value="${adDataContrast.t_click}" ></form:field>
		
			<form:field type="p" label="第三方广告ctr"  value="${adDataContrast.t_ctr}" ></form:field>
		
			<form:field type="p" label="自有统计PV"  value="${adDataContrast.s_pv}" ></form:field>
		
			<form:field type="p" label="自有统计点击量"  value="${adDataContrast.s_click}" ></form:field>
		
			<form:field type="p" label="自有统计ctr"  value="${adDataContrast.s_ctr}" ></form:field>
			
		</div>
	</form>
