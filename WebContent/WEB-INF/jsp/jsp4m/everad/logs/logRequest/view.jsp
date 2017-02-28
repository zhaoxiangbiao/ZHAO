<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="账号"  value="${logRequest.phone_number}" ></form:field>
		
			<form:field  label="请求时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${logRequest.action_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="终端类型" useBody="true">
					<tag:enum tagType="view" enumName="ea_target_platform" enumKey="${fn:trim(logRequest.ct)}" />
			</form:field>		
			<form:field type="p" label="域名"  value="${logRequest.domain}" ></form:field>
		
			<form:field type="p" label="url地址"  value="${logRequest.url}" ></form:field>
		
			<form:field type="p" label="推送状态 "  value="${logRequest.status}" ></form:field>
		
			<form:field type="p" label="任务id"  value="${logRequest.taskid}" ></form:field>
		
			<form:field type="p" label="UA"  value="${logRequest.ua}" ></form:field>
		
			<form:field type="p" label="序列号"  value="${logRequest.sn}" ></form:field>
			
		</div>
	</form>
