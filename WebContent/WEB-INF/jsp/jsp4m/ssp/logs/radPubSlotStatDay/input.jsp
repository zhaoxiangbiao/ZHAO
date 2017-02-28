<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_radPubSlotStatDay_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adPubAdjustIncome/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${radPubSlotStatDay.id}" />
			<input type="hidden" name="pub_id" value="${radPubSlotStatDay.pub_id}" />
			<input type="hidden" name="site_id" value="${radPubSlotStatDay.site_id}" />
			<input type="hidden" name="slotid.slot_id" value="${radPubSlotStatDay.slotid.slot_id}" />
			<input type="hidden" name="adjust_id" value="${adjust_id}" />
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text"  readOnly="true" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=statdate  value="<fmt:formatDate value="${radPubSlotStatDay.statdate}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
			
<%-- 			<input type="text" name="statdate" readOnly="true" attrs="" label="日期" value="<fmt:formatDate value="${radPubSlotStatDay.statdate}" pattern="yyyy-MM-dd"/>"/>
 --%>			
			
			<form:field name="slot_name" readOnly="true" attrs="" label="广告位"  value="${radPubSlotStatDay.slotid.slot_name}" ></form:field>
		
		
		
			<form:field name="request_count" readOnly="true" attrs="" label="请求次数"  value="${radPubSlotStatDay.request_count}" ></form:field>
		
			<form:field name="request_success_count" readOnly="true" attrs="" label="有效请求次数"  value="${radPubSlotStatDay.request_success_count}" ></form:field>
		
			<form:field name="show_count" readOnly="true" attrs="" label="展示次数"  value="${radPubSlotStatDay.show_count}" ></form:field>
		
			<form:field name="click_count"  readOnly="true" attrs="" label="点击次数"  value="${radPubSlotStatDay.click_count}" ></form:field>
		
			<form:field name="close_count" readOnly="true" attrs="" label="关闭次数"  value="${radPubSlotStatDay.close_count}" ></form:field>
		
			<form:field name="houver_count"  readOnly="true" attrs="" label="悬浮次数"  value="${radPubSlotStatDay.houver_count}" ></form:field>
		
			<form:field name="ratio"  readOnly="true" attrs="" label="分成比例"  value="${radPubSlotStatDay.ratio}" ></form:field>
			
			<form:field name="income"  readOnly="true" attrs="" label="分成前结算收入"  value="${radPubSlotStatDay.income}" ></form:field>
		
			<form:field name="last_income"  readOnly="true" attrs="" label="结算收入"  value="${radPubSlotStatDay.last_income}" ></form:field>			
			
			<form:field name="update_income" attrs="" label="最终结算收入"  value="${income}" ></form:field>			
			
			<form:field label="收入调整类型" useBody="true">
					<tag:enum cssClass="select2me" name="adjust_type" attrs="" cssStyle="width:100%" enumName="ssp_income_adjust_type" inputType="radio" enumKey="${adjust_type}"/>
			</form:field>
			
		</div>
		<div class="form-actions right">
			<button type="button" class="btn default remove">取消</button>
			<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认修改</button>
		</div>
	</form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>