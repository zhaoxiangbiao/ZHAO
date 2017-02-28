<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="名字"  value="${moren.name}" ></form:field>
		
			<form:field  label="出生日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${moren.age}" pattern="yyyy-MM-dd hh:mm:ss"/>
			</form:field>
		
			<form:field type="p" label="变身时间"  value="${moren.changeTime}" ></form:field>
			
		</div>
	</form>
