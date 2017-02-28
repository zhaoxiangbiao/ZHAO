<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="域名组名称"  value="${domainGruops.name}" ></form:field>
		
			<form:field type="p" label="项目列表（域名明细）"  value="${domainGruops.items}" ></form:field>
			
		</div>
	</form>
