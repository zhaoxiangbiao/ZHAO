<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${lcAll.counttime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="推送总数量"  value="${lcAll.rs}" ></form:field>
		
			<form:field type="p" label="展示总数量"  value="${lcAll.pv}" ></form:field>
		
			<form:field type="p" label="用户数"  value="${lcAll.uv}" ></form:field>
		
			<form:field type="p" label="总点击量"  value="${lcAll.cli}" ></form:field>
		
			<form:field type="p" label="总关闭数量"  value="${lcAll.clo}" ></form:field>
			
		</div>
	</form>
