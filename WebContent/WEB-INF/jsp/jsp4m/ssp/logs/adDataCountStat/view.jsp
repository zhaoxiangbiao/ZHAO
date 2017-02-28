<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${adDataCountStat.stat_date}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="总收入"  value="${adDataCountStat.income}" ></form:field>
		
			<form:field type="p" label="媒体分成"  value="${adDataCountStat.last_income}" ></form:field>
		
			<form:field type="p" label="平台服务费"  value="${adDataCountStat.service_income}" ></form:field>
			
		</div>
	</form>
