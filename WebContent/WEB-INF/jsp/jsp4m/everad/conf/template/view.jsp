<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="模板名称"  value="${template.name}" ></form:field>
		
			<form:field  label="尺寸"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_size" enumKey="${template.size}" />
			</form:field>
			
		
			<form:field  label="位置"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_location" enumKey="${template.location}" />
			</form:field>
			
			
		</div>
	</form>
