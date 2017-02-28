<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adCountPub_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adCountPub/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adCountPub.id}" />
			<form:field  label="创建时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=time  value="<fmt:formatDate value="${adCountPub.time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="pubid" attrs="" label="媒体ID"  value="${adCountPub.pubid}" ></form:field>
		
			<form:field name="show" attrs="" label="展示量"  value="${adCountPub.show}" ></form:field>
		
			<form:field name="click" attrs="" label="点击量"  value="${adCountPub.click}" ></form:field>
		
			<form:field name="ctr" attrs="" label="点击率"  value="${adCountPub.ctr}" ></form:field>
		
			<form:field name="income" attrs="" label="收入"  value="${adCountPub.income}" ></form:field>
			
			
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