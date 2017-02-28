<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_global_import_${formId }" ></c:set>
	<form id="${formId }" method="post" action="${ctx}${uri}" class="form-horizontal" enctype="multipart/form-data" >
		<div class="form-body">
		
			<form:field  label="导入文件"  useBody="true"  required="true">
				<form:file   name="upload"  required="true"></form:file>
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
		formId:'${formId }',
		importElement:'${importElement}'
		
	});
	
});
</script>
