<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_rsIncomePubMonth_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/rsIncomePubMonth/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${rsIncomePubMonth.id}" />
			<form:field name="year" attrs="" label="年份"  value="${rsIncomePubMonth.year}" ></form:field>
		
			<form:field name="month" attrs="" label="月"  value="${rsIncomePubMonth.month}" ></form:field>
		
			<form:field name="pub_id" attrs="" label="媒体ID"  value="${rsIncomePubMonth.pub_id}" ></form:field>
		
			<form:field name="pub_name" attrs="" label="媒体名称"  value="${rsIncomePubMonth.pub_name}" ></form:field>
		
			<form:field name="last_income" attrs="" label="税前收入"  value="${rsIncomePubMonth.last_income}" ></form:field>
		
			<form:field name="tax_ratio" attrs="" label="税率"  value="${rsIncomePubMonth.tax_ratio}" ></form:field>
		
			<form:field name="tax" attrs="" label="税费"  value="${rsIncomePubMonth.tax}" ></form:field>
		
			<form:field name="pay" attrs="" label="应支付（税后）"  value="${rsIncomePubMonth.pay}" ></form:field>
		
			<form:field name="invoicenumber" attrs="" label="发票编号"  value="${rsIncomePubMonth.invoicenumber}" ></form:field>
		
			<form:field name="invoicetype" attrs="" label="发票类型  0：普通发票,1:增值税发票"  value="${rsIncomePubMonth.invoicetype}" ></form:field>
		
			<form:field name="status" attrs="" label="状态"  value="${rsIncomePubMonth.status}" ></form:field>
		
			<form:field  label="状态时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=status_time  value="<fmt:formatDate value="${rsIncomePubMonth.status_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field  label=""  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=create_time  value="<fmt:formatDate value="${rsIncomePubMonth.create_time}" pattern="yyyy-MM-dd"/>">
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