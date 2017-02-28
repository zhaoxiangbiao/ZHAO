<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_system_sysKeyword_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/system/sysKeyword/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sysKeyword.id}" />
			<form:field name="keyword" attrs="" label="关键词"  value="${sysKeyword.keyword}" ></form:field>
		
			<form:field name="type" attrs="" label="违规类型"  value="${sysKeyword.type}" ></form:field>
		
			<form:field  label="违规等级"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="level" attrs=""  enumName="sys_keyword_leval" inputType="radio"   enumKey="${sysKeyword.level}"/>
			</form:field>
			
			
			
		</div>
		<div class="form-actions right">
			<button type="button" class="btn default remove">取消</button>
			<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
		</div>
	</form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>