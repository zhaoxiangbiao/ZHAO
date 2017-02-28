<%@tag pageEncoding="UTF-8"%>

<%@ attribute name="name" type="java.lang.String" required="true" %>
<%@ attribute name="required" type="java.lang.Boolean" required="false"%>

<div class="fileupload fileupload-new" data-provides="fileupload">
	<div class="input-group">
		<span class="input-group-btn">
		<span class="uneditable-input">
		<i class="fa fa-file fileupload-exists"></i> 
		<span class="fileupload-preview"></span>
		</span>
		</span>
		<span class="btn default btn-file">
		<span class="fileupload-new"><i class="fa fa-paper-clip"></i> 选择文件</span>
		<span class="fileupload-exists"><i class="fa fa-undo"></i> 更换</span>
		<input type="file" class="default" name="${name }" ${required?"required":"" } />
		</span>
		<a href="#" class="btn red fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> 清除</a>
	</div>
</div>