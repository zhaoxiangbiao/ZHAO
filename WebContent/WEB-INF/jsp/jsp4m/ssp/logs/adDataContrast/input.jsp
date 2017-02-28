<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adDataContrast_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adDataContrast/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adDataContrast.id}" />
			<form:field  label="统计日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=count_time  value="<fmt:formatDate value="${adDataContrast.count_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="source_slot_number" attrs="" label="原始广告位id"  value="${adDataContrast.source_slot_number}" ></form:field>
		
			<form:field name="source_slot_name" attrs="" label="广告位名称"  value="${adDataContrast.source_slot_name}" ></form:field>
		
			<form:field name="t_pv" attrs="" label="第三方广告PV"  value="${adDataContrast.t_pv}" ></form:field>
		
			<form:field name="t_click" attrs="" label="第三方广告点击"  value="${adDataContrast.t_click}" ></form:field>
		
			<form:field name="t_ctr" attrs="" label="第三方广告ctr"  value="${adDataContrast.t_ctr}" ></form:field>
		
			<form:field name="s_pv" attrs="" label="自有统计PV"  value="${adDataContrast.s_pv}" ></form:field>
		
			<form:field name="s_click" attrs="" label="自有统计点击量"  value="${adDataContrast.s_click}" ></form:field>
		
			<form:field name="s_ctr" attrs="" label="自有统计ctr"  value="${adDataContrast.s_ctr}" ></form:field>
			
			
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