<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adSourceData/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADSOURCEDATA_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告源数据" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adSourceData_1" ></c:set>
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
									<label  class="col-sm-4 control-label no-padding-right">来源</label>
									<div class="col-sm-8">
									<input placeholder=''  class=" select2 " name="filter_EQI_source_id.id" type="hidden"  result-field="source_name"   lookup-url="${ctx }/ssp/config/adSource/listJSON" filter="filter_LIKES_source_name" />
									</div>
								</div>
							
									
								<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">原始广告位ID</label>
									<div class="col-sm-8">
									<input placeholder=''  class=" select2 " name="filter_EQI_source_slot_id.id" type="hidden"  result-field="source_slot_number"   lookup-url="${ctx }/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_number" />
									</div>
								</div>
							
	
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">统计日期</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="datetime_count_time"  type="text" />
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
			{sTitle:'来源ID',
			  mData: "source_id" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a  href="${ctx}/ssp/config/adSource/view?id='+data.id+'"  data-handler="MODAL" data-title="来源ID">'+data.source_name+'<i class="ace-icon fa fa-external-link"></i></a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },
			{sTitle:'原始广告位ID',
			  mData: "source_slot_id" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a  href="${ctx}/ssp/config/adSourceSlot/view?id='+data.id+'"  data-handler="MODAL" data-title="原始广告位ID">'+data.source_slot_number+'<i class="ace-icon fa fa-external-link"></i></a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    },
			{sTitle:'统计日期',  mData: "statdate" , mRender: Common.formatDate},					
			{sTitle:'广告源PV',  mData: "pv",uxLongText:true},				
			{sTitle:'广告源点击量',  mData: "click",uxLongText:true},				
			{sTitle:'广告源收入',  mData: "income",uxLongText:true},		        
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

$('.date-range-picker').datepicker();
</script>
