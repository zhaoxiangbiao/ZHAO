<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adPub_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/adPub/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adPub.id}" />
			<input name="pub_id" value="${adPub.pub_id}" />
		
			<form:field name="pub_name" attrs="" label="媒体名称"  value="${adPub.pub_name}" ></form:field>
		
			<form:field name="pub_tel" attrs="" label="媒体联系方式"  value="${adPub.pub_tel}" ></form:field>
		
			<form:field name="pub_linkman" attrs="" label="媒体联系人"  value="${adPub.pub_linkman}" ></form:field>
		
			<form:field name="pub_desc" attrs="" label="媒体描述"  value="${adPub.pub_desc}" ></form:field>
		
			<form:field name="pub_status" attrs="" label="媒体状态"  value="${adPub.pub_status}" ></form:field>
				
			<form:field name="company_name" attrs="" label="公司名称"  value="${adPub.company_name}" ></form:field>
		
			<form:field name="bank_account" attrs="" label="银行账号"  value="${adPub.bank_account}" ></form:field>
		
			<form:field name="opening_bank" attrs="" label="开户行"  value="${adPub.opening_bank}" ></form:field>
		
			<form:field name="payee" attrs="" label="收款人"  value="${adPub.payee}" ></form:field>
			
			<form:field name="payee_tel" attrs="" label="收款人联系方式"  value="${adPub.payee_tel}" ></form:field>
		
			<form:field name="email" attrs="" label="邮箱"  value="${adPub.email}" ></form:field>
		
		 	<form:field  label="PC原始广告位"  useBody="true"  attrs="">
				<input class=" select2" style="width:100%" name="source_slot_id_pc.source_slot_id" type="hidden"   value="${adPub.source_slot_id_pc.source_slot_id}" display-value="${adPub.source_slot_id_pc.source_slot_name}" result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_number" />
			</form:field>
			
			<form:field  label="移动原始广告位"  useBody="true"  attrs="">
				<input class=" select2" style="width:100%" name="source_slot_id_mobile.source_slot_id" type="hidden"   value="${adPub.source_slot_id_mobile.source_slot_id}" display-value="${adPub.source_slot_id_mobile.source_slot_name}" result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_number" />
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
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>