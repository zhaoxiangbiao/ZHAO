<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="账号码"  value="${terminal.phone_number}" ></form:field>
		
			<form:field type="p" label="终端名称"  value="${terminal.terminal_name}" ></form:field>
			
			<%-- <form:field type="p" label="用户标签权重"  value="${terminal.weight}" ></form:field> --%>
		</div>
	</form>
