<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="APP组名称"  value="${appGroups.name}" ></form:field>
		
			<form:field type="p" label="项目列表（app明细）"  value="${appGroups.items}" ></form:field>
			
		</div>
	</form>
