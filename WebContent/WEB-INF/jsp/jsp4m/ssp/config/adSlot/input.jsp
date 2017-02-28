<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adSlot_1" ></c:set>
<!-- 

	<form id="${formId }" method="post" action="${ctx}/ssp/config/adSlot/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adSlot.id}" />
			
		
		
		<form:field  label="类型 "  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_type_mobile" attrs=""  enumName="t_slot_type_mobile" inputType="radio"   enumKey="${adSlot.slot_type_mobile}"/>
		</form:field>  
			
		
			

 -->

			
		
			
			
		
			
			
		
			
		
			
		
			<!-- 
			
			<form:field  label="创建时间"  useBody="true"  >
			<div class="input-group ">                                       
				<input type="text" class="form-control date-picker"  data-date-format="yyyy-mm-dd" name=slot_create_time  value="<fmt:formatDate value="${adSlot.slot_create_time}" pattern="yyyy-MM-dd"/>">
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>
			</form:field>
			
			<form:field name="source_slot_id_mobile" attrs="" label="移动原始广告位id"  value="${adSlot.source_slot_id_mobile}" ></form:field>
		
			<form:field name="source_slot_id_pc" attrs="" label="PC原始广告位id"  value="${adSlot.source_slot_id_pc}" ></form:field>
			 -->
			
		
			
			
			
		<input id="slot_target_floor" name ="slot_target_floor" type="hidden" value="${adSlot.slot_target_floor}" />
		
	
		<ul id="myTab" class="nav nav-tabs">  
        <li class="active"><a href="#home" data-toggle="tab">移动加PC</a></li>  
        <li><a href="#pc" data-toggle="tab">PC</a></li>  
        <li><a href="#mobile" data-toggle="tab">移动</a></li>  
		</ul>  
		
		<div class="tab-content">
			
			<div class="tab-pane fade in active" id="home">
			
			
			<form id="${formId }_1" method="post" action="${ctx}/ssp/config/adSlot/save" class="form-horizontal bv-form" >
			<div class="form-body">
			<input type="hidden" name="id" value="${adSlot.id}" />
			<input name ="slot_target_floor" type="hidden" value="3" />
			<input name ="slot_type_pc" type="hidden" value="1" />
			<input name ="slot_type_mobile" type="hidden" value="11" />
			
			<form:field name="slot_id" attrs="" label="广告位ID"  value="${AutoId}" ></form:field>
			<form:field name="slot_name" attrs="" label="广告位名称"  value="${adSlot.slot_name}" ></form:field>
		
			<form:field  label="媒体"  useBody="true"  attrs="">
				<input class=" select2"  style="width:100%" name="pub_id.pub_id"  type="hidden"  value="${adSlot.pub_id.pub_id}" display-value="${adSlot.pub_id.pub_name}"  result-field="pub_name" value-field="pub_id" lookup-url="${ctx}/ssp/config/adPub/listJSON" filter="filter_LIKES_pub_name" />
			</form:field>
			<div class="row">
			
			<div class="col-lg-6 col-sm-6 col-xs-12">
                  <div class="well with-header">
                        <div class="header bordered-palegreen">移动</div>
                                       
                                  
             
             
             <form:field  label="移动原始广告位ID"  useBody="true"  attrs="">
				<input class=" select2" style="width:100%" name="source_slot_id_mobile.source_slot_id" type="hidden"   value="${adSlot.source_slot_id_mobile.source_slot_id}" display-value="${adSlot.source_slot_id_mobile.source_slot_name}" result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_name" />
			</form:field>
			
                 
			
			<form:field  label="尺寸"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_mobile" attrs=""  enumName="t_ad_slot_size" inputType="radio"   enumKey="${adSlot.slot_width_mobile}"/>
			</form:field>
			
			
			<form:field  label="最大展示时间"  useBody="true"  >
			<div class="spinbox spinbox-horizontal">                                       
				<input type="text" class="spinbox-input form-control"   name="slot_residencetime_mobile"  value="${adSlot.slot_residencetime_mobile}">
				<div class="spinbox-buttons	btn-group">

                     <button type="button" class="btn spinbox-down blueberry">
                          <i class="fa fa-minus"></i>
                      </button>
                      <button type="button" class="btn spinbox-up purple">
                          <i class="fa fa-plus"></i>
                     </button>
             	</div>
			</div>
			</form:field>
			 <div>
                       </div>
				</div>
			</div>
			
			<div class="col-lg-6 col-sm-6 col-xs-12">
                  <div class="well with-header">
                        <div class="header bordered-palegreen">PC</div>
                                       
                      <form:field  label="PC原始广告位ID"  useBody="true"  attrs="">
				<input class=" select2" style="width:100%" name="source_slot_id_pc.source_slot_id" type="hidden"   value="${adSlot.source_slot_id_pc.source_slot_id}" display-value="${adSlot.source_slot_id_pc.source_slot_name}" result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_name" />
			</form:field>
			
			
			<form:field  label="尺寸"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_size" inputType="radio"   enumKey="${adSlot.slot_width_pc}"/>
			</form:field>
			
			<form:field  label="最大展示时间"  useBody="true"  >
			<div class="spinbox spinbox-horizontal">                                       
				<input type="text" class="spinbox-input form-control"   name="slot_residencetime_pc"  value="${adSlot.slot_residencetime_pc}" >
				<div class="spinbox-buttons	btn-group">

                     <button type="button" class="btn spinbox-down blueberry">
                          <i class="fa fa-minus"></i>
                      </button>
                      <button type="button" class="btn spinbox-up purple">
                          <i class="fa fa-plus"></i>
                     </button>
             	</div>
			</div>
			</form:field>
			 <div>
                       </div>
				</div>
			</div>

	</div>
		
			</div>
			
			
			  
			
			
			
	<div class="  form-group ">
		<div class="pull-right form-btn">
			<button class="btn btn-warning" type="reset"><i class="ace-icon fa fa-undo bigger-110"></i> 重置	</button>
			<button type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>确认</button>
		</div>
	</div>
			
	</form>
			
	</div>
		

			
	
	<div class="tab-pane" id="pc">
			
		<form id="${formId }_2" method="post" action="${ctx}/ssp/config/adSlot/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adSlot.id}" />
			<input name ="slot_target_floor" type="hidden" value="1" />
			<input name ="slot_type_pc" type="hidden" value="1" />
			
			<form:field name="slot_id" attrs="" label="广告位ID"  value="${AutoId}" ></form:field>
			<form:field name="slot_name" attrs="" label="广告位名称"  value="${adSlot.slot_name}" ></form:field>
		
			<form:field  label="媒体"  useBody="true"  attrs="">
				<input class=" select2"  style="width:100%" name="pub_id.pub_id" type="select" value="${adSlot.pub_id.pub_id}" display-value="${adSlot.pub_id.pub_name}"  result-field="pub_name" value-field="pub_id" lookup-url="${ctx}/ssp/config/adPub/listJSON" filter="filter_LIKES_pub_name" />
			</form:field>
			
			<form:field  label="PC原始广告位ID"  useBody="true"  attrs="">
				<input class=" select2" style="width:100%" name="source_slot_id_pc.source_slot_id" type="select" value="${adSlot.source_slot_id_pc.source_slot_id}" display-value="${adSlot.source_slot_id_pc.source_slot_name}" result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_name" />
			</form:field>
		
			<form:field  label="尺寸"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_size" inputType="radio"   enumKey="${adSlot.slot_width_pc}"/>
			</form:field> 
			
			<form:field  label="最大展示时间"  useBody="true"  >
			<div class="spinbox spinbox-horizontal">                                       
				<input type="text" class="spinbox-input form-control"   name="slot_residencetime_pc"  value="${adSlot.slot_residencetime_pc}" >
				<div class="spinbox-buttons	btn-group">

                     <button type="button" class="btn spinbox-down blueberry">
                          <i class="fa fa-minus"></i>
                      </button>
                      <button type="button" class="btn spinbox-up purple">
                          <i class="fa fa-plus"></i>
                     </button>
             	</div>
			</div>
			</form:field>
						
			</div>
			
	<div class="  form-group ">
		<div class="pull-right form-btn">
			<button class="btn btn-warning" type="reset"><i class="ace-icon fa fa-undo bigger-110"></i> 重置	</button>
			<button type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>确认</button>
		</div>
	</div>
	</form>
	</div>
		
	
			
		
		
		<div class="tab-pane" id="mobile">
			
		<form id="${formId }_3" method="post" action="${ctx}/ssp/config/adSlot/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adSlot.id}" />
			<input name ="slot_target_floor" type="hidden" value="2" />
			<input name ="slot_type_mobile" type="hidden" value="11" />
			
			<form:field name="slot_id" attrs="" label="广告位ID"  value="${AutoId}" ></form:field>
			<form:field name="slot_name" attrs="" label="广告位名称"  value="${adSlot.slot_name}" ></form:field>
		
			<form:field  label="媒体"  useBody="true"  attrs="">
				<input class=" select2"  style="width:100%" name="pub_id.pub_id" type="select" value="${adSlot.pub_id.pub_id}" display-value="${adSlot.pub_id.pub_name}"  result-field="pub_name" value-field="pub_id" lookup-url="${ctx}/ssp/config/adPub/listJSON" filter="filter_LIKES_pub_name" />
			</form:field>
			
			<form:field  label="移动原始广告位ID"  useBody="true"  attrs="">
				<input class=" select2" style="width:100%" name="source_slot_id_mobile.source_slot_id" type="select" value="${adSlot.source_slot_id_mobile.source_slot_id}" display-value="${adSlot.source_slot_id_mobile.source_slot_name}" result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_name" />
			</form:field>  
			
			<form:field  label="尺寸"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_mobile" attrs=""  enumName="t_ad_slot_size" inputType="radio"   enumKey="${adSlot.slot_width_mobile}"/>
			</form:field>
			
			
			
			<form:field  label="最大展示时间"  useBody="true"  >
			<div class="spinbox spinbox-horizontal">                                       
				<input type="text" class="spinbox-input form-control"   name="slot_residencetime_mobile"  value="${adSlot.slot_residencetime_mobile}">
				<div class="spinbox-buttons	btn-group">

                     <button type="button" class="btn spinbox-down blueberry">
                          <i class="fa fa-minus"></i>
                      </button>
                      <button type="button" class="btn spinbox-up purple">
                          <i class="fa fa-plus"></i>
                     </button>
             	</div>
			</div>
			</form:field>
			
			</div>
			
	<div class="  form-group ">
		<div class="pull-right form-btn">
			<button class="btn btn-warning" type="reset"><i class="ace-icon fa fa-undo bigger-110"></i> 重置	</button>
			<button type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>确认</button>
		</div>
	</div>
			</form>
	</div>
		
	
			
			<h2 style=" text-align:center;">展示时间为0时，表示长久显示</h2>
			
	
                                           
			
				
		
	</div>

		
		
		<!-- 
			</div>
			<div class="  form-group ">
		<div class="pull-right form-btn">
			<button class="btn btn-warning" type="reset"><i class="ace-icon fa fa-undo bigger-110"></i> 重置	</button>
			<button type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>确认</button>
		</div>
	</div>
	</form>
		
		
		 -->
	
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }_1'
	});
	FormSamples.init({
		formId:'${formId }_2'
	});
	FormSamples.init({
		formId:'${formId }_3'
	});
});

$(function () { 
	
	var target = $("#slot_target_floor").val();
    if(target==1){
    	$('#myTab a[href="#pc"]').tab('show');
    }else if(target==2){
    	$('#myTab a:last').tab('show');
    }else{
       $('#myTab a:first').tab('show');
  	  
    }
  
    $('#myTab a').click(function (e) { 
      e.preventDefault();
      $(this).tab('show');
      
    }) 
  }) 
  
   $('.spinbox').spinbox({step:10});

</script>