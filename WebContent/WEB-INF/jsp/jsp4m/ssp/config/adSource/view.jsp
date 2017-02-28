<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="来源id"  value="${adSource.source_id}" ></form:field>
		
			<form:field type="p" label="来源名称"  value="${adSource.source_name}" ></form:field>
			
			<c:forEach  items="${referList}" var="item">
				<form:field type = "p" label="认可网站地址" value="${item}"></form:field>
			</c:forEach>
			
			<form:field  label="是否替换认可网站域名"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="source_replace" enumKey="${adSource.source_replace}" />
			</form:field>
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adSource.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			
		</div>
	</form>
