<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_template_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/template/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${template.id}" />
			<form:field name="name" attrs="" label="模板名称"  value="${template.name}" ></form:field>
		
			<form:field  label="尺寸"  useBody="true"  >
					<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="size" attrs=""  enumName="ea_size" inputType="radio"   enumKey="${template.size}"/>
			</form:field>
			
			<form:field  label="位置"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="location" attrs=""  enumName="ea_location" inputType="radio"   enumKey="${template.location}"/>
			</form:field>
		
		</div>
	<div class="  form-group ">
		<div class="pull-right form-btn">
			<!-- <div onclick="popup()" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>预览</div>  -->
			<button type="button" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="popup()">预览</button>
			<button class="btn btn-warning" type="reset"><i class="ace-icon fa fa-undo bigger-110"></i> 重置	</button>
			<button type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>确认</button>
		</div>
	</div>
	</form>
	<div  id="popup"  class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myLargeModalLabel">模板预览</h4>
                </div>
                <div class="modal-body" style="background-color: #f5dce1;height: 500px;position: relative;">
                
                	<div  id="changeData" style="background-color: #333;position: absolute;" ></div>
                	<div  id="changeData1" style="display:none; background-color: #333;position: absolute;" ></div>
                	
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
<script type="text/javascript">
function popup(){
	var show_size = $("input[name='size']:checked").val();
	
	var show_location = $("input[name='location']:checked").val();
	// show_location 代表展示的位置 1 右下角  2 对联 3 居中 4 低栏  5 顶栏
	var show_sizes = show_size.split("*");
	var widthData = show_sizes[0];
	var heightData = show_sizes[1];
// 	$("#popup").css({display: "block"});
	$("#changeData1").css({display: "none"});
	if(show_location == 1){
		$("#changeData").css({height: heightData,width:widthData,right: "0",bottom: "0",top: "auto",left: "auto"}); 
	}else if(show_location == 2){
		$("#changeData").css({height: heightData,width:widthData,bottom: "0",top: "0",left: "0",right: "auto",margin: "auto"});
		$("#changeData1").css({display: "block",height: heightData,width:widthData,right: "0",bottom: "0",top: "0",left: "auto",margin: "auto"});
	}else if(show_location == 3){
		$("#changeData").css({height: heightData,width:widthData,right: "0",bottom: "0",top: "0",left: "0",margin: "auto"});
	}else if(show_location == 4){
		$("#changeData").css({height: heightData,width:widthData,right: "0",bottom: "0",left: "0",top: "auto",margin: "auto"});
	}else if(show_location == 5){
		$("#changeData").css({height: heightData,width:widthData,right: "0",top: "0",left: "0",bottom: "auto",margin: "auto"});
	}
		
}


jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>