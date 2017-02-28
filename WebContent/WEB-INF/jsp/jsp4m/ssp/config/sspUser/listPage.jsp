<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/config/sspUser/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_CONFIG_SSPUSER_" ></c:set>
<c:set scope="page" var="dataTitle" value="ssp用户表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_config_sspUser_1" ></c:set>
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
								<label  class="col-sm-4 control-label no-padding-right">昵称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_name"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">账户名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_user_name"  placeholder="">
								</div>
								</div>
									
								<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">媒体</label>
									<div class="col-sm-8">
									<input placeholder=''  class="select2 " style="width: 57%" name="filter_EQI_pub_id.pub_id" type="hidden"  result-field="pub_name"  value-field="pub_id" lookup-url="${ctx }/ssp/config/adPub/listJSON" filter="filter_LIKES_pub_name" />
									</div>
								</div>
							
									
								<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">站点</label>
									<div class="col-sm-8">
									<input placeholder=''  class="select2 " style="width:57%" name="filter_EQI_site_id.site_id" type="hidden"  result-field="site_name" value-field="site_id"  lookup-url="${ctx }/ssp/config/adSite/listJSON" filter="filter_LIKES_site_name" />
									</div>
								</div>
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">账号所属</label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQI_user_level"  attrs="placeholder=''" cssStyle="width:57%" cssClass="form-control  select2me"  enumName="userLevel" tagType="edit" />
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
	 aaSorting: [[6, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:true,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [
			{sTitle:'账户名',  mData: "user_name",uxLongText:true},					
			{sTitle:'昵称',  mData: "name",uxLongText:true},				
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
				{sTitle:'站点',
				  mData: "site_id" ,
			 	  mRender:function(data){
			 		  if(data && data.id){
			 		  	  return '<a  href="${ctx}/ssp/config/adSite/view?id='+data.id+'"  data-handler="MODAL" data-title="站点">'+data.site_name+'<i class="ace-icon fa fa-external-link"></i></a>'
			 		  }else{
			 			  return data;
			 		  }
			 	  }
			    },	
			{sTitle:'账号所属',  mData: "user_level",uxEnum:'userLevel'},    
			{sTitle:'创建时间',  mData: "create_time" , mRender: Common.formatDate},
			{sTitle:'最后更新时间',  mData: "last_update_time" , mRender: Common.formatDate},
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
