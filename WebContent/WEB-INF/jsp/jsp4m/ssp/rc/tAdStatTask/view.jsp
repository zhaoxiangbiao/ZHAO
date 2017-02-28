<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="任务ID"  value="${tAdStatTask.task_id}" ></form:field>
		
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${tAdStatTask.stat_date}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="小时"  value="${tAdStatTask.hour}" ></form:field>
		
			<form:field  label="统计周期 "  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="stat_cycle" enumKey="${tAdStatTask.type}" />
			</form:field>
			
		
			<form:field  label="统计状态"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="process_status" enumKey="${tAdStatTask.status}" />
			</form:field>
			
		
			<form:field  label="开始时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${tAdStatTask.start_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="完成时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${tAdStatTask.end_time}" pattern="yyyy-MM-dd"/>
			</form:field>
			
		</div>
	</form>
