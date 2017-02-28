<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/everad/conf/content/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_EVERAD_CONF_CONTENT_" ></c:set>
<c:set scope="page" var="dataTitle" value="推送内容" ></c:set>
<c:set scope="page" var="tableId" value="data_table_everad_conf_content_1" ></c:set>
<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="data-div">
					<div class="widget " style="margin-bottom:5px;">
			<div class="widget-header ">
                  <div class="widget-buttons">
                        
                        <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="广告来源" data-form="true">查询</button>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-chevron-down"></i>
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
								<label  class="col-sm-4 control-label no-padding-right">内容名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_content_name"  placeholder="">
								</div>
								</div>
							
								<%-- 	
								<div class="form-group ">
									<label  class="col-sm-4 control-label no-padding-right">标签</label>
									<div class="col-sm-8">
									<input placeholder=''  class="form-control select2 " name="filter_EQI_label.id" type="hidden"  result-field="label"   lookup-url="${ctx }/everad/conf/labels/listJSON" filter="filter_LIKES_label" />
									</div>
								</div> --%>
							
	
								<%-- <div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">内容类型</label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQI_content_type"  attrs="placeholder=''" cssClass="form-control  select2me"  enumName="ea_content_type" tagType="edit" />
								
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">形式</label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQI_content_shape"  attrs="placeholder=''" cssClass="form-control  select2me"  enumName="ea_content_shape" tagType="edit" />
								
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">尺寸</label>
								<div class="col-sm-8">
									<tag:enum name="filter_EQS_content_size"  attrs="placeholder=''" cssClass="form-control  select2me"  enumName="ea_size" tagType="edit" />
								
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">资源地址</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_content_sourceurl"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">跳转地址</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_content_jumpurl"  placeholder="">
								</div>
								</div>
								
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">资源地址2</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_content_sourceurl2"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">跳转地址2</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_content_jumpurl2"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">文字标题</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_content_texttitel"  placeholder="">
								</div>
								</div>
							
	
								<div class="form-group ">
								<label  class="col-sm-4 control-label no-padding-right">文字内容</label>
								<div class="col-sm-8">
									<input type="text" class="form-control  " name="filter_LIKES_content_textcontent"  placeholder="">
								</div>
								</div> --%>
							
	 					
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
			//{sTitle:'内容名称',  mData: "content_name",uxLongText:true},		
			{sTitle:'名称',  mData: "content_name",uxLongText:true},/* mRender : function(data,type,full){
				if(  full.content_size){
	    			var result = [];
	    			var size = full.content_size
	    			var w = size.split('*')[0];
	    			var h = size.split('*')[1];
	    			var name = 
	    			result.push('<a href="javascript:void(0);" class="btn btn-info btn-xs" data-container="body" data-titleclass="bordered-info" data-class="dark" data-toggle="popover-hover"  data-placement="right" data-title="预览" data-content="');
	    			if(full.content_type==1){
		    			result.push('<img width=\''+w+'\' height=\''+h+'\' src=\'${dsp_resource_server_url_pre }'+full.content_sourceurl+'\' />');
		    			if(full.content_shape==2){
		    				result.push(' <img style=\'margin-left:100px;\' width=\''+w+'\' height=\''+h+'\' src=\'${dsp_resource_server_url_pre }'+full.content_sourceurl2+'\' />');
		    			}
	    			}else if(full.content_type==2){
	    				result.push('<iframe style=\'border:0px;\' width=\''+w+'\' height=\''+h+'\' src=\''+full.content_sourceurl+'\' />');
		    			if(full.content_shape==2){
		    				result.push(' <iframe style=\'border:0px;margin-left:100px;\' width=\''+w+'\' height=\''+h+'\' src=\''+full.content_sourceurl2+'\' />');
		    			}
	    			}
	    			result.push(' " data-original-title="" title="">'+data+'</a>');
	    			return result.join('');
					
				}else{
					return data;
				}
    		}}, */
			/* {sTitle:'标签',
			  mData: "label" ,
		 	  mRender:function(data){
		 		  if(data && data.id){
		 		  	  return '<a  href="${ctx}/everad/conf/labels/view?id='+data.id+'"  data-handler="MODAL" data-title="标签">'+data.label+'<i class="ace-icon fa fa-external-link"></i></a>'
		 		  }else{
		 			  return data;
		 		  }
		 	  }
		    }, */
			{sTitle:'内容类型',mData: "content_type" ,uxEnum:'ea_content_type'},
			{sTitle:'形式',mData: "content_shape" ,uxEnum:'ea_content_shape'},
			{sTitle:'尺寸',mData: "content_size" ,uxEnum:'ea_size'},		
			/* {sTitle:'资源地址',  mData: "content_sourceurl",uxLongText:true},				
			{sTitle:'跳转地址',  mData: "content_jumpurl",uxLongText:true},	
			{sTitle:'资源地址2',  mData: "content_sourceurl2",uxLongText:true},				
			{sTitle:'跳转地址2',  mData: "content_jumpurl2",uxLongText:true},	 */
			/* {sTitle:'文字标题',  mData: "content_texttitel",uxLongText:true},				
			{sTitle:'文字内容',  mData: "content_textcontent",uxLongText:true},	 */	        
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
