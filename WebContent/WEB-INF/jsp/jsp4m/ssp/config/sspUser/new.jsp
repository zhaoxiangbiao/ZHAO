<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_sspUser_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/sspUser/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sspUser.id}" />
		
			<form:field name="user_name" attrs="data-bv-identical='true'" label="账户名"  value="${sspUser.user_name}"></form:field>
			
			<form:field name="password1" attrs="data-bv-identical='true' data-bv-identical-field='password'  data-bv-identical-message='两次密码输入不一致！'" type="password" label="请输入密码"  value="" ></form:field>
			
			<form:field name="password" attrs="data-bv-identical='true' data-bv-identical-field='password1'  data-bv-identical-message='两次密码输入不一致！'" type="password" label="请确认密码"  value="" ></form:field>
			
			<form:field name="name" attrs="" label="昵称" value="${sspUser.name}" ></form:field>
			
			<form:field  label="媒体"  useBody="true"  attrs="">
				<input class="select2" name="pub_id.pub_id" type="hidden" style="width: 100%"  value="${sspUser.pub_id.pub_id}" display-value="${sspUser.pub_id.pub_name}" result-field="pub_name"  value-field="pub_id" lookup-url="${ctx}/ssp/config/adPub/listJSON" filter="filter_LIKES_pub_name" />
			</form:field>
			
			<form:field  label="用户角色"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="user_role" attrs=""  enumName="t_user_role" inputType="radio"/>
			</form:field>
		
			<form:field name="user_desc" label="用户描述" value="${sspUser.user_desc}"></form:field>
			
			<input name="insert_user" type="hidden" value="${sspUser.insert_user}"/>
		
			<input name="last_update_user" type="hidden" value="${sspUser.last_update_user}"/>
			
			<input name="user_level" type="hidden"  value="0"/>
			
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