<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adDataPubStatDay_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adDataPubStatDay/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adDataPubStatDay.id}" />
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=statDate  value="<fmt:formatDate value="${adDataPubStatDay.statDate}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="pub_id" attrs="" label="媒体ID"  value="${adDataPubStatDay.pub_id}" ></form:field>
		
			<form:field name="income" attrs="" label="分成前结算收入"  value="${adDataPubStatDay.income}" ></form:field>
		
			<form:field name="last_income" attrs="" label="结算收入"  value="${adDataPubStatDay.last_income}" ></form:field>
		
			<form:field name="show_count" attrs="" label="展示统计"  value="${adDataPubStatDay.show_count}" ></form:field>
		
			<form:field name="click_count" attrs="" label="点击统计"  value="${adDataPubStatDay.click_count}" ></form:field>
		
			<form:field name="s_ctr" attrs="" label="点击率"  value="${adDataPubStatDay.s_ctr}" ></form:field>
		
			<form:field name="incomestr" attrs="" label="服务费率"  value="${adDataPubStatDay.incomestr}" ></form:field>
			
			
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