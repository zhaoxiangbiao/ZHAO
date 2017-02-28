<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="站点ID"  value="${adSite.site_id}" ></form:field>
		
			<form:field type="p" label="站点名"  value="${adSite.site_name}" ></form:field>
		
			<form:field type="p" label="站点联系人"  value="${adSite.site_linkman}" ></form:field>
			
			<form:field type="p" label="站点联系方式"  value="${adSite.site_tel}" ></form:field>
		
			<form:field type="p" label="站点描述"  value="${adSite.site_desc}" ></form:field>
		
			<form:field type="p" label="站点域名"  value="${adSite.site_domain}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adSite.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="资源域名"  value="${adSite.resource_domain}" ></form:field>
		
			<form:field  label="媒体"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adPub/view?id=${adSite.pub_id.id}"  data-handler="MODAL" data-title="信息">${adSite.pub_id.pub_name}</a>
			</form:field>
		
			<form:field  label="更新时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adSite.update_time}" pattern="yyyy-MM-dd"/>
			</form:field>
				
			
		</div>
	</form>
