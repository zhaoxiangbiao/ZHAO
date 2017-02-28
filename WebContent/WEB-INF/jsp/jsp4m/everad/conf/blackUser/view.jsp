<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="黑名单号码"  value="${blackUser.phone_number}" ></form:field>
		
			<%-- <form:field  label="是够生效"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="isOrNot" enumKey="${blackUser.is_effect}" />
			</form:field> --%>
			
			
		</div>
	</form>
