<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adSite_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/adSite/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adSite.id}" />
			<input name="site_id" type="hidden" value="${siteId}" />
			
			<form:field  label="媒体"  useBody="true"  attrs="">
				<input class="select2" name="pub_id.pub_id" type="hidden" style="width: 100%"  value="${adSite.pub_id.pub_id}" display-value="${adSite.pub_id.pub_name}" result-field="pub_name"  value-field="pub_id" lookup-url="${ctx}/ssp/config/adPub/listJSON" filter="filter_LIKES_pub_name" />
			</form:field>
			
			<form:field name="site_name" attrs="" label="站点名"  value="${adSite.site_name}" ></form:field>
		
			<form:field name="site_linkman" attrs="" label="站点联系人"  value="${adSite.site_linkman}" ></form:field>
			
			<form:field name="site_tel" attrs="" label="站点联系方式"  value="${adSite.site_tel}" ></form:field>
		
			<form:field name="site_desc" attrs="" label="站点描述"  value="${adSite.site_desc}" ></form:field>
		
			<form:field name="site_domain" attrs="" label="站点域名"  value="${adSite.site_domain}" ></form:field>
		
			<form:field name="resource_domain" attrs="" label="资源域名"  value="${adSite.resource_domain}" ></form:field>
			
			<form:field label="一级站点" useBody="true">
				<tag:enum id="gradeOne" cssClass="select2me" name="primary_site" attrs="" cssStyle="width:100%" enumName="t_primary_site" inputType="select" enumKey="${adSite.primary_site}"/>
			</form:field>
			
			<div id="webUnionGradeTwo">
				<form:field label="网盟二级站点" useBody="true">
					<tag:enum cssClass="select2me" name="grade_two_side" attrs="" cssStyle="width:100%" enumName="t_web_union_grade_two_site" inputType="select" enumKey="${adSite.grade_two_site}"/>
				</form:field>
			</div>
			
			<div id="cooperationGradeTwo">
				<form:field label="合作应用二级站点" useBody="true">
					<tag:enum cssClass="select2me" name="grade_two_side" attrs="" cssStyle="width:100%" enumName="t_cooperation_grade_two_site" inputType="select" enumKey="${adSite.grade_two_site}"/>
				</form:field>
			</div>
			
			<form:field label="iframe层数" useBody="true">
					<tag:enum cssClass="select2me" name="iframe_count" attrs="" cssStyle="width:100%" enumName="t_iframe_count" inputType="select" enumKey="${adSite.iframe_count}"/>
			</form:field>
			
			<form:field label="PC白名单状态" useBody="true">
					<tag:enum cssClass="select2me" name="pc_blacklist_status" attrs="" cssStyle="width:100%" enumName="t_ad_status" inputType="radio" enumKey="${adSite.pc_blacklist_status}"/>
			</form:field>
			
			<form:field label="移动白名单状态" useBody="true">
					<tag:enum cssClass="select2me" name="mobile_blacklist_status" attrs="" cssStyle="width:100%" enumName="t_ad_status" inputType="radio" enumKey="${adSite.mobile_blacklist_status}"/>
			</form:field>
			
	
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
	$("#cooperationGradeTwo").hide();
	$("#webUnionGradeTwo").hide();
});


	$("#gradeOne").change(function(){
		var val = $(this).val();
		if(val==13){
			$("#cooperationGradeTwo").hide();
			$("#webUnionGradeTwo").show();
		}else if(val==14){
			$("#webUnionGradeTwo").hide();
			$("#cooperationGradeTwo").show();
		}else{
			$("#cooperationGradeTwo").hide();
			$("#webUnionGradeTwo").hide();
		}
	});
	



</script>