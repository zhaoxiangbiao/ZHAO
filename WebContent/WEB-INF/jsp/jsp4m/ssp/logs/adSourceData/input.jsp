<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adSourceData_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adSourceData/save" class="form-horizontal bv-form" >
	
		<div class="form-body">
			<input type="hidden" name="id" value="${adSourceData.id}" />
			<input id="url" type="hidden" value="${pageContext.request.contextPath}"/>  
			<form:field  label="来源ID"  useBody="true"  attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"'>
				<input id="sourceId" class=" select2" style="width:100%" name="source_id.source_id" type="hidden" value="${adSourceData.source_id.source_id}" display-value="${adSourceData.source_id.source_name}" result-field="source_name" value-field="source_id"  lookup-url="${ctx}/ssp/config/adSource/listJSON" filter="filter_LIKES_source_name" />
			</form:field>
		
			<form:field  label="原始广告位ID"  useBody="true"  attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"'>
				<input id="sourceSlotId" class=" select2" style="width:100%" name="source_slot_id.source_slot_id" type="hidden"   value="${adSourceData.source_slot_id.source_slot_id}" display-value="${adSourceData.source_slot_id.source_slot_name}" result-field="source_slot_name"  lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" value-field="source_slot_id" filter="filter_LIKES_source_slot_number" />
			</form:field>
		
			<form:field  label="统计日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name="statdate"  value="<fmt:formatDate value="${adSourceData.count_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="pv" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$" data-bv-regexp-message="请输入数字！"' label="广告源PV"  value="${adSourceData.pv}" ></form:field>
		
			<form:field name="click" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$" data-bv-regexp-message="请输入数字！"' label="广告源点击量"  value="${adSourceData.click}" ></form:field>
		
			<form:field name="income" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+\.[0-9]{2}$" data-bv-regexp-message="请精确到小数点后两位！"' label="广告源收入"  value="${adSourceData.income}" ></form:field>
			
			
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

var path ="";        
$(function(){                               
    path = $("#url").val();  
      
}); 

$("#sourceId").change(function(){
	var source_id=$(this).val();
	var href = window.location.href;
	console.log(href);
	var array = href.split("#");
	console.log(array[0]);
	var url = array[0]+ '#!/sys/main/index4m#!/ssp/config/adSourceSlot/ajax?sourceId='+source_id;
	
	$("#sourceSlotId").attr("lookup-url",url);

});
$('.date-picker').datepicker();
</script>