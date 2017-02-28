<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adPubAdjustIncome_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adPubAdjustIncome/save2" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adPubAdjustIncome.id}" />
			<input type="hidden" name="dsp_type" value="1" />
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=statdate  value="<fmt:formatDate value="${adPubAdjustIncome.statdate}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="pub_id" attrs="" label="媒体id"  value="${adPubAdjustIncome.pub_id}" ></form:field>
		
			<form:field name="site_id" attrs="" label="站点id"  value="${adPubAdjustIncome.site_id}" ></form:field>
		
			<form:field name="slot_id" attrs="" label="广告位id"  value="${adPubAdjustIncome.slot_id}" ></form:field>
		
			<form:field name="income" attrs="" label="调整收入"  value="${adPubAdjustIncome.income}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=create_time  value="<fmt:formatDate value="${adPubAdjustIncome.create_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
			
		 <form:field label="收入调整类型" useBody="true">
					<tag:enum cssClass="select2me" name="adjust_type" attrs="" cssStyle="width:100%" enumName="ssp_income_adjust_type" inputType="radio" enumKey="${adPubAdjustIncome.adjust_type}"/>
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
	 $('.date-picker').datepicker();
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>