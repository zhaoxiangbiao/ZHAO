<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adSlotCount_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adSlotCount/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adSlotCount.id}" />
			<form:field name="slot_id" attrs="" label="广告位ID"  value="${adSlotCount.slot_id}" ></form:field>
		
			<form:field name="slot_name" attrs="" label="广告位名称"  value="${adSlotCount.slot_name}" ></form:field>
		
			<form:field name="pub_id" attrs="" label="媒体ID"  value="${adSlotCount.pub_id}" ></form:field>
		
			<form:field name="slot_target_floor" attrs="" label="目标平台类型 1、电脑 2、移动设备"  value="${adSlotCount.slot_target_floor}" ></form:field>
		
			<form:field name="slot_url" attrs="" label="所在页面URL"  value="${adSlotCount.slot_url}" ></form:field>
		
			<form:field name="slot_type" attrs="" label="类型 0固定1漂浮2弹窗"  value="${adSlotCount.slot_type}" ></form:field>
		
			<form:field name="slot_setfree" attrs="" label="空闲设置"  value="${adSlotCount.slot_setfree}" ></form:field>
		
			<form:field name="slot_height" attrs="" label="高度"  value="${adSlotCount.slot_height}" ></form:field>
		
			<form:field name="slot_width" attrs="" label="宽度"  value="${adSlotCount.slot_width}" ></form:field>
		
			<form:field name="slot_postition" attrs="" label="所在屏幕位置"  value="${adSlotCount.slot_postition}" ></form:field>
		
			<form:field name="slot_residencetime" attrs="" label="停留时间"  value="${adSlotCount.slot_residencetime}" ></form:field>
		
			<form:field name="slot_close" attrs="" label="关闭按钮 0有1无"  value="${adSlotCount.slot_close}" ></form:field>
		
			<form:field name="slot_status" attrs="" label="广告位状态 0开始1停用"  value="${adSlotCount.slot_status}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=slot_create_time  value="<fmt:formatDate value="${adSlotCount.slot_create_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="source_slot_id" attrs="" label="原始广告位id"  value="${adSlotCount.source_slot_id}" ></form:field>
		
			<form:field name="slot_code" attrs="" label=""  value="${adSlotCount.slot_code}" ></form:field>
			
			
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