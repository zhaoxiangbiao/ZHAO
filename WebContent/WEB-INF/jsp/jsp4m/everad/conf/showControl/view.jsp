<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="账号码"  value="${showControl.phone_number}" ></form:field>
		
			<form:field  label="是否生效"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="isOrNot" enumKey="${showControl.is_active}" />
			</form:field>
			
			
		</div>
	</form>
