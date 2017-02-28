<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="媒体id"  value="${siteCpmCtrRule.pub_id}" ></form:field>
		
			<form:field type="p" label="站点id"  value="${siteCpmCtrRule.site_id}" ></form:field>
		
			<form:field type="p" label="转化率最低值"  value="${siteCpmCtrRule.min_ctr}" ></form:field>
		
			<form:field type="p" label="转化率最高值"  value="${siteCpmCtrRule.max_ctr}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${siteCpmCtrRule.createtime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field  label="最后更新时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${siteCpmCtrRule.updatetime}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="状态 有效 1,无效 0"  value="${siteCpmCtrRule.status}" ></form:field>
		
			<form:field type="p" label="备注"  value="${siteCpmCtrRule.remark}" ></form:field>
			
		</div>
	</form>
