<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${adPubAdjustIncome.statdate}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="媒体id"  value="${adPubAdjustIncome.pub_id}" ></form:field>
		
			<form:field type="p" label="站点id"  value="${adPubAdjustIncome.site_id}" ></form:field>
		
			<form:field type="p" label="广告位id"  value="${adPubAdjustIncome.slot_id}" ></form:field>
		
			<form:field type="p" label="调整收入"  value="${adPubAdjustIncome.income}" ></form:field>
		
			<form:field  label="创建时间"  useBody="true" type="p"  >
				<fmt:formatDate value="${adPubAdjustIncome.create_time}" pattern="yyyy-MM-dd"/>
			</form:field>
			
		</div>
	</form>
