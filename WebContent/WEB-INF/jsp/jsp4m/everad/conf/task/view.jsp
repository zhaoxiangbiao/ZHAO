<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="任务描述"  value="${task.task_des}" ></form:field>
			
			<form:field type="p" label="任务展示时长"  value="${task.show_time}" ></form:field>
		
			<form:field  label="模板"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/everad/conf/template/view?id=${task.template.id}"  data-handler="MODAL" data-title="信息">${task.template.name}</a>
			</form:field>
		
			<form:field  label="内容"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/everad/conf/content/view?id=${task.content.id}"  data-handler="MODAL" data-title="信息">${task.content.content_name}</a>
			</form:field>
			
			<form:field  label="任务是否生效"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_is_active" enumKey="${task.is_active}" />
			</form:field>
			
			<form:field  label="目标平台类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_target_platform" enumKey="${task.target_platform}" />
			</form:field>
			
		
			<form:field  label="推送优先级"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_task_priority" enumKey="${task.task_priority}" />
			</form:field>
			
		
			<form:field type="p" label="单任务号码段白名单"  value="${task.task_phonesegment}" ></form:field>
		
			<form:field type="p" label="单任务号码黑名单"  value="${task.task_blackphone}" ></form:field>
		
			<form:field type="p" label="单任务号码白名单"  value="${task.task_whitephone}" ></form:field>
		
			<form:field  label="域名白名单组"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/everad/conf/domainGruops/view?id=${task.task_domain_group.id}"  data-handler="MODAL" data-title="信息">${task.task_domain_group.name}</a>
			</form:field>
		
			<form:field  label="ua白名单组"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/everad/conf/uaGroups/view?id=${task.task_ua_group.id}"  data-handler="MODAL" data-title="信息">${task.task_ua_group.name}</a>
			</form:field>
		
			<form:field  label="app白名单组"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/everad/conf/appGroups/view?id=${task.task_app_group.id}"  data-handler="MODAL" data-title="信息">${task.task_app_group.name}</a>
			</form:field>
			
			<form:field  label="智能终端白名单组"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/everad/conf/terminalGroups/view?id=${task.task_terminal_group.id}"  data-handler="MODAL" data-title="信息">${task.task_terminal_group.name}</a>
			</form:field>
			
			<form:field  label="标签"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/everad/conf/labels/view?id=${task.label.id}"  data-handler="MODAL" data-title="信息">${task.label.label}</a>
			</form:field>
		
			<form:field type="p" label="小时段"  value="${task.task_hour}" ></form:field>
		
			<form:field type="p" label="星期"  value="${task.task_week}" ></form:field>
		
			<form:field type="p" label="任务推送总量"  value="${task.task_taskpushtotal}" ></form:field>
		
			<form:field type="p" label="用户推送间隔"  value="${task.task_interval}" ></form:field>
		
			<form:field type="p" label="每日推送总量"  value="${task.task_daypushtotal}" ></form:field>
		
			<form:field type="p" label="单用户推送总次数"  value="${task.task_userpushtotal}" ></form:field>
		
			<form:field type="p" label="用户单日推送总次数"  value="${task.task_userdaypushtotal}" ></form:field>
			
		</div>
	</form>
