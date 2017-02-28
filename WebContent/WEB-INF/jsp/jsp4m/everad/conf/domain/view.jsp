<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="域名名称"  value="${domain.name}" ></form:field>
		
			<form:field type="p" label="域名标签"  value="${domain.label}" ></form:field>
			
		</div>
	</form>
