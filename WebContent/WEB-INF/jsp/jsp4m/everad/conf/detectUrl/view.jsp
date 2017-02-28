<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="域名"  value="${detectUrl.domain}" ></form:field>
		
			<form:field type="p" label="url"  value="${detectUrl.url}" ></form:field>
		
			<form:field  label="匹配类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_match_type" enumKey="${detectUrl.match_type}" />
			</form:field>
			
		
			<form:field type="p" label="正则"  value="${detectUrl.regex}" ></form:field>
		
			<form:field type="p" label="抓取正则"  value="${detectUrl.fetch_regex}" ></form:field>
		
			<form:field  label="抓取目的"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_fetch_aim" enumKey="${detectUrl.fetch_aim}" />
			</form:field>
			
		
			<form:field type="p" label="描述"  value="${detectUrl.des}" ></form:field>
		
			<form:field type="p" label="名称"  value="${detectUrl.name}" ></form:field>
			
		</div>
	</form>
