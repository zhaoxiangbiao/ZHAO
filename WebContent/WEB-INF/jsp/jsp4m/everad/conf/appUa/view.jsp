<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<%-- <form:field type="p" label="app标识"  value="${appUa.app_id}" ></form:field> --%>
		
			<form:field type="p" label="app名称"  value="${appUa.app_name}" ></form:field>
		
			<form:field type="p" label="ua识别特征"  value="${appUa.ua_reg}" ></form:field>
			
		</div>
	</form>
