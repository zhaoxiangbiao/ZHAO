<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adSource_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/adSource/save" class="form-horizontal bv-form" >
		<div class="form-body">
			
			<input type="hidden" name="id" value="${adSource.id}" />
			
			<c:if test="${ empty adSource}">
			<input name="source_id" type="hidden" value="${AutoId}" />
			</c:if>
			<c:if test="${ not empty adSource}">
			<input name="source_id" type="hidden" value="${adSource.source_id}"/>
			</c:if>
			<form:field name="source_name" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"' label="来源名称"  value="${adSource.source_name}" ></form:field>
			
			<c:if test="${ empty adSource}">
			<form:field name="referer" label="认可网站地址" attrs=''></form:field>
			</c:if>
			
			
			<form:field  label="目标平台类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="platform_type" attrs=""  enumName="t_platform_type" inputType="radio"  defaultValue="1"  enumKey="${adSource.platform_type}"/>
			</form:field>
			<form:field  label="计费类型"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="cost_type" attrs=""  enumName="t_cost_type" inputType="radio" defaultValue="1"  enumKey="${adSource.cost_type}"/>
			</form:field>	
			
			<form:field  label="是否打底源"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="backup" attrs="" defaultValue="0"  enumName="isOrNot" inputType="radio"   enumKey="${adSource.backup}"/>
			</form:field>
			<div class="form-title">
			投放策略控制（-1表示无限制）
            </div>
			
			<form:field name="maxPV" attrs='data-bv-notempty="true" type="range" min="-1"  max="100000000" ' label="总次数(PV)" defaultValue="-1"  value="${adSource.maxPV}" >
				
			</form:field>
			<form:field name="maxPerUV" attrs='data-bv-notempty="true" type="range" min="-1"  max="100000000" ' label="次数(单UV)" defaultValue="-1"   value="${adSource.maxPerUV}" >
				
			</form:field>
			<form:field name="maxPerIP" attrs='data-bv-notempty="true" type="range" min="-1"  max="100000000" ' label="次数(单IP)" defaultValue="-1"  value="${adSource.maxPerIP}" >
				
			</form:field>
			<form:field name="timeLimitUV" attrs='data-bv-notempty="true" type="range" min="-1"  max="100000000" ' label="UV时间间隔(秒)" defaultValue="-1"  value="${adSource.timeLimitUV}" >
				
			</form:field>
			<form:field name="timeLimitIP" attrs='data-bv-notempty="true" type="range" min="-1"  max="100000000" ' label="IP时间间隔(秒)" defaultValue="-1"  value="${adSource.timeLimitIP}" >
				
			</form:field>
			
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