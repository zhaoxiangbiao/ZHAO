<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="站点所属媒体"  value="${siteUrlFilter.pub_id}" ></form:field>
		
			<form:field type="p" label="站点"  value="${siteUrlFilter.site_id}" ></form:field>
		
			<form:field type="p" label="名单类型(0：黑名单；1白名单)"  value="${siteUrlFilter.type}" ></form:field>
		
			<form:field type="p" label=""  value="${siteUrlFilter.domain}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${siteUrlFilter.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
			
		</div>
	</form>
