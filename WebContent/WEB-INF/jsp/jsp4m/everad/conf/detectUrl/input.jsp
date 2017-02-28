<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_detectUrl_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/detectUrl/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${detectUrl.id}" />
			<form:field name="domain" attrs="" label="域名"  value="${detectUrl.domain}" ></form:field>
		
			<form:field name="url" attrs="" label="url"  value="${detectUrl.url}" ></form:field>
		
			<form:field  label="匹配类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="match_type" attrs=""  enumName="ea_match_type" inputType="radio"   enumKey="${detectUrl.match_type}"/>
			</form:field>
			
		
			<form:field name="regex" attrs="" label="正则"  value="${detectUrl.regex}" ></form:field>
		
			<form:field name="fetch_regex" attrs="" label="抓取正则"  value="${detectUrl.fetch_regex}" ></form:field>
		
			<form:field  label="抓取目的"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="fetch_aim" attrs=""  enumName="ea_fetch_aim" inputType="radio"   enumKey="${detectUrl.fetch_aim}"/>
			</form:field>
			
		
			<form:field name="des" attrs="" label="描述"  value="${detectUrl.des}" ></form:field>
		
			<form:field name="name" attrs="" label="名称"  value="${detectUrl.name}" ></form:field>
			
			
		</div>
	<div class="  form-group ">
		<div class="pull-right form-btn">
			<button class="btn btn-warning" type="reset"><i class="ace-icon fa fa-undo bigger-110"></i> 重置	</button>
			<button type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>确认</button>
		</div>
	</div>
	</form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>