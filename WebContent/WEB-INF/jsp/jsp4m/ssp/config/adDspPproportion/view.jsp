<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
	<form  class="form-horizontal" >
		<div class="form-body">
			<form:field type="p" label="目标类型：0=全局 1=pub  2=site  3=slot"  value="${adDspPproportion.type}" ></form:field>
		
			<form:field type="p" label="目标ID（pub_id | site_id | slot_id）"  value="${adDspPproportion.target_id}" ></form:field>
		
			<form:field type="p" label="dsp 唯一标识"  value="${adDspPproportion.dsp_id}" ></form:field>
		
			<form:field type="p" label="展示量占比（百分制）"  value="${adDspPproportion.proportion}" ></form:field>
			
		</div>
	</form>
