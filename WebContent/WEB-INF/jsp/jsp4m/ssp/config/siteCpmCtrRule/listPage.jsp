<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/siteCpmCtrRule/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_SITECPMCTRRULE_" ></c:set>
<c:set scope="page" var="dataTitle" value="" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_siteCpmCtrRule_1" ></c:set>
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
							<label  class="col-sm-4 control-label no-padding-right">创建时间</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="datetime_createtime"  type="text" />
						</div>
						</div>
							
	
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">最后更新时间</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="datetime_updatetime"  type="text" />
						</div>
						</div>
							
			
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">备注</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_remark"  placeholder="">
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
			{sTitle:'媒体id',  mData: "pub_id",uxLongText:true},				
			{sTitle:'站点id',  mData: "site_id",uxLongText:true},				
			{sTitle:'pc转化率最低值',  mData: "pc_min_ctr",uxLongText:true},				
			{sTitle:'pc转化率最高值',  mData: "pc_max_ctr",uxLongText:true},	
			{sTitle:'移动转化率最低值',  mData: "mobile_min_ctr",uxLongText:true},				
			{sTitle:'移动转化率最高值',  mData: "mobile_max_ctr",uxLongText:true},				
			{sTitle:'创建时间',  mData: "createtime" , mRender: Common.formatDate},			
			{sTitle:'最后更新时间',  mData: "updatetime" , mRender: Common.formatDate},					
			{sTitle:'状态 有效 1,无效 0',  mData: "status",uxLongText:true},				
			{sTitle:'备注',  mData: "remark",uxLongText:true},	
			{sTitle:'设置配比',  mData: "site_id" , mRender:function(data, type, full){
				return '<a href="${ctx}/ssp/config/siteCpmCtrRule/edit1?siteid='+data+'" class="btn btn-xs prevent-double" modal-simple=false   data-handler="MODAL" modal-size="" data-title="设置配比"><i class="fa fa-info info" ></i> 设置配比</a>'
			}
			},
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
