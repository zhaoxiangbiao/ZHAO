<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="智能终端组名称"  value="${terminalGroups.name}" ></form:field>
		
			<form:field type="p" label="项目列表（智能终端明细）"  value="${terminalGroups.items}" ></form:field>
			
		</div>
	</form>
