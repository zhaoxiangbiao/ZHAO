<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="广告位ID"  value="${adSlotCount.slot_id}" ></form:field>
		
			<form:field type="p" label="广告位名称"  value="${adSlotCount.slot_name}" ></form:field>
		
			<form:field type="p" label="媒体ID"  value="${adSlotCount.pub_id}" ></form:field>
		
			<form:field type="p" label="目标平台类型 1、电脑 2、移动设备"  value="${adSlotCount.slot_target_floor}" ></form:field>
		
			<form:field type="p" label="所在页面URL"  value="${adSlotCount.slot_url}" ></form:field>
		
			<form:field type="p" label="类型 0固定1漂浮2弹窗"  value="${adSlotCount.slot_type}" ></form:field>
		
			<form:field type="p" label="空闲设置"  value="${adSlotCount.slot_setfree}" ></form:field>
		
			<form:field type="p" label="高度"  value="${adSlotCount.slot_height}" ></form:field>
		
			<form:field type="p" label="宽度"  value="${adSlotCount.slot_width}" ></form:field>
		
			<form:field type="p" label="所在屏幕位置"  value="${adSlotCount.slot_postition}" ></form:field>
		
			<form:field type="p" label="停留时间"  value="${adSlotCount.slot_residencetime}" ></form:field>
		
			<form:field type="p" label="关闭按钮 0有1无"  value="${adSlotCount.slot_close}" ></form:field>
		
			<form:field type="p" label="广告位状态 0开始1停用"  value="${adSlotCount.slot_status}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adSlotCount.slot_create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="原始广告位id"  value="${adSlotCount.source_slot_id}" ></form:field>
		
			<form:field type="p" label=""  value="${adSlotCount.slot_code}" ></form:field>
			
		</div>
	</form>
