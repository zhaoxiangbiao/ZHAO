<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
		
		
				<form:field  label="时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adRequest.action_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="广告物料ID"  value="${adRequest.advert_id}" ></form:field>
			
			
			
		
			<form:field type="p" label="客户ID"  value="${adRequest.client_id}" ></form:field>
		
			
			<form:field  label="媒体"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adPub/view?id=${adRequest.pub_id.id}"  data-handler="MODAL" data-title="信息">${adRequest.pub_id.pub_name}</a>
			</form:field>
		
			
			<form:field  label="广告位"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adPub/view?id=${adRequest.slot_id.id}"  data-handler="MODAL" data-title="信息">${adRequest.slot_id.name}</a>
			</form:field>
		
			<form:field type="p" label="广告位尺寸"  value="${adRequest.ad_size}" ></form:field>
		
			<form:field type="p" label="内网ip"  value="${adRequest.intranet_ip}" ></form:field>
		
			<form:field type="p" label="外网IP"  value="${adRequest.client_ip}" ></form:field>
		
			<form:field type="p" label="客户端浏览器类型"  value="${adRequest.browser_type}" ></form:field>
		
			<form:field type="p" label="客户端浏览器语言"  value="${adRequest.browser_language}" ></form:field>
		
			<form:field type="p" label="终端类型(pc为 0,移动端1)"  value="${adRequest.client_type}" ></form:field>
		
			<form:field type="p" label="终端分辨率"  value="${adRequest.client_resolution}" ></form:field>
		
			<form:field type="p" label="操作系统类型"  value="${adRequest.os_type}" ></form:field>
		
			<form:field type="p" label="是否支持cookie"  value="${adRequest.allow_cookie}" ></form:field>
		
			<form:field type="p" label="是否成功"  value="${adRequest.success}" ></form:field>
		
			<form:field type="p" label="广告所在URL地址"  value="${adRequest.referer}" ></form:field>
		
			<form:field type="p" label="搜狐统计ip"  value="${adRequest.sohu_ip}" ></form:field>
		
			<form:field type="p" label="搜狐统计城市"  value="${adRequest.sohu_city}" ></form:field>、

		
			
			
		</div>
	</form>
