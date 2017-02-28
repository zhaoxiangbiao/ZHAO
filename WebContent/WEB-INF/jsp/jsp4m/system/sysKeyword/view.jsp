<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="关键词"  value="${sysKeyword.keyword}" ></form:field>
		
			<form:field type="p" label="违规类型"  value="${sysKeyword.type}" ></form:field>
		
			<form:field  label="违规等级"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="sys_keyword_leval" enumKey="${sysKeyword.level}" />
			</form:field>
			
			
		</div>
	</form>
