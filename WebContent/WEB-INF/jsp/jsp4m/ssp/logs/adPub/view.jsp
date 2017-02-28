<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="媒体id"  value="${adPub.pub_id}" ></form:field>
		
			<form:field type="p" label="媒体名称"  value="${adPub.pub_name}" ></form:field>
		
			<form:field type="p" label="媒体联系方式"  value="${adPub.pub_tel}" ></form:field>
		
			<form:field type="p" label="媒体联系人"  value="${adPub.pub_linkman}" ></form:field>
		
			<form:field type="p" label="媒体描述"  value="${adPub.pub_desc}" ></form:field>
		
			<form:field type="p" label="媒体状态"  value="${adPub.pub_status}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adPub.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="更新时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adPub.update_time}" pattern="yyyy-MM-dd"/>
			</form:field>
			
		</div>
	</form>
