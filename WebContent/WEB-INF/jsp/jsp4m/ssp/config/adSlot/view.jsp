<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
		
			<!-- 
			<form:field type="p" label="广告位ID"  value="${adSlot.slot_id}" ></form:field>
		
			<form:field type="p" label="广告位名称"  value="${adSlot.slot_name}" ></form:field>
		
			<form:field  label="媒体"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adPub/view?id=${adSlot.pub_id.id}"  data-handler="MODAL" data-title="信息">${adSlot.pub_id.pub_name}</a>
			</form:field>
		
			<form:field  label="目标平台类型 1、电脑 2、移动设备 3~移动加pc"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="t_ad_target_type" enumKey="${adSlot.slot_target_floor}" />
			</form:field>
			
		
			<form:field  label="类型 0固定1漂浮2弹窗"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="t_slot_type" enumKey="${adSlot.slot_type_pc}" />
			</form:field>
			
		
			<form:field  label="类型 0固定1漂浮2弹窗"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="t_slot_type" enumKey="${adSlot.slot_type_mobile}" />
			</form:field>
			
		
			<form:field  label="高度"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="t_slot_height" enumKey="${adSlot.slot_height_pc}" />
			</form:field>
			
		
			<form:field  label="宽度"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="t_slot_width" enumKey="${adSlot.slot_width_pc}" />
			</form:field>
			
		
			<form:field  label=""  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="t_slot_width" enumKey="${adSlot.slot_width_mobile}" />
			</form:field>
			
		
			<form:field  label=""  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="t_slot_height" enumKey="${adSlot.slot_height_mobile}" />
			</form:field>
			
		
			<form:field type="p" label="最大展示时间"  value="${adSlot.slot_residencetime_mobile}" ></form:field>
		
			<form:field type="p" label="最大展示时间"  value="${adSlot.slot_residencetime_pc}" ></form:field>
		
			<form:field type="p" label="广告位状态 0开始1停用"  value="${adSlot.status}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adSlot.slot_create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="原始广告位id"  value="${adSlot.source_slot_id_mobile}" ></form:field>
		
			<form:field type="p" label="原始广告位id"  value="${adSlot.source_slot_id_pc}" ></form:field>
		
			<form:field type="p" label="1为逻辑删除"  value="${adSlot.is_del}" ></form:field>
			
			
			
<script  src="http://www.ad2bus.cn/20150611/js/show.1.1.js?_qwert_sid=801891156&_zxcvb_pid=867202002" type="text/javascript" charset="utf-8"></script>
			 -->
			
			<form:field  label="代码"  useBody="false" type="textarea" rows="20" value="<script  src=\"http://${msg}/20150611/js/show.1.1.js?_qwert_sid=${adSlot.slot_id}&_zxcvb_pid=${adSlot.pub_id.pub_id}\" type=\"text/javascript\" charset=\"utf-8\"></script>" >
			</form:field>
			
		</div>
	</form>
