<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="最后更新时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${sspUser.last_update_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="是否逻辑删除"  value="${sspUser.is_del}" ></form:field>
		
			<form:field type="p" label="昵称"  value="${sspUser.name}" ></form:field>
		
			<form:field type="p" label="密码"  value="${sspUser.password}" ></form:field>
		
			<form:field type="p" label="用户描述"  value="${sspUser.user_desc}" ></form:field>
		
			<form:field type="p" label="用户类型"  value="${sspUser.user_type}" ></form:field>
		
			<form:field type="p" label="账户名"  value="${sspUser.user_name}" ></form:field>
		
			<form:field type="p" label=""  value="${sspUser.user_dept}" ></form:field>
		
			<form:field type="p" label="用户角色"  value="${sspUser.user_role}" ></form:field>
		
			<form:field type="p" label=""  value="${sspUser.insert_user}" ></form:field>
		
			<form:field type="p" label=""  value="${sspUser.last_update_user}" ></form:field>
		
			<form:field  label=""  useBody="true" type="p"  >
				<fmt:formatDate value="${sspUser.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="媒体"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adPub/view?id=${sspUser.pub_id.id}"  data-handler="MODAL" data-title="信息">${sspUser.pub_id.pub_name}</a>
			</form:field>
		
			<form:field  label="站点"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adSite/view?id=${sspUser.site_id.id}"  data-handler="MODAL" data-title="信息">${sspUser.site_id.site_name}</a>
			</form:field>
		
			<form:field type="p" label="0表示属于媒体、1表示属于站点"  value="${sspUser.user_level}" ></form:field>
			
		</div>
	</form>
