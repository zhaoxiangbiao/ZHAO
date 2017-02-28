<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field  label="日期"  useBody="true" type="p"  >
				<fmt:formatDate value="${adDataPubStatDay.statDate}" pattern="yyyy-MM-dd"/>
			</form:field>
		
			<form:field type="p" label="媒体ID"  value="${adDataPubStatDay.pub_id}" ></form:field>
		
			<form:field type="p" label="分成前结算收入"  value="${adDataPubStatDay.income}" ></form:field>
		
			<form:field type="p" label="结算收入"  value="${adDataPubStatDay.last_income}" ></form:field>
		
			<form:field type="p" label="展示统计"  value="${adDataPubStatDay.show_count}" ></form:field>
		
			<form:field type="p" label="点击统计"  value="${adDataPubStatDay.click_count}" ></form:field>
		
			<form:field type="p" label="点击率"  value="${adDataPubStatDay.s_ctr}" ></form:field>
		
			<form:field type="p" label="服务费率"  value="${adDataPubStatDay.incomestr}" ></form:field>
			
		</div>
	</form>
