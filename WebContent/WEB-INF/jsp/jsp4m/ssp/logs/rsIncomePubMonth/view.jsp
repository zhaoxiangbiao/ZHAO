<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="年份"  value="${rsIncomePubMonth.year}" ></form:field>
		
			<form:field type="p" label="月"  value="${rsIncomePubMonth.month}" ></form:field>
		
			<form:field type="p" label="媒体ID"  value="${rsIncomePubMonth.pub_id}" ></form:field>
		
			<form:field type="p" label="媒体名称"  value="${rsIncomePubMonth.pub_name}" ></form:field>
		
			<form:field type="p" label="税前收入"  value="${rsIncomePubMonth.last_income}" ></form:field>
		
			<form:field type="p" label="税率"  value="${rsIncomePubMonth.tax_ratio}" ></form:field>
		
			<form:field type="p" label="税费"  value="${rsIncomePubMonth.tax}" ></form:field>
		
			<form:field type="p" label="应支付（税后）"  value="${rsIncomePubMonth.pay}" ></form:field>
		
			<form:field type="p" label="发票编号"  value="${rsIncomePubMonth.invoicenumber}" ></form:field>
		
			<form:field type="p" label="发票类型  0：普通发票,1:增值税发票"  value="${rsIncomePubMonth.invoicetype}" ></form:field>
		
			<form:field type="p" label="状态"  value="${rsIncomePubMonth.status}" ></form:field>
		
			<form:field  label="状态时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${rsIncomePubMonth.status_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label=""  useBody="true" type="p"  >
				<fmt:formatDate value="${rsIncomePubMonth.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
			
		</div>
	</form>
