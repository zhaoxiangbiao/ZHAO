<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_everad_conf_task_1" ></c:set>
	<form id="${formId }" method="post" action="${ctx}/everad/conf/task/save" class="form-horizontal bv-form" >
		<div class="form-body">
			<input type="hidden" name="id" value="${task.id}" />
			<input type="hidden" name="show_time" value="0" />
			<%-- <form:field name="task_des" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"' label="任务描述"  value="${task.task_des}" ></form:field>
			
			<form:field name="show_time" attrs="" label="任务展示时长"  value="${task.show_time}" >
				<span style="color: red">时间单位：秒 </span>
			</form:field> --%>
		<div class="col-lg-12 col-sm-12 col-xs-12">
                   <div class="widget">
                       <div class="widget-header bordered-top bordered-palegreen">
                           <span class="widget-caption">基础配置</span>
                       </div>
                       <div class="widget-body">
                       <div class="row">
                             <form:field totalWidth="6" name="task_des" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"' label="任务描述"  value="${task.task_des}" ></form:field>
	
							 <form:field  totalWidth="6"  label="状态"  useBody="true"  >
								<tag:enum defaultValue="1" cssClass="form-control form-control-inline input-medium select2me" name="is_active" attrs=""  enumName="t_ad_status" inputType="radio"   enumKey="${task.is_active}"/>
							</form:field>
                       </div>
								
						<div class="row">			
								<form:field  totalWidth="6"  label="模板"  useBody="true"  attrs="">
									<input class="form-control select2" name="template.id" type="hidden"   value="${task.template.id}" display-value="${task.template.name}" result-field="name"   lookup-url="${ctx}/everad/conf/template/listJSON" filter="filter_LIKES_name" />
								</form:field>
							
								<form:field  totalWidth="6"  label="内容"  useBody="true"  attrs="">
									<input class="form-control select2" name="content.id" type="hidden"   value="${task.content.id}" display-value="${task.content.content_name}" result-field="content_name"   lookup-url="${ctx}/everad/conf/content/listJSON" filter="filter_LIKES_content_name" />
								</form:field>
						</div>
						
						<div class="row">	
									<form:field totalWidth="6" label="目标平台类型"  useBody="true"  >
<%-- 										<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="target_platform" attrs=""  enumName="ea_target_platform" inputType="checkbox"   enumKey="${task.target_platform}"/> --%>
 										<div class="row">
                                                <div class="col-lg-4 col-sm-4 col-xs-4">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input  name="target_platform"  type="checkbox" <c:if test="${fn:contains(task.target_platform, '1') }">checked="checked"</c:if>  value="1">
                                                            <span class="text">PC</span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-sm-4 col-xs-4">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input  name="target_platform" type="checkbox" <c:if test="${fn:contains(task.target_platform, '2') }">checked="checked"</c:if> value="2">
                                                            <span class="text">手机</span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-sm-4 col-xs-4">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input name="target_platform"  type="checkbox" <c:if test="${fn:contains(task.target_platform, '3') }">checked="checked"</c:if> value="3">
                                                            <span class="text">平板</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

									</form:field>
									
									<form:field totalWidth="6"  label="推送优先级"  useBody="true"  >
										<tag:enum  defaultValue="1" cssClass="form-control form-control-inline input-medium select2me" name="task_priority" attrs=""  enumName="ea_task_priority" inputType="radio"   enumKey="${task.task_priority}"/>
									</form:field>
									
									</div>
                       </div>
                   </div>
            </div>       
            <div class="col-lg-12 col-sm-12 col-xs-12">
               <div class="widget">
                   <div class="widget-header bordered-top bordered-palegreen">
                       <span class="widget-caption">过滤配置</span>
                   </div>
                   <div class="widget-body">
                       <div class="collapse in">
                         <div class="row">
                        	<form:field type="textarea" totalWidth="6" rows="5" fwidth="7" id="task_phonesegment_import" name="task_phonesegment" attrs="" label="单任务号码段白名单"  value="${task.task_phonesegment}" >
					<a href="${ctx}/everad/conf/task/importView3" class="btn btn-sm blue "  data-handler="MODAL" data-title="导入" data-form=true>
							<i class="fa fa-download"></i> 导入
					</a>
				</form:field>
				<form:field type="textarea" totalWidth="6" rows="5" fwidth="7" id="task_blackphone_import" name="task_blackphone" attrs="" label="单任务号码黑名单"  value="${task.task_blackphone}" >
					<a href="${ctx}/everad/conf/task/importView2" class="btn btn-sm blue "  data-handler="MODAL" data-title="导入" data-form=true>
							<i class="fa fa-download"></i> 导入
					</a>
				</form:field>
			</div>
			 <div class="row">
				<form:field type="textarea" totalWidth="6" rows="5" fwidth="7" id="task_whitephone_import" name="task_whitephone" attrs="" label="单任务号码白名单"  value="${task.task_whitephone}" >
	 				<a href="${ctx}/everad/conf/task/importView1" class="btn btn-sm blue "  data-handler="MODAL" data-title="导入" data-form=true>
							<i class="fa fa-download"></i> 导入
					</a>
				</form:field>
			
				<form:field  label="域名白名单组" totalWidth="6" useBody="true"  attrs="">
					<input class="form-control select2" name="task_domain_group.id" type="hidden"   value="${task.task_domain_group.id}" display-value="${task.task_domain_group.name}" result-field="name"   lookup-url="${ctx}/everad/conf/domainGruops/listJSON" filter="filter_LIKES_name" />
				</form:field>
			</div>
			 <div class="row">
				<form:field  label="ua白名单组" totalWidth="6" useBody="true"  attrs="">
					<input class="form-control select2" name="task_ua_group.id" type="hidden"   value="${task.task_ua_group.id}" display-value="${task.task_ua_group.name}" result-field="name"   lookup-url="${ctx}/everad/conf/uaGroups/listJSON" filter="filter_LIKES_name" />
				</form:field>
			
				<form:field  label="app白名单组" totalWidth="6" useBody="true"  attrs="">
					<input class="form-control select2" name="task_app_group.id" type="hidden"   value="${task.task_app_group.id}" display-value="${task.task_app_group.name}" result-field="name"   lookup-url="${ctx}/everad/conf/appGroups/listJSON" filter="filter_LIKES_name" />
				</form:field>
			</div>
			 <div class="row">	
				<form:field  label="智能终端白名单组" totalWidth="6" useBody="true"  attrs="">
					<input class="form-control select2" name="task_terminal_group.id" type="hidden"   value="${task.task_terminal_group.id}" display-value="${task.task_terminal_group.name}" result-field="name"   lookup-url="${ctx}/everad/conf/terminalGroups/listJSON" filter="filter_LIKES_name" />
				</form:field>  
				 <form:field name="label_text" totalWidth="6" label="标签"  value="${task.label_text}" ></form:field>    
			</div>	 
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-lg-12 col-sm-12 col-xs-12">
               <div class="widget">
                   <div class="widget-header bordered-top bordered-palegreen">
                       <span class="widget-caption">小时段星期配置</span>
                   </div>
                   <div class="widget-body">
                       <div class="collapse in">
	                         <div class="row">
	                        	<form:field name=""  totalWidth="6" attrs="" label="小时段" useBody="true" >
									<c:set var="hours" scope="page" value=",${task.task_hour }," />										
									 <div class="col-lg-4 col-sm-4 col-xs-4">
                                            <div class="checkbox">
                                                <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",0,")}'>checked="checked"</c:if>  value="0">
                                                    <span class="text">0点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",1,")}'>checked="checked"</c:if>  value="1">
                                                    <span class="text">1点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",2,")}'>checked="checked"</c:if>  value="2">
                                                    <span class="text">2点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",3,")}'>checked="checked"</c:if>  value="3">
                                                    <span class="text">3点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",4,")}'>checked="checked"</c:if>  value="4">
                                                    <span class="text">4点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",5,")}'>checked="checked"</c:if>  value="5">
                                                    <span class="text">5点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",6,")}'>checked="checked"</c:if>  value="6">
                                                    <span class="text">6点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",7,")}'>checked="checked"</c:if>  value="7">
                                                    <span class="text">7点</span>
                                                </label>
                                                 
                                            </div>
                                       </div>
                                       <div class="col-lg-4 col-sm-4 col-xs-4">
                                            <div class="checkbox">
                                                <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",8,")}'>checked="checked"</c:if>  value="8">
                                                    <span class="text">8点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",9,")}'>checked="checked"</c:if>  value="9">
                                                    <span class="text">9点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",10,")}'>checked="checked"</c:if>  value="10">
                                                    <span class="text">10点</span>
                                                </label>
                                                  <label>
                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",11,")}'>checked="checked"</c:if>  value="11">
                                                    <span class="text">11点</span>
                                                </label>
                                                 <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",12,")}'>checked="checked"</c:if>  value="12">
	                                                    <span class="text">12点</span>
	                                                </label>
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",13,")}'>checked="checked"</c:if>  value="13">
	                                                    <span class="text">13点</span>
	                                                </label>
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",14,")}'>checked="checked"</c:if>  value="14">
	                                                    <span class="text">14点</span>
	                                                </label>
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",15,")}'>checked="checked"</c:if>  value="15">
	                                                    <span class="text">15点</span>
	                                                </label>
                                                </label>
                                            </div>
                                       </div>
										  <div class="col-lg-4 col-sm-4 col-xs-4">
	                                            <div class="checkbox">
	                                                
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",16,")}'>checked="checked"</c:if>  value="16">
	                                                    <span class="text">16点</span>
	                                                </label>
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",17,")}'>checked="checked"</c:if>  value="17">
	                                                    <span class="text">17点</span>
	                                                </label>
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",18,")}'>checked="checked"</c:if>  value="18">
	                                                    <span class="text">18点</span>
	                                                </label>
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",19,")}'>checked="checked"</c:if>  value="19">
	                                                    <span class="text">19点</span>
	                                                </label>
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",20,")}'>checked="checked"</c:if>  value="20">
	                                                    <span class="text">20点</span>
	                                                </label>
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",21,")}'>checked="checked"</c:if>  value="21">
	                                                    <span class="text">21点</span>
	                                                </label>
	                                                  <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",22,")}'>checked="checked"</c:if>  value="22">
	                                                    <span class="text">22点</span>
	                                                </label>
	                                                 <label>
	                                                    <input name="task_hour"  type="checkbox" <c:if test='${fn:contains(hours, ",23,")}'>checked="checked"</c:if>  value="23">
	                                                    <span class="text">23点</span>
	                                                </label>
	                                            </div>
	                                       </div>
								</form:field>
							
									<%-- <form:field name="task_week" attrs="" label="星期"  value="${task.task_week}" ></form:field> --%>
								<form:field name=""  totalWidth="6" attrs="" label="星期"  useBody="true" >
									 <div class="col-lg-4 col-sm-4 col-xs-4">
                                         <div class="checkbox">
                                             <label>
                                                 <input  name="task_week"  type="checkbox" <c:if test='${fn:contains(task.task_week, "1")}'>checked="checked"</c:if>  value="1">
                                                 <span class="text">星期一</span>
                                             </label>
                                             <label>
                                                 <input  name="task_week"  type="checkbox" <c:if test='${fn:contains(task.task_week, "2")}'>checked="checked"</c:if>  value="2">
                                                 <span class="text">星期二</span>
                                             </label>
                                             <label>
                                                 <input  name="task_week"  type="checkbox" <c:if test='${fn:contains(task.task_week, "3")}'>checked="checked"</c:if>  value="3">
                                                 <span class="text">星期三</span>
                                             </label>
                                             <label>
                                                 <input  name="task_week"  type="checkbox" <c:if test='${fn:contains(task.task_week, "4")}'>checked="checked"</c:if>  value="4">
                                                 <span class="text">星期四</span>
                                             </label>
                                             <label>
                                                 <input  name="task_week"  type="checkbox" <c:if test='${fn:contains(task.task_week, "5")}'>checked="checked"</c:if>  value="5">
                                                 <span class="text">星期五</span>
                                             </label>
                                             <label>
                                                 <input  name="task_week"  type="checkbox" <c:if test='${fn:contains(task.task_week, "6")}'>checked="checked"</c:if>  value="6">
                                                 <span class="text">星期六</span>
                                             </label>
                                             <label>
                                                 <input  name="task_week"  type="checkbox" <c:if test='${fn:contains(task.task_week, "7")}'>checked="checked"</c:if>  value="7">
                                                 <span class="text">星期日</span>
                                             </label>
                                         </div>
                                     </div>
								</form:field>
							</div>
                       </div>
                   </div>
               </div>
           </div>     
			<div class="col-lg-12 col-sm-12 col-xs-12">
               <div class="widget">
                   <div class="widget-header bordered-top bordered-palegreen">
                       <span class="widget-caption">频次配置</span>
                   </div>
                   <div class="widget-body">
                       <div class="collapse in">
							<div class="row">
								<form:field name="task_taskpushtotal" totalWidth="6" attrs="" label="任务推送总量"  value="${task.task_taskpushtotal}" ></form:field>
			
								<form:field name="task_interval" totalWidth="6" attrs="" label="用户推送间隔"  value="${task.task_interval}" >
									<span style="color: red">时间单位：秒 </span>
								</form:field>
							</div>
							<div class="row">
								<form:field name="task_daypushtotal" attrs="" totalWidth="6" label="每日推送总量"  value="${task.task_daypushtotal}" ></form:field>
							
								<form:field name="task_userpushtotal" attrs="" totalWidth="6" label="单用户推送总次数"  value="${task.task_userpushtotal}" ></form:field>
							</div>
							<div class="row">
								<form:field name="task_userdaypushtotal" attrs="" totalWidth="6" label="用户单日推送总次数"  value="${task.task_userdaypushtotal}" ></form:field>
							</div>
                       </div>
                   </div>
               </div>
           </div>
		</div>
	<div class="  form-group ">
		<div class="pull-right form-btn">
			<button class="btn btn-warning" type="reset"><i class="ace-icon fa fa-undo bigger-110"></i> 重置	</button>
			<button type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>确认</button>
		</div>
	</div>
	</form>
		
<script type="text/javascript">
function setSelectAll(){
    $("#cbAll").click(function(){
           $("input[name='task_hour']").prop("checked",$(this).prop("checked"));
    });
   
}
function setSelectWeekAll(){
    $("#cbWeekAll").click(function(){
           $("input[name='task_week']").prop("checked",$(this).prop("checked"));
    });
   
}
function setSelectUp(){
       $("input[name='task_hour']").each(function(){
       	var idsstr = $(this).val()
       	if(idsstr < 12){
    		if($(this).prop("checked")){
    		   $(this).prop("checked", false);  
    		}else{
    		   $(this).prop("checked", true);  
    		}
    	}
       }); 
}
function setSelectWeekUp(){
    $("input[name='task_week']").each(function(){ 
    	var idsstr = $(this).val()
    	if(idsstr < 6){
 		if($(this).prop("checked")){
 		   $(this).prop("checked", false);  
 		}else{
 		   $(this).prop("checked", true);  
 		}
 	}
    }); 
}
function setSelectDown(){
    $("input[name='task_hour']").each(function(){
    	var idsstr = $(this).val()
    	if(idsstr >= 12){
    		if($(this).prop("checked")){
    		   $(this).prop("checked", false);  
    		}else{
    		   $(this).prop("checked", true);  
    		}
    	}
    }); 
}
function setSelectWeekDown(){
    $("input[name='task_week']").each(function(){
    	var idsstr = $(this).val()
    	if(idsstr >= 6){ 
    		if($(this).prop("checked")){
    		   $(this).prop("checked", false);  
    		}else{
    		   $(this).prop("checked", true);  
    		}
    	}
    }); 
}
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>