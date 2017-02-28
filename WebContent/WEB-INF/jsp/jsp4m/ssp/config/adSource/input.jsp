<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adSource_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/adSource/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adSource.id}" />
			
			<input name="source_id" type="hidden" value="${adSource.source_id}"/>
		
			<form:field name="source_name" attrs='' label="来源名称"  value="${adSource.source_name}" ></form:field>
		
			<form:field  label="是否替换认可网站域名"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="source_replace" attrs=""  enumName="isOrNot" inputType="radio"   enumKey="${adSource.source_replace}"/>
			</form:field>
			
			<form:field  label="目标平台类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="platform_type" attrs=""  enumName="t_platform_type" inputType="radio"   enumKey="${adSource.platform_type}"/>
			</form:field>
			<form:field  label="计费类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="cost_type" attrs=""  enumName="t_cost_type" inputType="radio"  enumKey="${adSource.cost_type}"/>
			</form:field>	
<%-- 			<form:field  label="创建时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=create_time  value="<fmt:formatDate value="${adSource.create_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
			
			<form:field name="is_del" attrs="" label="1为逻辑删除"  value="${adSource.is_del}" ></form:field>
		
			<form:field name="status" attrs="" label="广告源状态 0开始1停用"  value="${adSource.status}" ></form:field> --%>
			
			
			
		
			
			
			
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