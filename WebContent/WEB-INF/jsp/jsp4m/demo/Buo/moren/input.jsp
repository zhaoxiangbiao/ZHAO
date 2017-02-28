<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_demo_Buo_moren_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/demo/Buo/moren/save" class="form-horizontal" >
		<div class="form-body">
			<input type="hidden" name="id" value="${moren.id}" />
			<form:field name="name" attrs="" label="名字"  value="${moren.name}" ></form:field>
		
			<form:field  label="出生日期"  useBody="true"  >
			<div class="input-group">                                       
				<input type="text" class="form-control mask_date_time" name="age"  value="<fmt:formatDate value="${moren.age}" pattern="yyyy-MM-dd hh:mm:ss" />">
				<span class="input-group-btn">
				<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
				</span>
				</div>
			</form:field>
		
			<form:field  label="变身时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control  mask_time"  name="changeTime"   value="${moren.changeTime}">
				<span class="input-group-btn">
				<button class="btn default "  type="button"><i class="fa fa-clock-o"></i></button>
				</span>
			</div>
			</form:field>
			
			
		</div>
		<div class="form-actions right">
			<button type="button" class="btn default remove">取消</button>
			<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
		</div>
	</form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>