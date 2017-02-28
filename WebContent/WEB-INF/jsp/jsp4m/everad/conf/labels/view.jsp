<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="标签名"  value="${labels.label}" ></form:field>
		    
			<form:field type="p" label="标签下对应的人数"  value="${labels.user_count}" ></form:field>
			
			<div style="padding-left: 15%;">
				<c:forEach items="${phoneNumDetail}" var="m">
	
	    		 账号：<span class="label label-info">${m.key}</span><br/>
	
				</c:forEach>
			</div>
		</div>
	</form>
