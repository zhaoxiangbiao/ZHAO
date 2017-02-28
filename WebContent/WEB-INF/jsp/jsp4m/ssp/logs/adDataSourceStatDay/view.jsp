<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${adDataSourceStatDay.stat_date}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="广告源ID"  value="${adDataSourceStatDay.source_id}" ></form:field>
		
			<form:field type="p" label="广告源名称"  value="${adDataSourceStatDay.source_name}" ></form:field>
		
			<form:field type="p" label="展示统计"  value="${adDataSourceStatDay.show_count}" ></form:field>
		
			<form:field type="p" label="点击统计"  value="${adDataSourceStatDay.click_count}" ></form:field>
		
			<form:field type="p" label="CPM"  value="${adDataSourceStatDay.cpm}" ></form:field>
		
			<form:field type="p" label="CPC"  value="${adDataSourceStatDay.cpc}" ></form:field>
		
			<form:field type="p" label="收入"  value="${adDataSourceStatDay.income}" ></form:field>
			
		</div>
	</form>
