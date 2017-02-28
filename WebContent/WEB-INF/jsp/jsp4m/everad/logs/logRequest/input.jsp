<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_logs_logRequest_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/logs/logRequest/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${logRequest.id}" />
			<form:field name="phone_number" attrs="" label="账号"  value="${logRequest.phone_number}" ></form:field>
		
			<form:field  label="请求时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=action_time  value="<fmt:formatDate value="${logRequest.action_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="terminal" attrs="" label="终端类型"  value="${logRequest.terminal}" ></form:field>
		
			<form:field name="domain" attrs="" label="域名"  value="${logRequest.domain}" ></form:field>
		
			<form:field name="url" attrs="" label="url地址"  value="${logRequest.url}" ></form:field>
		
			<form:field name="status" attrs="" label="推送状态 "  value="${logRequest.status}" ></form:field>
		
			<form:field name="taskid" attrs="" label="任务id"  value="${logRequest.taskid}" ></form:field>
		
			<form:field name="ua" attrs="" label="UA"  value="${logRequest.ua}" ></form:field>
		
			<form:field name="sn" attrs="" label="序列号"  value="${logRequest.sn}" ></form:field>
			
			
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