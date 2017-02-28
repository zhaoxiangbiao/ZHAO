<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<script src="${ctx}/assets/js/highcharts/highcharts-more.js"></script> 
<script src="${ctx}/assets/js/highcharts/exporting.js"></script> 
<style type="text/css">
	.highcharts-tooltip h3 {
	    margin: 0.3em 0;
	}
</style>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="账号"  value="${user.phone_number}" ></form:field>
			<form:field type="p" label="标签数量"  value="${user.label_count}" ></form:field>
			<div style="padding-left: 15%;">
				<c:forEach items="${labelsDetail}" var="m">
	
	    		 标签内容：<span class="label label-info">${m.key}</span>
	    			
	
				</c:forEach>
			</div>
			<!-- <div id="container123" style="height: 400px; min-width: 310px; max-width: 600px; margin: 0 auto"></div> -->
			<%-- <form:field type="p" label="用户偏好"  value="${user.p reference}" ></form:field>
		
			<form:field  label="是否是集团用户"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="isOrNot" enumKey="${user.del_flag}" />
			</form:field>
			
		
			<form:field  label="用户所属的运营商"  useBody="true"  type="p">
					<tag:enum tagType="view" enumName="ea_operator1" enumKey="${user.operator}" />
			</form:field> --%>
			
			
		</div>
	</form>
<script type="text/javascript">
	</script>