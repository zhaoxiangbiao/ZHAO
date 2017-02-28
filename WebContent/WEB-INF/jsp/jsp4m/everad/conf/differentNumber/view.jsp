<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="账号码"  value="${differentNumber.phone_number}" ></form:field>
		
			<form:field type="p" label="异网账号码"  value="${differentNumber.phone_different_number}" ></form:field>
		
			<form:field  label="异网运营商"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_operator" enumKey="${differentNumber.operator}" />
			</form:field>
			<%-- <form:field type="p" label="用户标签权重"  value="${differentNumber.weight}" ></form:field> --%>
			
		</div>
	</form>
