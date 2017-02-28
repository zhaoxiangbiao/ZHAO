<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/adSource/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_ADSOURCE_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告来源" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_adSource_1" ></c:set>
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
								<label  class="col-sm-4 control-label no-padding-right">来源名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_source_name"  placeholder="">
								</div>
								</div>
							
	
						<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">状态</label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQI_status" cssStyle="width:57%" attrs="placeholder=''" cssClass="form-control  select2me"  enumName="t_ad_status" tagType="edit" />
								
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
	 aaSorting: [[3, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'来源id',  mData: "source_id",uxLongText:true},				
			{sTitle:'来源名称',  mData: "source_name",uxLongText:true},		
			{sTitle:'创建时间',  mData: "create_time" , mRender: Common.formatDate},
			{sTitle:'是否打底源 ',mData: "backup" ,mRender:function(data){
				return  '<span class="label label-'+((data==0)?'success':'warning')+'">'+ (data==1?"打底":"常规") +"</span>";
			}},
			{sTitle:'总次数(PV)',mData: "maxPV" },
			{sTitle:'次数(单UV)',mData: "maxPerUV" },
			{sTitle:'次数(单IP)',mData: "maxPerIP" },
			{sTitle:'时间间隔(UV) ',mData: "timeLimitUV" },
			{sTitle:'时间间隔(IP) ',mData: "timeLimitIP" },
			{sTitle:'目标平台类型',mData: "platform_type" ,uxEnum:'t_platform_type'},
			{sTitle:'计费类型',  mData: "cost_type",uxEnum:'t_cost_type',uxFastSet:false},		
			{sTitle:'广告源状态',mData: "status" ,uxEnum:'t_ad_status',uxFastSet:true},	
			
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
