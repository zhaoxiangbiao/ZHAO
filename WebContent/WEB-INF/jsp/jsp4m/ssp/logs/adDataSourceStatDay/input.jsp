<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adDataSourceStatDay_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adDataSourceStatDay/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adDataSourceStatDay.id}" />
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=stat_date  value="<fmt:formatDate value="${adDataSourceStatDay.stat_date}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="source_id" attrs="" label="广告源ID"  value="${adDataSourceStatDay.source_id}" ></form:field>
		
			<form:field name="source_name" attrs="" label="广告源名称"  value="${adDataSourceStatDay.source_name}" ></form:field>
		
			<form:field name="show_count" attrs="" label="展示统计"  value="${adDataSourceStatDay.show_count}" ></form:field>
		
			<form:field name="click_count" attrs="" label="点击统计"  value="${adDataSourceStatDay.click_count}" ></form:field>
		
			<form:field name="cpm" attrs="" label="CPM"  value="${adDataSourceStatDay.cpm}" ></form:field>
		
			<form:field name="cpc" attrs="" label="CPC"  value="${adDataSourceStatDay.cpc}" ></form:field>
		
			<form:field name="income" attrs="" label="收入"  value="${adDataSourceStatDay.income}" ></form:field>
			
			
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