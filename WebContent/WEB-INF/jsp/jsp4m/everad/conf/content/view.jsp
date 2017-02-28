<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="内容名称"  value="${content.content_name}" ></form:field>
		
			<%-- <form:field  label="标签"  useBody="true" type="p" >
				<a class="btn blue-stripe btn-xs" href="${ctx}/everad/conf/labels/view?id=${content.label.id}"  data-handler="MODAL" data-title="信息">${content.label.label}</a>
			</form:field>
		 --%>
			<form:field  label="内容类型"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_content_type" enumKey="${content.content_type}" />
			</form:field>
			
		
			<form:field  label="形式"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_content_shape" enumKey="${content.content_shape}" />
			</form:field>
			
		
			<form:field  label="尺寸"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_size" enumKey="${content.content_size}" />
			</form:field>
			
		
			<form:field type="p" label="资源地址"  value="${content.content_sourceurl}" ></form:field>
		
			<form:field type="p" label="跳转地址"  value="${content.content_jumpurl}" ></form:field>
			
			<form:field type="p" label="资源地址2"  value="${content.content_sourceurl2}" ></form:field>
		
			<form:field type="p" label="跳转地址2"  value="${content.content_jumpurl2}" ></form:field>
			
			<form:field type="p" label="文字标题"  value="${content.content_texttitel}" ></form:field>
		
			<form:field type="p" label="文字内容"  value="${content.content_textcontent}" ></form:field>
			
		</div>
	</form>
