<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/adSourceSlot/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_ADSOURCESLOT_" ></c:set>
<c:set scope="page" var="dataTitle" value="原始广告位" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_adSourceSlot_1" ></c:set>
<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="data-div">
					<div class="widget collapsed " style="margin-bottom:5px;">
			<div class="widget-header ">
				<span class="widget-caption">数据列表</span>
                  <div class="widget-buttons">
                        
                        <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="广告来源" data-form="true">查询</button>
                        <a href="#" data-toggle="collapse">
                            <i class="fa blue fa-plus"></i>
                        </a>
                    </div>
                  <div class="widget-buttons buttons-bordered">
								<sec:authorize ifAllGranted="${rolePrev }NEW">
									<button href="${urlPrev }new" class="btn btn-palegreen btn-xs "  data-handler="INLINE" data-title="${dataTitle }" data-form=true>
										新增
									</button>
								</sec:authorize>
								<sec:authorize ifAllGranted="${rolePrev }DELETE">
									<button href="${urlPrev }delete" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM" data-set="#${tableId } .checkboxes">
										删除
									</button>
								</sec:authorize>
							</div>
						</div>
						<div class="widget-body">
						
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
										
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">原始广告位名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_source_slot_name"  placeholder="">
								</div>
								</div>
							
								
								<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">来源</label>
									<div class="col-sm-8">
									<input class=" select2 " style="width:57%;width: auto;" name="filter_EQI_source_id.source_id" type="hidden"  result-field="source_name"  value-field="source_id" lookup-url="${ctx }/ssp/config/adSource/listJSON" filter="filter_EQI_source_id.source_id" />
									</div>
								</div>
							
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">状态</label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQI_status" cssStyle="width:57%" attrs="placeholder=''" cssClass="select2me"  enumName="t_ad_status" tagType="edit" />
								
								</div>
								</div>
	 					
						</form>
						</div>
						</div>
						
						
						<div class="widget no-header ">
			
			<div class="widget-body">
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">
						</table>
						
						</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
</div>
	<!-- END ROW CONTENT-->
		

<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	//look-up 查询条件 会员 
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	

 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[1, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'原始广告位ID',  mData: "source_slot_id",uxLongText:true},				
			{sTitle:'原始广告位Number',  mData: "source_slot_number",uxLongText:true},				
			{sTitle:'广告位名称',  mData: "source_slot_name",uxLongText:true},	

			{sTitle:'来源',
						  mData: "source_id" ,
					 	  mRender:function(data){
					 		  if(data && data.id){
					 		  	  return '<a  href="${ctx}/ssp/config/adSource/view?id='+data.id+'"  data-handler="MODAL" data-title="来源">'+data.source_name+'<i class="ace-icon fa fa-external-link"></i></a>'
					 		  }else{
					 			  return data;
					 		  }
					 	  }
					    },
			//{sTitle:'来源',mData: "source_id.source_name",uxLongText:true},
			{sTitle:'宽度',mData: "source_slot_width" ,uxEnum:'t_slot_width'},
			{sTitle:'高度',mData: "source_slot_height" ,uxEnum:'t_slot_height'},		
			//{sTitle:'所在页面URL',  mData: "source_slot_code",uxLongText:true},				
						
			{sTitle:'原始广告位状态', mData: "status" ,uxEnum:'t_ad_status',uxFastSet:true},		        
          {uxCogs:[
	          {name:"查看"}
	          <sec:authorize ifAllGranted="${rolePrev }EDIT">
	          ,{name:"修改"}
	          </sec:authorize>
	          <sec:authorize ifAllGranted="${rolePrev }DELETE"> 
	          ,{name:"删除"}
	          </sec:authorize>
          ]}
        ]
	           
 });
});
</script>
