<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adSourceReferer_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/adSourceReferer/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adSourceReferer.id}" />
			<form:field useBody="true" label="来源ID" id="sourceId" value="${adSourceReferer.source_id}" >
				<select id="orz" name="source_id" value="${adSourceReferer.source_id}">
					<c:forEach items="${sourceList}" var="item" >
						<option style="width:600px" value="${item.source_id}" <c:if test="${item.source_id==adSourceReferer.source_id}"> selected='selected'</c:if> >${item.source_name}(${item.source_id})</option>
					</c:forEach>
				</select>
			</form:field>
		
			<form:field name="referer" attrs="" label="认可网站地址"  value="${adSourceReferer.referer}" ></form:field>
		
		
			
			
			
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

$("#orz").change(function(){
	$("#sourceId").val($(this).val());
});
</script>