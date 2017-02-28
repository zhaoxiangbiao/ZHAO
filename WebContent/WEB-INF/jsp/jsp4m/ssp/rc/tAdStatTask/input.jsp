<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<c:set scope="page" var="formId" value="form_ssp_rc_tAdStatTask_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/rc/tAdStatTask/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${tAdStatTask.id}" />
		
			<form:field  label="日期"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"   name=stat_date  value="" />
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
		
			<form:field name="hour" attrs="" label="小时"  value="${tAdStatTask.hour}" ></form:field>
		
			<form:field  label="统计周期 "  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="type" attrs=""  enumName="stat_cycle" inputType="radio" defaultValue="1"   enumKey="${tAdStatTask.type}"/>
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