<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/everad/conf/task/"></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_EVERAD_CONF_TASK_"></c:set>
<c:set scope="page" var="dataTitle" value="推送任务"></c:set>
<c:set scope="page" var="tableId" value="data_table_everad_conf_task_1"></c:set>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN SAMPLE TABLE PORTLET-->
		<div class="data-div">
			<div class="widget  " style="margin-bottom: 5px;">
				<div class="widget-header ">
					<span class="widget-caption"></span>
					<div class="widget-buttons">

						<button href="javascript:;" class="btn btn-blue btn-xs search"
							data-title="广告来源" data-form="true">查询</button>
						<a href="#" data-toggle="collapse"> <i class="fa fa-chevron-down"></i>
						</a>
					</div>
					<div class="widget-buttons buttons-bordered">

						<sec:authorize ifAllGranted="${rolePrev }NEW">
							<button href="${urlPrev }new" class="btn btn-palegreen btn-xs "
								data-handler="INLINE" data-title="${dataTitle }" data-form=true>
								新增</button>
						</sec:authorize>
						<sec:authorize ifAllGranted="${rolePrev }DELETE">
							<button href="${urlPrev }delete"
								class="btn btn-xs btn-darkorange " data-handler="CONFIRM"
								data-set="#${tableId } .checkboxes">删除</button>
						</sec:authorize>
						<button href="${urlPrev }batchStop"
							class="btn btn-xs btn-darkorange " data-handler="CONFIRM"
							data-set="#${tableId } .checkboxes">停用</button>
						<button href="${urlPrev }batchStart"
							class="btn btn-blue btn-xs search " data-handler="CONFIRM"
							data-set="#${tableId } .checkboxes">启用</button>
<%-- 						<button href="${urlPrev }allStop" --%>
<!-- 							class="btn btn-xs btn-darkorange" data-handler="CONFIRM" -->
<!-- 							data-callback="void(0);">全部停用</button> -->
<%-- 						<button href="${urlPrev }allStart" --%>
<!-- 							class="btn btn-blue btn-xs search " data-handler="CONFIRM" -->
<!-- 							data-callback="void(0);">全部启用</button> -->
<%-- 						<button href="${urlPrev }sync" class="btn btn-xs btn-darkorange " --%>
<!-- 							data-callback="void(0);" data-handler="CONFIRM">同步</button> -->
					</div>
				</div>
				<div class="widget-body">

					<form class="form-inline" role="form" onsubmit="return false;"
						id="form_${tableId}">

						<div class="form-group ">
							<label class="col-sm-4 control-label no-padding-right">任务ID</label>
							<div class="col-sm-8">
								<input type="text" class="form-control  " name="filter_LIKES_id"
									placeholder="">
							</div>
						</div>

						<div class="form-group ">
							<label class="col-sm-4 control-label no-padding-right">任务描述</label>
							<div class="col-sm-8">
								<input type="text" class="form-control  "
									name="filter_LIKES_task_des" placeholder="">
							</div>
						</div>

<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">任务展示时长</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input type="text" class="form-control  " -->
<!-- 									name="filter_LIKES_show_time" placeholder=""> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">模板</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input placeholder='' class="form-control select2 " -->
<!-- 									name="filter_EQI_template.id" type="hidden" result-field="name" -->
<%-- 									lookup-url="${ctx }/everad/conf/template/listJSON" --%>
<!-- 									filter="filter_LIKES_name" /> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">内容</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input placeholder='' class="form-control select2 " -->
<!-- 									name="filter_EQI_content.id" type="hidden" -->
<!-- 									result-field="content_name" -->
<%-- 									lookup-url="${ctx }/everad/conf/content/listJSON" --%>
<!-- 									filter="filter_LIKES_content_name" /> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">任务是否生效</label> -->
<!-- 							<div class="col-sm-8"> -->
<%-- 								<tag:enum name="filter_EQI_is_active" attrs="placeholder=''" --%>
<%-- 									cssClass="form-control  select2me" enumName="ea_is_active" --%>
<%-- 									tagType="edit" /> --%>

<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">目标平台类型</label> -->
<!-- 							<div class="col-sm-8"> -->
<%-- 								<tag:enum name="filter_EQI_target_platform" --%>
<%-- 									attrs="placeholder=''" cssClass="form-control  select2me" --%>
<%-- 									enumName="ea_target_platform" tagType="edit" /> --%>

<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">推送优先级</label> -->
<!-- 							<div class="col-sm-8"> -->
<%-- 								<tag:enum name="filter_EQI_task_priority" attrs="placeholder=''" --%>
<%-- 									cssClass="form-control  select2me" enumName="ea_task_priority" --%>
<%-- 									tagType="edit" /> --%>

<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">单任务号码段白名单</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input type="text" class="form-control  " -->
<!-- 									name="filter_LIKES_task_phonesegment" id="task_phonesegment" -->
<!-- 									placeholder=""> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">单任务号码黑名单</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input type="text" class="form-control  " -->
<!-- 									name="filter_LIKES_task_blackphone" placeholder=""> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">单任务号码白名单</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input type="text" class="form-control  " -->
<!-- 									name="filter_LIKES_task_whitephone" -->
<!-- 									style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;" -->
<!-- 									placeholder=""> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">域名白名单组</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input placeholder='' class="form-control select2 " -->
<!-- 									name="filter_EQI_task_domain_group.id" type="hidden" -->
<!-- 									result-field="name" -->
<%-- 									lookup-url="${ctx }/everad/conf/domainGruops/listJSON" --%>
<!-- 									filter="filter_LIKES_name" /> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">ua白名单组</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input placeholder='' class="form-control select2 " -->
<!-- 									name="filter_EQI_task_ua_group.id" type="hidden" -->
<!-- 									result-field="name" -->
<%-- 									lookup-url="${ctx }/everad/conf/uaGroups/listJSON" --%>
<!-- 									filter="filter_LIKES_name" /> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">app白名单组</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input placeholder='' class="form-control select2 " -->
<!-- 									name="filter_EQI_task_app_group.id" type="hidden" -->
<!-- 									result-field="name" -->
<%-- 									lookup-url="${ctx }/everad/conf/appGroups/listJSON" --%>
<!-- 									filter="filter_LIKES_name" /> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">智能终端白名单组</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input placeholder='' class="form-control select2 " -->
<!-- 									name="filter_EQI_task_terminal_group.id" type="hidden" -->
<!-- 									result-field="name" -->
<%-- 									lookup-url="${ctx }/everad/conf/terminalGroups/listJSON" --%>
<!-- 									filter="filter_LIKES_name" /> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">标签</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input placeholder='' class="form-control select2 " -->
<!-- 									name="filter_EQI_label.id" type="hidden" result-field="label" -->
<%-- 									lookup-url="${ctx }/everad/conf/labels/listJSON" --%>
<!-- 									filter="filter_LIKES_label" /> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">小时段</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input type="text" class="form-control  " -->
<!-- 									name="filter_LIKES_task_hour" placeholder=""> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="form-group "> -->
<!-- 							<label class="col-sm-4 control-label no-padding-right">星期</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input type="text" class="form-control  " -->
<!-- 									name="filter_LIKES_task_week" placeholder=""> -->
<!-- 							</div> -->
<!-- 						</div> -->







					</form>
				</div>
			</div>


			<div class="widget no-header ">

				<div class="widget-body">
					<table class="table table-condensed table-bordered table-hover "
						id="${tableId }">
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
	/* window.onload = function(){
	 var text = document.getElementById('task_phonesegment'),
	 str = text.innerHTML,
	 textLeng = 20;
	 if(str.length > textLeng ){
	 text .innerHTML = str.substring(0,textLeng )+"... ...";
	 }  */
	$(document)
			.ready(
					function() {
						//look-up 查询条件 会员 
						Select2Ex.handleForm4select2({
							target : $("#form_${tableId }")
						});

						TableAjax
								.init(
										'${tableId}',
										{
											sAjaxSource : "${urlPrev }listJSON",
											aaSorting : [ [ 1, "desc" ] ], // 需要自定义
											uxUrlPrev : "${urlPrev }",
											uxDataTitle : "${dataTitle }",
											uxCheckable : true,
											uxCloseScroll : true,
											uxDrapable : false,
											aoColumns : [
													{
														sTitle : '任务ID',
														mData : "id",
														uxLongText : true
													},
													{
														sTitle : '任务描述',
														mData : "task_des",
														uxLongText : true
													},
													{
														sTitle : '状态',
														mData : "is_active",
														uxEnum : 't_ad_status',
														uxFastSet : false
													},
													{
														sTitle : '模板',
														mData : "template",
														mRender : function(data) {
															if (data && data.id) {
																return '<a  href="${ctx}/everad/conf/template/view?id='
																		+ data.id
																		+ '"  data-handler="MODAL" data-title="模板">'
																		+ data.name
																		+ '<i class="ace-icon fa fa-external-link"></i></a>'
															} else {
																return data;
															}
														}
													},
													{
														sTitle : '内容',
														mData : "content",
														mRender : function(data) {
															if (data && data.id) {
																return '<a  href="${ctx}/everad/conf/content/view?id='
																		+ data.id
																		+ '"  data-handler="MODAL" data-title="内容">'
																		+ data.content_name
																		+ '<i class="ace-icon fa fa-external-link"></i></a>'
															} else {
																return data;
															}
														}
													},
													{
														sTitle : '目标平台类型',
														mData : "target_platform",
														uxEnum : 'ea_target_platform'
														//uxLongText : true
													},
													{
														sTitle : '推送优先级',
														mData : "task_priority",
														uxEnum : 'ea_task_priority'
													},
													//{sTitle:'单任务号码段白名单',  mData: "task_phonesegment",uxLongText:true},				
													//{sTitle:'单任务号码黑名单',  mData: "task_blackphone",uxLongText:true},				
													//{sTitle:'单任务号码白名单',  mData: "task_whitephone",uxLongText:true},		
// 													{
// 														sTitle : '域名白名单组',
// 														mData : "task_domain_group",
// 														mRender : function(data) {
// 															if (data && data.id) {
// 																return '<a  href="${ctx}/everad/conf/domainGruops/view?id='
// 																		+ data.id
// 																		+ '"  data-handler="MODAL" data-title="域名白名单组">'
// 																		+ data.name
// 																		+ '<i class="ace-icon fa fa-external-link"></i></a>'
// 															} else {
// 																return data;
// 															}
// 														}
// 													},
// 													{
// 														sTitle : 'ua白名单组',
// 														mData : "task_ua_group",
// 														mRender : function(data) {
// 															if (data && data.id) {
// 																return '<a  href="${ctx}/everad/conf/uaGroups/view?id='
// 																		+ data.id
// 																		+ '"  data-handler="MODAL" data-title="ua白名单组">'
// 																		+ data.name
// 																		+ '<i class="ace-icon fa fa-external-link"></i></a>'
// 															} else {
// 																return data;
// 															}
// 														}
// 													},
// 													{
// 														sTitle : 'app白名单组',
// 														mData : "task_app_group",
// 														mRender : function(data) {
// 															if (data && data.id) {
// 																return '<a  href="${ctx}/everad/conf/appGroups/view?id='
// 																		+ data.id
// 																		+ '"  data-handler="MODAL" data-title="app白名单组">'
// 																		+ data.name
// 																		+ '<i class="ace-icon fa fa-external-link"></i></a>'
// 															} else {
// 																return data;
// 															}
// 														}
// 													},
// 													{
// 														sTitle : '智能白名单组',
// 														mData : "task_terminal_group",
// 														mRender : function(data) {
// 															if (data && data.id) {
// 																return '<a  href="${ctx}/everad/conf/terminalGroups/view?id='
// 																		+ data.id
// 																		+ '"  data-handler="MODAL" data-title="智能终端白名单组">'
// 																		+ data.name
// 																		+ '<i class="ace-icon fa fa-external-link"></i></a>'
// 															} else {
// 																return data;
// 															}
// 														}
// 													},
													/* {
														sTitle : '任务标签',
														mData : "label",
														mRender : function(data) {
															if (data && data.id) {
																return '<a  href="${ctx}/everad/conf/labels/view?id='
																		+ data.id
																		+ '"  data-handler="MODAL" data-title="标签">'
																		+ data.label
																		+ '<i class="ace-icon fa fa-external-link"></i></a>'
															} else {
																return data;
															}
														}
													}, */
													
// 													{sTitle:'任务标签',  mData: "label_text",uxLongText:true},
// 													/* {sTitle:'星期',  mData: "task_week",uxLongText:true}, */
// 													{
// 														sTitle : '任务推送总量',
// 														mData : "task_taskpushtotal",
// 														uxLongText : true
// 													},
// 													{
// 														sTitle : '用户推送间隔',
// 														mData : "task_interval",
// 														uxLongText : true
// 													},
// 													{
// 														sTitle : '每日推送总量',
// 														mData : "task_daypushtotal",
// 														uxLongText : true
// 													},
// 													{
// 														sTitle : '单用户推送总次数',
// 														mData : "task_userpushtotal",
// 														uxLongText : true
// 													},
// 													{
// 														sTitle : '用户单日推送总次数',
// 														mData : "task_userdaypushtotal",
// 														uxLongText : true
// 													},
													{
														uxCogs : [
																{
																	name : "预览",
																	uri : '/pages/preview.jsp',
																	target : '_blank',
																	iclass : 'fa fa-info primary',
																	dataForm : false
																},
																{
																	name : "修改"
																},
																{
																	name : "删除"
																},
																{
																	name : "统计",
																	sTitle:"任务统计",
																	mData : "id",
																	uri : '../task/totalQuery',
																	dataHandler : 'MODAL',
																	iclass : 'fa fa-info primary',
																	dataForm : false
																}

														]
													} ]

										});
					});
</script>
