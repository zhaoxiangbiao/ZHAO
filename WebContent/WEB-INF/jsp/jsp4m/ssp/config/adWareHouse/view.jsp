<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="直客"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adAdvertiser/view?id=${adWareHouse.advert_id.id}"  data-handler="MODAL" data-title="信息">${adWareHouse.advert_id.name}</a>
			</form:field>
		
			<form:field type="p" label="物料ID"  value="${adWareHouse.wh_id}" ></form:field>
		
			<form:field type="p" label="物料名称"  value="${adWareHouse.name}" ></form:field>
		
			<form:field type="p" label="物料描述"  value="${adWareHouse.des}" ></form:field>
		
			<form:field type="p" label="物料类型"  value="${adWareHouse.type}" ></form:field>
		
			<form:field type="p" label="物料文本"  value="${adWareHouse.text}" ></form:field>
		
			<form:field type="p" label="图片URL"  value="${adWareHouse.img_url}" ></form:field>
		
			<form:field type="p" label="图片存放路径"  value="${adWareHouse.img_path}" ></form:field>
		
			<form:field type="p" label="图片链接"  value="${adWareHouse.img_link}" ></form:field>
		
			<form:field type="p" label="文本链接"  value="${adWareHouse.text_link}" ></form:field>
		
			<form:field type="p" label="宽度"  value="${adWareHouse.width}" ></form:field>
		
			<form:field type="p" label="高度"  value="${adWareHouse.height}" ></form:field>
			
		</div>
	</form>
