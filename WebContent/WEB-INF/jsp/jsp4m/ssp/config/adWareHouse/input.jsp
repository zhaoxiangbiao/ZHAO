<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adWareHouse_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/adWareHouse/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adWareHouse.id}" />
			<form:field  label="直客"  useBody="true"  attrs="">
				<input class="select2" style="width:100%" name="advert_id.advert_id" type="hidden"  value="${adWareHouse.advert_id.advert_id}" display-value="${adWareHouse.advert_id.name}" result-field="name" value-field="advert_id" lookup-url="${ctx}/ssp/config/adAdvertiser/listJSON" filter="filter_LIKES_name" />
			</form:field>
		
			<form:field name="wh_id" attrs="" label="物料ID"  value="${adWareHouse.wh_id}" ></form:field>
		
			<form:field name="name" attrs="" label="物料名称"  value="${adWareHouse.name}" ></form:field>
		
			<form:field name="des" attrs="" label="物料描述"  value="${adWareHouse.des}" ></form:field>
		
			<form:field name="type" attrs="" label="物料类型"  value="${adWareHouse.type}" ></form:field>
		
			<form:field name="text" attrs="" label="物料文本"  value="${adWareHouse.text}" ></form:field>
		
			<form:field name="img_url" attrs="" label="图片URL"  value="${adWareHouse.img_url}" ></form:field>
		
			<form:field name="img_path" attrs="" label="图片存放路径"  value="${adWareHouse.img_path}" ></form:field>
		
			<form:field name="img_link" attrs="" label="图片链接"  value="${adWareHouse.img_link}" ></form:field>
		
			<form:field name="text_link" attrs="" label="文本链接"  value="${adWareHouse.text_link}" ></form:field>
		
			<form:field name="width" attrs="" label="宽度"  value="${adWareHouse.width}" ></form:field>
		
			<form:field name="height" attrs="" label="高度"  value="${adWareHouse.height}" ></form:field>
			
			
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