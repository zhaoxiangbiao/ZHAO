<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adPub_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adPub/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adPub.id}" />
			<form:field name="pub_id" attrs="" label="媒体id"  value="${adPub.pub_id}" ></form:field>
		
			<form:field name="pub_name" attrs="" label="媒体名称"  value="${adPub.pub_name}" ></form:field>
		
			<form:field name="pub_tel" attrs="" label="媒体联系方式"  value="${adPub.pub_tel}" ></form:field>
		
			<form:field name="pub_linkman" attrs="" label="媒体联系人"  value="${adPub.pub_linkman}" ></form:field>
		
			<form:field name="pub_desc" attrs="" label="媒体描述"  value="${adPub.pub_desc}" ></form:field>
		
			<form:field name="pub_status" attrs="" label="媒体状态"  value="${adPub.pub_status}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=create_time  value="<fmt:formatDate value="${adPub.create_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field  label="更新时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=update_time  value="<fmt:formatDate value="${adPub.update_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
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