<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="媒体id"  value="${adPub.pub_id}" ></form:field>
		
			<form:field type="p" label="媒体名称"  value="${adPub.pub_name}" ></form:field>
		
			<form:field type="p" label="媒体联系方式"  value="${adPub.pub_tel}" ></form:field>
		
			<form:field type="p" label="媒体联系人"  value="${adPub.pub_linkman}" ></form:field>
		
			<form:field type="p" label="媒体描述"  value="${adPub.pub_desc}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adPub.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="更新时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adPub.update_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
		
			<form:field type="p" label="公司名称"  value="${adPub.company_name}" ></form:field>
		
			<form:field type="p" label="银行账号"  value="${adPub.bank_account}" ></form:field>
		
			<form:field type="p" label="开户行"  value="${adPub.opening_bank}" ></form:field>
		
			<form:field type="p" label="收款人"  value="${adPub.payee}" ></form:field>
			
			<form:field type="p" label="收款人联系方式"  value="${adPub.payee_tel}" ></form:field>
		
			<form:field type="p" label="邮箱"  value="${adPub.email}" ></form:field>
		
			<form:field  label="移动原始广告位ID"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adSourceSlot/view?id=${adPub.source_slot_id_mobile.id}"  data-handler="MODAL" data-title="信息">${adPub.source_slot_id_mobile.source_slot_number}</a>
			</form:field>
		
			<form:field  label="PC原始广告位ID"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/ssp/config/adSourceSlot/view?id=${adPub.source_slot_id_pc.id}"  data-handler="MODAL" data-title="信息">${adPub.source_slot_id_pc.source_slot_number}</a>
			</form:field>
			
		</div>
	</form>
