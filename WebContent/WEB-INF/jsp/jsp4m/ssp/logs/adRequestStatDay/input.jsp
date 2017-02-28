<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_logs_adRequestStatDay_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/logs/adRequestStatDay/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adRequestStatDay.id}" />
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=statdate  value="<fmt:formatDate value="${adRequestStatDay.statdate}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="request_today" attrs="" label="当日请求次数"  value="${adRequestStatDay.request_today}" ></form:field>
		
			<form:field name="request_history" attrs="" label="历史累计请求总次数"  value="${adRequestStatDay.request_history}" ></form:field>
		
			<form:field name="request" attrs="" label="累计请求总次数"  value="${adRequestStatDay.request}" ></form:field>
			
			
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