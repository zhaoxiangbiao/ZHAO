<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adSourceSlot_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/ssp/config/adSourceSlot/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${adSourceSlot.id}" />
			<input name="source_slot_id" type="hidden" value="${AutoId}"/>
		
			<form:field name="source_slot_number" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"' label="原始广告位number"  value="${adSourceSlot.source_slot_number}" ></form:field>
		
			<form:field name="source_slot_name" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"' label="广告位名称"  value="${adSourceSlot.source_slot_name}" ></form:field>
		
			<form:field  label="来源"  useBody="true"  attrs="">
				<input class=" select2" style="width:100%;width:auto;" name="source_id.source_id" type="hidden"   value="${adSourceSlot.source_id.source_id}" display-value="${adSourceSlot.source_id.source_name}" result-field="source_name" value-field="source_id"  lookup-url="${ctx}/ssp/config/adSource/listJSON" filter="filter_LIKES_source_name" />
			</form:field>
		
			<form:field  label="尺寸"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="source_slot_width" attrs=""  enumName="t_ad_slot_size" inputType="radio"   enumKey="${adSourceSlot.source_slot_width}"/>
			</form:field>
		
			<form:field  label="是否为主广告位"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="master" attrs=""  enumName="isOrNot" inputType="radio"   enumKey="${adSourceSlot.master}"/>
			</form:field>
			
			<form:field  label="是否进行缩放"  useBody="true"  >
				<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="positon_control" attrs=""  enumName="isOrNot" inputType="radio"   enumKey="${adSourceSlot.positon_control}"/>
			</form:field>
			
			<form:field  label="遮罩位置"  useBody="true"  >
				<div class="checkbox">
					<label>
						<input type="checkbox" id="position0" name="position" />			
						<span class="text">左上角</span>
					</label>
				</div>
				<div class="checkbox">
					<label>
						<input type="checkbox" id="position1" name="position" />			
						<span class="text">右上角</span>
					</label>
				</div>
				<div class="checkbox">
					<label>
						<input type="checkbox" id="position2" name="position" />			
						<span class="text">左下角</span>
					</label>
				</div>
				<div class="checkbox">
					<label>
						<input type="checkbox" id="position3" name="position" />			
						<span class="text">右下角</span>
					</label>
				</div>

			</form:field>
			<form:field  label="关闭按钮"  useBody="true"  >
				<div class="checkbox">
					<label>
						<input type="radio" id="_close_hide_0" name="closeHide" value="0" />			
						<span class="text">不透明</span>
						
					</label>
					<label>
						<input type="radio" id="_close_hide_1" name="closeHide" value="1"/>			
						<span class="text">透明</span>
					</label>
				</div>
			</form:field>
			<input id="menuPosition" name="menu_position" type="hidden" value="${adSourceSlot.menu_position}"/>
			<form:field name="source_slot_code" attrs="" type="textarea" rows="10" label="代码"  value="${adSourceSlot.source_slot_code}" ></form:field>
			<form:field name="white_list" attrs="" type="textarea" rows="10" label="定向域名"  value="${adSourceSlot.white_list}" ></form:field>
			<form:field name="iframe_feature" attrs="" type="textarea" rows="10" label="广告iframe特征"  value="${adSourceSlot.iframe_feature}" ></form:field>

			
			
		</div>
	<div class="  form-group ">
		<div class="pull-right form-btn">
			<button class="btn btn-warning" type="reset"><i class="ace-icon fa fa-undo bigger-110"></i> 重置	</button>
			<button id="commit" type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>确认</button>
		</div>
	</div>
	</form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
	//根据menu_position的位置给checkbox赋值
	var positionValues = $("#menuPosition").val();
	for(var i=0;i<4;i++){
		var checkedValue = positionValues.charAt(i);
		if(checkedValue==1){
			$("#position"+i).attr("checked",true);
		}
		
	}
	// 第5位代表关闭按钮是否透明 1=透明 0=不透明 （如果没有第5位则默认不透明）
	if(positionValues &&　positionValues.length>=5){
		if(positionValues[4]==1){
			$("#_close_hide_1").attr("checked",true);
		}else{
			$("#_close_hide_0").attr("checked",true);
		}
	}else{
		$("#_close_hide_0").attr("checked",true);
	}
	
});

//在提交的时候获取check选中的值
/* $("#commit").click(function(){
	var result = "";
	$("input[name='position']").each(function(){
	    var num = this.checked ? 1 : 0;
	    result+=num;
	});
	$("#menuPosition").val(result);
}); */
 
$("#commit").click(function(){
	var result = "";
	var num1 = $("#position0").prop("checked") ? 1 : 0;
	var num2 = $("#position1").prop("checked") ? 1 : 0;
	var num3 = $("#position2").prop("checked") ? 1 : 0;
	var num4 = $("#position3").prop("checked") ? 1 : 0;
	var num5 = $("#_close_hide_1").prop("checked") ? 1 : 0;// 第5位代表关闭按钮是否透明 1=透明 0=不透明 （如果没有第5位则默认不透明）
	result = ""+num1+num2+num3+num4+num5;
	$("#menuPosition").val(result);
}); 

</script>