<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/adWareHouse/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_ADWAREHOUSE_" ></c:set>
<c:set scope="page" var="dataTitle" value="直客物料" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_adWareHouse_1" ></c:set>
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
									<label  class="col-sm-4 control-label no-padding-right">直客</label>
									<div class="col-sm-8">
									<input placeholder=''  class="form-control select2 " name="filter_EQI_advert_id.id" type="hidden"  result-field="name"   lookup-url="${ctx }/ssp/config/adAdvertiser/listJSON" filter="filter_LIKES_name" />
									</div>
								</div>
							
			
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">物料名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_name"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">物料描述</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_des"  placeholder="">
								</div>
								</div>
							
			
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">物料文本</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_text"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">图片URL</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_img_url"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">图片存放路径</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_img_path"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">图片链接</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_img_link"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">文本链接</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_text_link"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">宽度</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_width"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">高度</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_height"  placeholder="">
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
			{sTitle:'直客',
			  mData: "advert_id" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a  href="${ctx}/ssp/config/adAdvertiser/view?id='+data.id+'"  data-handler="MODAL" data-title="直客">'+data.name+'<i class="ace-icon fa fa-external-link"></i></a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },		
			{sTitle:'物料ID',  mData: "wh_id",uxLongText:true},				
			{sTitle:'物料名称',  mData: "name",uxLongText:true},				
			{sTitle:'物料描述',  mData: "des",uxLongText:true},				
			{sTitle:'物料类型',  mData: "type",uxLongText:true},				
			{sTitle:'物料文本',  mData: "text",uxLongText:true},				
			{sTitle:'图片URL',  mData: "img_url",uxLongText:true},				
			{sTitle:'图片存放路径',  mData: "img_path",uxLongText:true},				
			{sTitle:'图片链接',  mData: "img_link",uxLongText:true},				
			{sTitle:'文本链接',  mData: "text_link",uxLongText:true},				
			{sTitle:'宽度',  mData: "width",uxLongText:true},				
			{sTitle:'高度',  mData: "height",uxLongText:true},		        
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
