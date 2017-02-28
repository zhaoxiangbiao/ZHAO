<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="号码|号段"  value="${detectUser.phone_number}" ></form:field>
		
			<form:field  label="类型（1：号码 2：号段）"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_number_type" enumKey="${detectUser.number_type}" />
			</form:field>
			
			
		</div>
	</form>
