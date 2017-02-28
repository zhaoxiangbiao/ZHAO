<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_mpubPayStatMonth_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/mpubPayStatMonth/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${mpubPayStatMonth.id}" />
			<input  type="hidden"  name="pub_id" attrs="" label=""  value="${mpubPayStatMonth.pub_id}"/>
			
			<form:field  label="媒体名称"  useBody="true"  >
				<div class="input-group "> 
					<input  type="text" readonly="true" name="pub_name" attrs="" label=""  value="${mpubPayStatMonth.pub_name}"/>
				</div>
			</form:field>

			<form:field  label="账期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" name="statdate" readonly="true"  read class="form-control date-picker"  data-date-format="yyyy-mm-dd"   value="<fmt:formatDate value="${mpubPayStatMonth.statdate}" pattern="yyyy-MM-dd"/>">
			</div>
			</form:field>			
			<form:field name="invoicenumber" attrs="" label="发票编号"  value="${mpubPayStatMonth.invoicenumber}" ></form:field>
			<form:field name="income" attrs="" label="税前费用"  value="${mpubPayStatMonth.income}" ></form:field>
			<form:field name="tax" attrs="" label="代扣税"  value="${mpubPayStatMonth.tax}" ></form:field>
			<form:field name="last_income" attrs="" label="实际费用"  value="${mpubPayStatMonth.last_income}" ></form:field>
			<form:field  label="审核状态"  useBody="true"  >
				<tag:enum id="checkstatus" cssClass="select2me" name="checkstatus" attrs="" cssStyle="width:100%" enumName="t_pub_income_checkstatus" inputType="select" enumKey="${mpubPayStatMonth.checkstatus}"/>
			</form:field>	
			 <form:field  label="付款状态"  useBody="true"  >
				<tag:enum id="paystatus" cssClass="select2me" name="paystatus" attrs="" cssStyle="width:100%" enumName="payStatus" inputType="select" enumKey="${mpubPayStatMonth.paystatus}"/>
			</form:field>			
			<input  type="hidden"  name="request_count" attrs="" label=""  value="${mpubPayStatMonth.request_count}"/>
			<input  type="hidden"  name="request_success_count" attrs="" label=""  value="${mpubPayStatMonth.request_success_count}"/>
			<input  type="hidden"  name="show_count" attrs="" label=""  value="${mpubPayStatMonth.show_count}"/>
			<input  type="hidden"  name="click_count" attrs="" label=""  value="${mpubPayStatMonth.click_count}"/>
			<input  type="hidden"  name="close_count" attrs="" label=""  value="${mpubPayStatMonth.close_count}"/>
			<input  type="hidden"  name="houver_count" attrs="" label=""  value="${mpubPayStatMonth.houver_count}"/>
			<input  type="hidden"  name="originalincome" attrs="" label="原始收入，系统计算结果"  value="${mpubPayStatMonth.originalincome}"/>		
			<!-- <input  type="hidden"  name="invoicenumber" attrs="" label="发票编号"  value="${mpubPayStatMonth.invoicenumber}"/> -->
		
			<input  type="hidden"  name="invoicetype" attrs="" label="支付状态 0：普通发票,1:增值税发票"  value="${mpubPayStatMonth.invoicetype}"/>
		
	 		<input  type="hidden"  name="applystatus" attrs="" label="申请支付状态 0：未申请,1:已申请"  value="${mpubPayStatMonth.applystatus}"/>	
	 			                                       
			 
		
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