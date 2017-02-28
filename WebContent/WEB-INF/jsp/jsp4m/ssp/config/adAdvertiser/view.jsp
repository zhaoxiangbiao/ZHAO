<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="直客ID"  value="${adAdvertiser.advert_id}" ></form:field>
		
			<form:field type="p" label="直客名称"  value="${adAdvertiser.name}" ></form:field>
		
			<form:field type="p" label="直客描述"  value="${adAdvertiser.des}" ></form:field>
			
		</div>
	</form>
