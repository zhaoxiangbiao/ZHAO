<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_radRequestRefererStat_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/radRequestRefererStat/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${radRequestRefererStat.id}" />
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=statdate  value="<fmt:formatDate value="${radRequestRefererStat.statdate}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="pub_id" attrs="" label="媒体id"  value="${radRequestRefererStat.pub_id}" ></form:field>
		
			<form:field name="site_id" attrs="" label="站点id"  value="${radRequestRefererStat.site_id}" ></form:field>
		
			<form:field name="slot_id" attrs="" label="广告位id"  value="${radRequestRefererStat.slot_id}" ></form:field>
		
			<form:field name="pub_name" attrs="" label="媒体名称"  value="${radRequestRefererStat.pub_name}" ></form:field>
		
			<form:field name="site_name" attrs="" label="站点名"  value="${radRequestRefererStat.site_name}" ></form:field>
		
			<form:field name="slot_name" attrs="" label="广告位名称"  value="${radRequestRefererStat.slot_name}" ></form:field>
		
			<form:field name="client_type" attrs="" label=""  value="${radRequestRefererStat.client_type}" ></form:field>
		
			<form:field name="referer_host" attrs="" label=""  value="${radRequestRefererStat.referer_host}" ></form:field>
		
			<form:field name="referer" attrs="" label=""  value="${radRequestRefererStat.referer}" ></form:field>
		
			<form:field name="total" attrs="" label=""  value="${radRequestRefererStat.total}" ></form:field>
			
			
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