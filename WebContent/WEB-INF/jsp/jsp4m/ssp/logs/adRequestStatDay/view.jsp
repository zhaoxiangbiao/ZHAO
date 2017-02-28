<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${adRequestStatDay.statdate}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="当日请求次数"  value="${adRequestStatDay.request_today}" ></form:field>
		
			<form:field type="p" label="历史累计请求总次数"  value="${adRequestStatDay.request_history}" ></form:field>
		
			<form:field type="p" label="累计请求总次数"  value="${adRequestStatDay.request}" ></form:field>
			
		</div>
	</form>
