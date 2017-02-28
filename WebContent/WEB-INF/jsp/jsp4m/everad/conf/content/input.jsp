<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_content_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/content/save" class="form-horizontal bv-form" enctype="multipart/form-data">
		<div class="form-body">
			<input type="hidden" name="id" value="${content.id}" />
			<form:field name="content_name" attrs="" label="内容名称"  value="${content.content_name}" ></form:field>
		
	<%-- 	<form:field  label="标签"  useBody="true"  attrs="">
				<input class="form-control select2" name="label.id" type="hidden"   value="${content.label.id}" display-value="${content.label.label}" result-field="label"   lookup-url="${ctx}/everad/conf/labels/listJSON" filter="filter_LIKES_label" />
			</form:field> --%>
		
			<form:field  label="内容类型"  useBody="true"  >
				<tag:enum defaultValue="1" cssClass="form-control form-control-inline input-medium select2me" name="content_type" attrs=""  enumName="ea_content_type" inputType="radio"  enumKey="${content.content_type}"/>
				
			</form:field>
		
			<form:field groupId="xingshi" label="形式"  useBody="true"  >
				<tag:enum  defaultValue="1" cssClass="form-control form-control-inline input-medium select2me" name="content_shape" attrs=""  enumName="ea_content_shape" inputType="radio"   enumKey="${content.content_shape}"/>
			</form:field>
		
		
			<form:field  groupId="chicun" label="尺寸"  useBody="true"  >
				<tag:enum defaultValue="300px*250px" cssClass="form-control form-control-inline input-medium select2me" name="content_size" attrs=""  enumName="ea_size" inputType="radio"   enumKey="${content.content_size}"/>
			</form:field>
		
		
			<form:field groupId="content_sourceurl" name="content_sourceurl" attrs="" label="资源地址"  value="${content.content_sourceurl}" ></form:field>
		
			<form:field groupId="content_jumpurl" name="content_jumpurl" attrs="" label="跳转地址"  value="${content.content_jumpurl}" ></form:field>
			
			<form:field groupId="content_sourceurl2" name="content_sourceurl2" attrs="" label="资源地址2"   value="${content.content_sourceurl2}" ></form:field>
			
			<form:field  groupId="content_jumpurl2" name="content_jumpurl2" attrs="" label="跳转地址2"  value="${content.content_jumpurl2}" ></form:field>
			<div class="form-group" id="material">
                 <label for="group-pay-cpc" class="col-md-3 col-sm-3 control-label">物料</label>

                 <div class=" col-md-9 form-inline">
                     
                    <form:img  width="300" height="250" name="facePicture" value="" img_url="${dsp_resource_server_url_pre }${content.content_sourceurl }"></form:img> 
                 </div>

             </div>
             <div class="form-group" id="material2">
                 <label for="group-pay-cpc" class="col-md-3 col-sm-3 control-label">物料2</label>

                 <div class=" col-md-9 form-inline">
                     
                    <form:img  width="300" height="250" name="facePicture2" value="" img_url="${dsp_resource_server_url_pre }${content.content_sourceurl2 }"></form:img> 
                 </div>

             </div>
		</div>
	<div class="  form-group ">
		<div class="pull-right form-btn">
			<!-- <div onclick="showContent()" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>预览</div> -->
			<button type="button" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="showContent()">预览</button>
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
                    <h4 class="modal-title" id="myLargeModalLabel">内容预览</h4>
                </div>
                <center> <iframe id="ifreamId" style="" src=""></iframe></center>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
<!--      <div id="closeyulan" onclick="closeAd()" style="display: none;position:fixed;bottom:0;" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>关闭预览</div>  -->
<script type="text/javascript">
function  showContent(){
	
	var url = $('input[name="content_sourceurl"]').val()
	var flag = $("input[name='content_type']:checked").val();
	if(flag==2&& url != null && url != '' ){
		 var show_size = $("input[name='content_size']:checked").val();
		  
		 
		  // show_location 代表展示的位置 1 右下角  2 对联 3 居中 4 低栏  5 顶栏
		  var show_sizes = show_size.split("*");
		  var widthData = show_sizes[0];
		  var heightData = show_sizes[1];
		$("#ifreamTask").show();
		$('#ifreamId').attr('src',url);
		$('#ifreamId').css({
			height: heightData,
			width: widthData,
			border:"0px"
			});
		$("#closeyulan").show();
	}
}
function closeAd(){
	$("#ifreamTask").hide();
	$("#closeyulan").hide();
}
var flag = $("input[name='content_type']:checked").val();
var flag1 =  $("input[name='content_shape']:checked").val();

	
	
	$("input[name='content_size']").change(function(){
    	var flag = $("input[name='content_type']:checked").val();
    	var show_size = $("input[name='content_size']:checked").val();
		  
		 
		  // show_location 代表展示的位置 1 右下角  2 对联 3 居中 4 低栏  5 顶栏
		  var show_sizes = show_size.split("*");
		  var widthData = show_sizes[0];
		  var heightData = show_sizes[1];
		if(flag==1){
			$("#material .fileupload-new").css({
				height: heightData,
				width: widthData
			});
			$("#material .fileupload-new img").css({
				height: heightData,
				width: widthData
			});
			$("#material2 .fileupload-new ").css({
				height: heightData,
				width: widthData
			});
			$("#material2 .fileupload-new img").css({
				height: heightData,
				width: widthData
			});
			
			
			$("#material .fileupload").css({
				height: heightData,
				width: widthData,
				"max-height": heightData,
				"max-width": widthData
			});
			$("#material .fileupload .fileupload-preview").css({
				height: heightData,
				width: widthData,
				"max-height": heightData,
				"max-width": widthData
			});
			$("#material .fileupload img").css({
				height: heightData,
				width: widthData,
				"max-height": heightData,
				"max-width": widthData
			});
			$("#material2 .fileupload ").css({
				height: heightData,
				width: widthData,
				"max-height": heightData,
				"max-width": widthData
			});
			$("#material2 .fileupload .fileupload-preview").css({
				height: heightData,
				width: widthData,
				"max-height": heightData,
				"max-width": widthData
			});
			$("#material2 .fileupload img").css({
				height: heightData,
				width: widthData,
				"max-height": heightData,
				"max-width": widthData
			});
		}else if(flag==2){
			
			$('#ifreamId').css({
				height: heightData,
				width: widthData,
				border:"0px"
				});
		}
    });  
	
    $("input[name='content_type']").change(function(){  
    	var flag = $("input[name='content_type']:checked").val();
    	if(flag == 2){
    		$("#material").hide();
    		$("#material2").hide();
//     		$("#chicun").hide();
//     		$("#xingshi").hide();
    		$("#content_sourceurl2").hide();  
    		$("#content_jumpurl2").hide();  
    		$("#content_jumpurl").hide();  
    	}
    	if(flag == 1){
    		$("#material").show();	
    		$("#material2").show();
    	    $("#chicun").show();
    	    $("#xingshi").show();
    	    $("#content_sourceurl2").show();
    		$("#content_jumpurl2").show();
    		$("#content_jumpurl").show(); 
    		$("#ifreamTask").hide();
    	}
    });  
    $("input[name='content_shape']").change(function(){  
    	var flag1 =  $("input[name='content_shape']:checked").val();
    	if(flag1 == 1){
    		$("#material2").hide();
    	    $("#content_sourceurl2").hide();
    		$("#content_jumpurl2").hide();
    	}
    	if(flag1 == 2){
    		$("#material2").show();
    	    $("#content_sourceurl2").show();
    		$("#content_jumpurl2").show();
    	}
    
 }); 
 
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	if(flag == 2){
  		$("#material").hide();
		$("#material2").hide();
// 		$("#chicun").hide();
// 		$("#xingshi").hide();
		$("#content_sourceurl2").hide();  
		$("#content_jumpurl2").hide();  
		$("#content_jumpurl").hide(); 
	}
   if(flag == 1){
	    $("#material").show();	
		$("#material2").show();
// 	    $("#chicun").show();
// 	    $("#xingshi").show();
	    $("#content_sourceurl2").show();
		$("#content_jumpurl2").show();
		$("#content_jumpurl").show();  
		
   }
   if(flag1 == 1){
		$("#material2").hide();
	    $("#content_sourceurl2").hide();
		$("#content_jumpurl2").hide();
	}
	if(flag1 == 2){
		$("#material2").show();
	    $("#content_sourceurl2").show();
		$("#content_jumpurl2").show();
	}
});
</script>