<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

	<form id="system_sysUser_update_pass_form_1" method="post" action="${ctx}/system/sysUser/saveInfo" class="form-horizontal" role="form">
			<div class="form-group">
				<div class="col-md-12">
					<div class="input-icon">
						<i class="fa fa-key"></i>
						<input type="password" class="form-control" name="oldpassword"  placeholder="原密码" required="true"  
																data-bv-stringlength="true"
                                                               data-bv-stringlength-min="6"
                                                               data-bv-stringlength-max="16" >
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12">
					<div class="input-icon">
						<i class="fa fa-key"></i>
						<input type="password" id="update_password" name="password" class="form-control" placeholder="新密码" required="true"
						data-bv-stringlength="true"
                                                               data-bv-stringlength-min="6"
                                                               data-bv-stringlength-max="16" >
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12">
					<div class="input-icon">
						<i class="fa fa-key"></i>
						<input type="password" class="form-control"  name="password1"   placeholder="确认密码" required="true"
						
                                                               data-bv-identical="true"
                                                               data-bv-identical-field="password"
                                                               data-bv-identical-message="确认密码与新密码不一致！"
                                                               
                                                               
                                                               >
					</div>
				</div>
			</div>
			
				<div class="form-group">
					<div class="col-md-12 ">
						<button type="submit" class="btn  btn-blue ">确定</button>
					</div>
				</div>


	</form>
<script type="text/javascript">
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'system_sysUser_update_pass_form_1'
	});
});
</script>