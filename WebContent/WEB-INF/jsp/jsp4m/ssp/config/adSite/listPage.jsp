<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/adSite/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_ADSITE_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告站点" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_adSite_1" ></c:set>
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
								<label  class="col-sm-4 control-label no-padding-right">站点名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_site_name"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">站点联系方式</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_site_tel"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">站点描述</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_site_desc"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">站点域名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_site_domain"  placeholder="">
								</div>
								</div>
							
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">资源域名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_resource_domain"  placeholder="">
								</div>
								</div>
							
									
								<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">媒体</label>
									<div class="col-sm-8">
									<input placeholder=''  class="select2 " style="width:57%" name="filter_EQI_pub_id.id" type="hidden"  result-field="pub_name"   lookup-url="${ctx }/ssp/config/adPub/listJSON" filter="filter_LIKES_pub_name" />
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
	 aaSorting: [[8, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			//{sTitle:'站点ID',  mData: "site_id",uxLongText:true},				
			{sTitle:'站点名',  mData: "site_name",uxLongText:true},				
// 			{sTitle:'站点联系人',  mData: "site_linkman",uxLongText:true},	
// 			{sTitle:'站点联系方式',  mData: "site_tel",uxLongText:true},				
			{sTitle:'站点描述',  mData: "site_desc",uxLongText:true},				
// 			{sTitle:'站点域名',  mData: "site_domain",uxLongText:true},		
			{sTitle:'资源域名',  mData: "resource_domain",uxLongText:true},		
			{sTitle:'媒体',
			  mData: "pub_id" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a  href="${ctx}/ssp/config/adPub/view?id='+data.id+'"  data-handler="MODAL" data-title="媒体">'+data.pub_name+'<i class="ace-icon fa fa-external-link"></i></a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },
// 			{sTitle:'更新时间',  mData: "update_time" , mRender: Common.formatDate},					
			{sTitle:'站点状态',  mData: "status",uxEnum:'t_ad_status',uxFastSet:true},
			{sTitle:'PC白名单状态',  mData: "pc_blacklist_status",uxEnum:'t_ad_status',uxFastSet:true},
			{sTitle:'移动白名单状态',  mData: "mobile_blacklist_status",uxEnum:'t_ad_status',uxFastSet:true},
			{sTitle:'创建时间',  mData: "create_time" , mRender: Common.formatDate},	
			{sTitle:'设置配比',  mData: "site_id" , mRender:function(data, type, full){
				return '<a href="${ctx}/ssp/config/adDspPproportion/listPage?typeStr=2&targetIdStr='+data+'" class="btn btn-xs prevent-double" modal-simple=false   data-handler="MODAL" modal-size="" data-title="设置配比"><i class="fa fa-info info" ></i> 设置配比</a>'
			}
		},
		{sTitle:'设置CTR区间',  mData: "site_id" , mRender:function(data, type, full){
			return '<a href="${ctx}/ssp/config/siteCpmCtrRule/edit1?siteid='+data+'" class="btn btn-xs prevent-double" modal-simple=false   data-handler="MODAL" modal-size="" data-title="设置CTR区间"><i class="fa fa-info info" ></i> 设置CTR区间</a>'
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
