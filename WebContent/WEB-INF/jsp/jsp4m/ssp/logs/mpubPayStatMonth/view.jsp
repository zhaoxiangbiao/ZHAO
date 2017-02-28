<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${mpubPayStatMonth.statdate}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label=""  value="${mpubPayStatMonth.pub_id}" ></form:field>
		
			<form:field type="p" label="媒体名称"  value="${mpubPayStatMonth.pub_name}" ></form:field>
		
			<form:field type="p" label=""  value="${mpubPayStatMonth.request_count}" ></form:field>
		
			<form:field type="p" label=""  value="${mpubPayStatMonth.request_success_count}" ></form:field>
		
			<form:field type="p" label=""  value="${mpubPayStatMonth.show_count}" ></form:field>
		
			<form:field type="p" label=""  value="${mpubPayStatMonth.click_count}" ></form:field>
		
			<form:field type="p" label=""  value="${mpubPayStatMonth.close_count}" ></form:field>
		
			<form:field type="p" label=""  value="${mpubPayStatMonth.houver_count}" ></form:field>
		
			<form:field type="p" label="原始收入，系统计算结果"  value="${mpubPayStatMonth.originalincome}" ></form:field>
		
			<form:field type="p" label="税前收入"  value="${mpubPayStatMonth.income}" ></form:field>
		
			<form:field type="p" label="实际支付"  value="${mpubPayStatMonth.last_income}" ></form:field>
		
			<form:field type="p" label="税费"  value="${mpubPayStatMonth.tax}" ></form:field>
		
			<form:field type="p" label="发票编号"  value="${mpubPayStatMonth.invoicenumber}" ></form:field>
		
			<form:field type="p" label="支付状态 0：普通发票,1:增值税发票"  value="${mpubPayStatMonth.invoicetype}" ></form:field>
		
			<form:field type="p" label="审核状态 0：待审核,1:初审通过,2:复审通过"  value="${mpubPayStatMonth.checkstatus}" ></form:field>
		
			<form:field type="p" label="申请支付状态 0：未申请,1:已申请"  value="${mpubPayStatMonth.applystatus}" ></form:field>
		
			<form:field type="p" label="支付状态 0：未支付,1:已支付,2:支付返回"  value="${mpubPayStatMonth.paystatus}" ></form:field>
		
			<form:field  label="支付时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${mpubPayStatMonth.paytime}" pattern="yyyy-MM-dd"/>
			</form:field>
			
		</div>
	</form>
