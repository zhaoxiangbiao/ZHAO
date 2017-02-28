<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="用户账号码"  value="${userLabel.phone_number}" ></form:field>
		
			<form:field type="p" label="用户标签"  value="${userLabel.label}" ></form:field>
			
			
		</div>
	</form>
