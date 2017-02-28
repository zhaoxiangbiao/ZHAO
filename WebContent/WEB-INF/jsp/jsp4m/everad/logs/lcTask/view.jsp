<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="任务"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/conf/task/view?id=${lcTask.task.id}"  data-handler="MODAL" data-title="信息">${lcTask.task.task_des}</a>
			</form:field>
		
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${lcTask.counttime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="推送总数量"  value="${lcTask.rs}" ></form:field>
		
			<form:field type="p" label="展示总数量"  value="${lcTask.pv}" ></form:field>
		
			<form:field type="p" label="用户数"  value="${lcTask.uv}" ></form:field>
		
			<form:field type="p" label="总点击量"  value="${lcTask.cli}" ></form:field>
		
			<form:field type="p" label="总关闭数量"  value="${lcTask.clo}" ></form:field>
			
		</div>
	</form>
