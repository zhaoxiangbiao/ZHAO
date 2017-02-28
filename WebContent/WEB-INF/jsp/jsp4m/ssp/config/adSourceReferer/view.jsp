<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="来源ID"  value="${adSourceReferer.source_id}" ></form:field>
		
			<form:field type="p" label="认可网站地址"  value="${adSourceReferer.referer}" ></form:field>
		
			<form:field type="p" label="优先级"  value="${adSourceReferer.weight}" ></form:field>
		
			
		</div>
	</form>
