<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adCountPub.time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="媒体ID"  value="${adCountPub.pubid}" ></form:field>
		
			<form:field type="p" label="展示量"  value="${adCountPub.show}" ></form:field>
		
			<form:field type="p" label="点击量"  value="${adCountPub.click}" ></form:field>
		
			<form:field type="p" label="点击率"  value="${adCountPub.ctr}" ></form:field>
		
			<form:field type="p" label="收入"  value="${adCountPub.income}" ></form:field>
			
		</div>
	</form>
