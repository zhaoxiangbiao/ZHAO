<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_logs_lcAll_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/logs/lcAll/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${lcAll.id}" />
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=counttime  value="<fmt:formatDate value="${lcAll.counttime}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="rs" attrs="" label="推送总数量"  value="${lcAll.rs}" ></form:field>
		
			<form:field name="pv" attrs="" label="展示总数量"  value="${lcAll.pv}" ></form:field>
		
			<form:field name="uv" attrs="" label="用户数"  value="${lcAll.uv}" ></form:field>
		
			<form:field name="cli" attrs="" label="总点击量"  value="${lcAll.cli}" ></form:field>
		
			<form:field name="clo" attrs="" label="总关闭数量"  value="${lcAll.clo}" ></form:field>
			
			
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