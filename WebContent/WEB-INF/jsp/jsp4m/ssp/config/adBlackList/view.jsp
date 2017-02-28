<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="域名"  value="${adBlackList.domain_name}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adBlackList.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="更新时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adBlackList.update_time}" pattern="yyyy-MM-dd"/>
			</form:field>
			
		</div>
	</form>
