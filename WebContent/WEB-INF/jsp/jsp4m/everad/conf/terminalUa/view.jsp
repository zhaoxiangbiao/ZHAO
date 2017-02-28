<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="智能终端名称"  value="${terminalUa.terminal_name}" ></form:field>
		
			<form:field type="p" label="ua特征"  value="${terminalUa.ua_reg}" ></form:field>
			
		</div>
	</form>
