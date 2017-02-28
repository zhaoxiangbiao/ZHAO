<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_siteUrlFilter_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/siteUrlFilter/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${siteUrlFilter.id}" />
			<form:field name="pub_id" attrs="" label="站点所属媒体"  value="${siteUrlFilter.pub_id}" ></form:field>
		
			<form:field name="site_id" attrs="" label="站点"  value="${siteUrlFilter.site_id}" ></form:field>
		
			<form:field name="type" attrs="" label="名单类型(0：黑名单；1白名单)"  value="${siteUrlFilter.type}" ></form:field>
		
			<form:field name="domain" attrs="" label=""  value="${siteUrlFilter.domain}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=create_time  value="<fmt:formatDate value="${siteUrlFilter.create_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
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