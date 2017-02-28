<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${adPubSlotIncomeAdjustDay.statdate}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="媒体id"  value="${adPubSlotIncomeAdjustDay.pub_id}" ></form:field>
		
			<form:field type="p" label="站点id"  value="${adPubSlotIncomeAdjustDay.site_id}" ></form:field>
		
			<form:field type="p" label="广告id"  value="${adPubSlotIncomeAdjustDay.slot_id}" ></form:field>
		
			<form:field type="p" label="请求次数"  value="${adPubSlotIncomeAdjustDay.request_count}" ></form:field>
		
			<form:field type="p" label="有效请求次数"  value="${adPubSlotIncomeAdjustDay.request_success_count}" ></form:field>
		
			<form:field type="p" label="展示次数"  value="${adPubSlotIncomeAdjustDay.show_count}" ></form:field>
		
			<form:field type="p" label="点击次数"  value="${adPubSlotIncomeAdjustDay.click_count}" ></form:field>
		
			<form:field type="p" label="关闭次数"  value="${adPubSlotIncomeAdjustDay.close_count}" ></form:field>
		
			<form:field type="p" label="悬浮次数"  value="${adPubSlotIncomeAdjustDay.houver_count}" ></form:field>
		
			<form:field type="p" label="分成比例"  value="${adPubSlotIncomeAdjustDay.ratio}" ></form:field>
		
			<form:field type="p" label="原始收入"  value="${adPubSlotIncomeAdjustDay.income}" ></form:field>
		
			<form:field type="p" label="净收入（应支出）"  value="${adPubSlotIncomeAdjustDay.last_income}" ></form:field>
		
			<form:field type="p" label="原始单价"  value="${adPubSlotIncomeAdjustDay.cpm}" ></form:field>
		
			<form:field type="p" label="调整后单价"  value="${adPubSlotIncomeAdjustDay.cpm_adjust}" ></form:field>
		
			<form:field type="p" label="实际支出"  value="${adPubSlotIncomeAdjustDay.pay_adjust}" ></form:field>
		
			<form:field type="p" label="状态 0=初始  1=待审核 2=审核通过 3=审核不同过"  value="${adPubSlotIncomeAdjustDay.status}" ></form:field>
			
		</div>
	</form>
