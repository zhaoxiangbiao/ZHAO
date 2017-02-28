<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="配置项key"  value="${conf.conf_key}" ></form:field>
		
			<form:field type="p" label="配置项名称name"  value="${conf.name}" ></form:field>
		
			<form:field type="p" label="配置项值"  value="${conf.conf_value}" ></form:field>
			
		</div>
	</form>
