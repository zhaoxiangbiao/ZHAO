<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${radRequestRefererStat.statdate}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="媒体id"  value="${radRequestRefererStat.pub_id}" ></form:field>
		
			<form:field type="p" label="站点id"  value="${radRequestRefererStat.site_id}" ></form:field>
		
			<form:field type="p" label="广告位id"  value="${radRequestRefererStat.slot_id}" ></form:field>
		
			<form:field type="p" label="媒体名称"  value="${radRequestRefererStat.pub_name}" ></form:field>
		
			<form:field type="p" label="站点名"  value="${radRequestRefererStat.site_name}" ></form:field>
		
			<form:field type="p" label="广告位名称"  value="${radRequestRefererStat.slot_name}" ></form:field>
		
			<form:field type="p" label=""  value="${radRequestRefererStat.client_type}" ></form:field>
		
			<form:field type="p" label=""  value="${radRequestRefererStat.referer_host}" ></form:field>
		
			<form:field type="p" label=""  value="${radRequestRefererStat.referer}" ></form:field>
		
			<form:field type="p" label=""  value="${radRequestRefererStat.total}" ></form:field>
			
		</div>
	</form>
