<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/adPub/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_ADPUB_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告媒体" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_adPub_1" ></c:set>
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
								<label  class="col-sm-4 control-label no-padding-right">媒体名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_pub_name"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">媒体联系方式</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_pub_tel"  placeholder="">
								</div>
								</div>
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">公司名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_company_name"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">银行账号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_bank_account"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">开户行</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_opening_bank"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">收款人</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_payee"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">邮箱</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_email"  placeholder="">
								</div>
								</div>
							
									
								<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">移动原始广告位ID</label>
									<div class="col-sm-8">
									<input placeholder=''  class="select2" style="width:57%" name="filter_EQI_source_slot_id_mobile.source_slot_id" type="hidden"  result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx }/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_name" />
									</div>
								</div>
							
									
								<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">PC原始广告位ID</label>
									<div class="col-sm-8">
									<input placeholder=''  class="select2" style="width: 57%" name="filter_EQI_source_slot_id_pc.source_slot_id" type="hidden"  result-field="source_slot_name" value-field="source_slot_id"  lookup-url="${ctx }/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_name" />
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
	 aaSorting: [[4, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [		
			{sTitle:'媒体id',  mData: "pub_id",uxLongText:true},				
			{sTitle:'媒体名称',  mData: "pub_name",uxLongText:true},				
// 			{sTitle:'媒体联系方式',  mData: "pub_tel",uxLongText:true},				
// 			{sTitle:'媒体联系人',  mData: "pub_linkman",uxLongText:true},				
			{sTitle:'媒体描述',  mData: "pub_desc",uxLongText:true},						
			{sTitle:'创建时间',  mData: "create_time" , mRender: Common.formatDate},			
// 			{sTitle:'更新时间',  mData: "update_time" , mRender: Common.formatDate},					
// 			{sTitle:'公司名称',  mData: "company_name",uxLongText:true},				
// 			{sTitle:'银行账号',  mData: "bank_account",uxLongText:true},				
// 			{sTitle:'开户行',  mData: "opening_bank",uxLongText:true},				
// 			{sTitle:'收款人',  mData: "payee",uxLongText:true},	
// 			{sTitle:'收款人联系方式',  mData: "payee_tel",uxLongText:true},
// 			{sTitle:'邮箱',  mData: "email",uxLongText:true},		
// 			{sTitle:'移动原始广告位ID',
// 			  mData: "source_slot_id_mobile" ,
// 		 	  mRender:function(data){
// 		 		  if(data && data.id){
// 		 		  	  return '<a  href="${ctx}/ssp/config/adSourceSlot/view?id='+data.id+'"  data-handler="MODAL" data-title="移动原始广告位ID">'+data.source_slot_name+'<i class="ace-icon fa fa-external-link"></i></a>'
// 		 		  }else{
// 		 			  return data;
// 		 		  }
// 		 	  }
// 		    },
// 			{sTitle:'PC原始广告位ID',
// 			  mData: "source_slot_id_pc" ,
// 		 	  mRender:function(data){
// 		 		  if(data && data.id){
// 		 		  	  return '<a  href="${ctx}/ssp/config/adSourceSlot/view?id='+data.id+'"  data-handler="MODAL" data-title="PC原始广告位ID">'+data.source_slot_name+'<i class="ace-icon fa fa-external-link"></i></a>'
// 		 		  }else{
// 		 			  return data;
// 		 		  }
// 		 	  }
// 		    },   
		    {sTitle:'媒体状态',  mData: "pub_status",uxEnum:'t_ad_status',uxFastSet:true},
		    {sTitle:'设置配比',  mData: "pub_id" , mRender:function(data, type, full){
				return '<a href="/ssp/config/adDspPproportion/listPage?typeStr=1&targetIdStr='+data+'" class="btn btn-xs prevent-double" modal-simple=false   data-handler="MODAL" modal-size="" data-title="设置配比"><i class="fa fa-info info" ></i> 设置配比</a>'
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
