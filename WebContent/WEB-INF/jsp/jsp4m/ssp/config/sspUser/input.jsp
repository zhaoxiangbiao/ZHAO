<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_sspUser_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/sspUser/editSave" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${sspUser.id}" />
		
			<form:field name="user_name" attrs="" label="账户名"  value="${sspUser.user_name}" ></form:field>
			
			<form:field name="name" attrs="" label="昵称" readOnly="true" value="${sspUser.name}" ></form:field>
			
			<form:field  label="媒体"  useBody="true"  attrs="">
				<input class="select2" name="pub_id.pub_id" readonly="true" style="width:100%"  value="${sspUser.pub_id.pub_id}" display-value="${sspUser.pub_id.pub_name}" />
			</form:field>
			
			<c:if test="${sspUser.site_id!=null}">
				<form:field  label="站点"  useBody="true"  attrs="">
					<input class="select2" name="site_id.site_id" readonly="true" style="width:100%" value="${sspUser.site_id.site_id}" display-value="${sspUser.site_id.site_name}" />
				</form:field>
			</c:if>
		
			<form:field name="password1" attrs="data-bv-identical='true' data-bv-identical-field='password2'  data-bv-identical-message='两次密码输入不一致！'" type="password" label="修改密码"  value="" ></form:field>
			
			<form:field name="password2" attrs="data-bv-identical='true' data-bv-identical-field='password1'  data-bv-identical-message='两次密码输入不一致！'" type="password" label="请确认新密码"  value="" ></form:field>
		
			<input name="user_desc" type="hidden" value="${sspUser.user_desc}"/>
		
			<input name="user_type" type="hidden" value="${sspUser.user_type}"/>
		
			<input name="user_dept" type="hidden" value="${sspUser.user_dept}"/>
		
			<input name="user_role" type="hidden"  value="${sspUser.user_role}"/>
		
			<input name="insert_user" type="hidden" value="${sspUser.insert_user}"/>
		
			<input name="last_update_user" type="hidden" value="${sspUser.last_update_user}"/>
			
			<input name="user_level" type="hidden"  value="${sspUser.user_level}"/>
			
			<input name="is_del" type="hidden" value="${sspUser.is_del}">
		
			
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