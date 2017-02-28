<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/rsIncomePubMonth/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_RSINCOMEPUBMONTH_" ></c:set>
<c:set scope="page" var="dataTitle" value="媒体月收入结算表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_rsIncomePubMonth_1" ></c:set>
<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="alert alert-warning fade in">
	                                         <button class="close" data-dismiss="alert">
	                                             ×
	                                         </button>
	                                         <i class="fa-fw fa fa-warning"></i>
	                                         <strong>注意</strong> 月结表的收入只包括状态为【审核通过】的广告位收入.
	                                         <br/>【待支付】和【已支付】状态的月结算数据，在SSP端可见。
	                              </div>
					<div class="data-div">
					<div class="widget  " style="margin-bottom:5px;">
			<div class="widget-header ">
				<span class="widget-caption">数据列表</span>
				
				<div class="widget-buttons">
							<form class="form-inline" role="form"   method="post" target="_BLANK" action="${urlPrev }exportExcel?excelName=${statDate }&sheetName=${statDate }&title=${statDate }"  id="form_${tableId}">
									<input type="hidden"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_EQS_stat_date" value="${statDate }"  placeholder="">
	
									媒体名称: <input  type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_LIKES_pub_name"  placeholder="">
							
							</form>
							</div>
					
                  <div class="widget-buttons">
                        
                        <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="广告来源" data-form="true">查询</button>
                    </div>
                  <div class="widget-buttons buttons-bordered">
								
									<button href="${urlPrev }delete?statDate=${statDate}" class="btn btn-xs btn-primary "  data-handler="CONFIRM" data-title='确定要对【${statDate}】的数据进行汇总吗？<br/><br/><div class="alert alert-warning fade in"> <i class="fa-fw fa fa-warning"></i><strong>注意</strong> 如果已经有媒体收入的状态为【待支付】或【已支付】，则该记录的【状态】和【发票信息】保持不变。</div> '>
										汇总当月
									</button>
									<button onclick="$('#form_${tableId}').submit();" class="btn btn-xs btn-info " >
										<i class="fa fa-download "></i> 导出EXCEL
								    </button>
								    
								    <button href="${urlPrev }submit?all=1&statDate=${statDate}" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM"  data-title="确定要对【${statDate}】的数据进行提交吗？ " >
										提交审核(当月)
									</button>
								    <button href="${urlPrev }verify1?all=1&approved=1&statDate=${statDate}" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM"  data-title="确定要对【${statDate}】的数据进行审核通过吗？ " >
										初审通过(当月)
									</button>
								    <button href="${urlPrev }verify2?all=1&approved=1&statDate=${statDate}" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM"  data-title="确定要对【${statDate}】的数据进行审核通过吗？ " >
										终审通过(当月)
									</button>
								    <button href="${urlPrev }pay?all=1&statDate=${statDate}" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM"  data-title="确定要对【${statDate}】的数据进行支付吗？ " >
										支付(当月)
									</button>
								    <button href="${urlPrev }resetStatus?all=1&statDate=${statDate}" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM"  data-title="确定要对【${statDate}】的数据进行支付吗？ " >
										重置状态(当月)
									</button>
				 </div>
			</div>
						
			<div class="widget-body">
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">
						</table>
						
						</div>
						</div>
						
						
			
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
</div>
	<!-- END ROW CONTENT-->
		


<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	//look-up 查询条件 会员 
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	
	var oBtn = function(data,d,all,row){
		 var ud="down";
		 
		 var result = [];
		 
			// 自定义按钮组
			
			result.push('<div class=" btn-group drop'+ud+'">'+
					'<a class="btn  btn-xs edit" href="javascript:void(0)" >'+'编辑</a>'+
					'<a class="btn  btn-xs dropdown-toggle " href="javascript:void(0);" data-toggle="dropdown" data-close-others="true">'+
					'<i class="fa fa-angle-'+ud+'"></i></a>'+
					'<ul class="dropdown-menu dropdown-blue pull-right">');
				result.push('<li><a data-handler="CONFIRM" data-title="" href="${urlPrev }submit?&ids='+all.id+'&statDate=${statDate}"><i class="glyphicon glyphicon-ok primary"></i> 提交审核</a></li>');
				result.push('<li><a data-handler="CONFIRM" data-title="" href="${urlPrev }verify1?ids='+all.id+'&approved=1&statDate=${statDate}"><i class="glyphicon glyphicon-ok primary"></i> 初审通过</a></li>');
				result.push('<li><a data-handler="CONFIRM" data-title="" href="${urlPrev }verify2?ids='+all.id+'&approved=1&statDate=${statDate}"><i class="glyphicon glyphicon-ok primary"></i> 终审通过</a></li>');
				result.push('<li><a data-handler="CONFIRM" data-title="" href="${urlPrev }pay?ids='+all.id+'&statDate=${statDate}"><i class="glyphicon glyphicon-ok primary"></i> 支付</a></li>');
				result.push('<li><a data-handler="CONFIRM" data-title="" href="${urlPrev }resetStatus?ids='+all.id+'&statDate=${statDate}"><i class="glyphicon glyphicon-repeat primary"></i> 重置状态</a></li>');
				result.push('<li><a data-handler="CONFIRM"  href="${urlPrev }verify1?ids='+all.id+'&approved=0&statDate=${statDate}" data-prompt="reason" data-title="请输入原因:"><i class="glyphicon glyphicon-remove primary"></i> 初审不通过</a></li>');
				result.push('<li><a data-handler="CONFIRM"  href="${urlPrev }verify2?ids='+all.id+'&approved=0&statDate=${statDate}" data-prompt="reason" data-title="请输入原因:"><i class="glyphicon glyphicon-remove primary"></i> 终审不通过</a></li>');
			
			
			result.push('</ul></div>');
			return result.join('');
	 };
 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[1, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:false,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 uxSumConfig:{
		 title:{
			 text:'总计',
			 cols:[
			 	0
			 ]
		 },
		 hiddenCols:[9,11]
	 },
	 uxEdit:{
		 edit:function (oTable, nRow) {

		     var aData = oTable.fnGetData(nRow);
		     
		     var jqTds = $('>td', nRow);
		     jqTds[4].innerHTML = '<input type="text" id="input_tax_ratio" class="form-control input-xs " style="text-align:1right;width:50px;font-size: 13px;padding:1px;" value="' + aData['tax_ratio'] + '">';
		     jqTds[7].innerHTML = '<select class="form-control" name="input_country" data-bv-field="country"><option value="0" >普通发票</option><option value="1" '+(aData.invoicetype==1?' selected ':' ')+'> 增值税发票</option></select>';
		     jqTds[8].innerHTML = '<input type="text"  class="form-control input-xs" style="text-align:1right;width:150px;font-size: 13px;padding:1px;" value="' + (aData['invoicenumber'] ?aData['invoicenumber']:'' ) + '">';
		     jqTds[11].innerHTML = ' <a href="#" class="btn btn-warning btn-xs cancel"><i class="fa fa-times"></i> </a> '
		     						+ '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-save"></i> </a>';
		     
		     $('#input_tax_ratio').on('keyup',function(t){
		    	 var ratio = $(t.target).val();// 税率
		    	 var final_income = aData.final_income;// 税前
		    	 var tax =  Common.round(final_income*ratio/100,2); // 税费
		    	 var pay = Common.round(final_income - tax,2); // 税后
		    	 jqTds[5].innerHTML = tax;
		    	 jqTds[6].innerHTML = pay;
		    	 
		     })
		    
         },
         save:function (oTable, nRow) {
        	 var jqTds = $('>td', nRow);
        	 var aData = oTable.fnGetData(nRow);
             var jqInputs = $('.form-control', nRow);
             var tax_ratio = jqInputs[0].value;
             var tax = jqTds[5].innerHTML.replace(',','');
             var pay = jqTds[6].innerHTML.replace(',','');
             var invoicetype = jqInputs[1].value;
             var invoicenumber =  jqInputs[2].value;
            
        	 $.ajax({
                 type: "POST",
                 cache: false,
                 data:{
                	 id:aData['id'],
                	 tax_ratio:tax_ratio,
                	 invoicetype:invoicetype,
                	 invoicenumber:invoicenumber,
                	 tax:tax,
                	 pay:pay
                 },
                 url: "${urlPrev }save",
                 dataType: "json",
                 success: function (data) {
             		oTable.fnDraw();
                 }
        	 });
         }
	 },
	 aoColumns: [		
			{sTitle:'媒体名称',  mData: "pub_name",sWidth:'140px',uxLongText:true},  
			{sTitle:'毛收入',  mData: "gross_income",sWidth:'80px',uxLongText:true,uxPrice:true,uxSum:true},				
// 			{sTitle:'净收入',  mData: "net_income",uxLongText:true,uxPrice:true,uxSum:true},				
// 			{sTitle:'最终收入',  mData: "final_income",uxLongText:true,uxPrice:true,uxSum:true},				
			{sTitle:'服务费',  mData: "service_charge",sWidth:'80px',uxLongText:true,uxPrice:true,uxSum:true},				
// 			{sTitle:'补贴',  mData: "subsidy",uxLongText:true,uxPrice:true,uxSum:true},				
			{sTitle:'税前收入',  mData: "final_income",uxLongText:true,uxPrice:true,uxSum:true},				
			{sTitle:'税率(%)',  mData: "tax_ratio",sWidth:'60px',uxLongText:true,uxNumber:true},				
			{sTitle:'税费',  mData: "tax",sWidth:'80px',uxLongText:true,uxPrice:true,uxSum:true},				
			{sTitle:'税后收入',  mData: "pay",uxLongText:true,uxPrice:true,uxSum:true},				
			{sTitle:'发票类型 ',  mData: "invoicetype",sWidth:'70px',uxEnum:'invoiceType'},				
			{sTitle:'发票编号',  mData: "invoicenumber",sWidth:'150px',uxLongText:true},				
			{sTitle:'状态',  mData: "status",sWidth:'50px',mRender : function(data,type,full){
    			var result = [];
    			var name = _GLOBAL.getEnum('pay_status',data);
    			var reason =  full.reason?full.reason:'无.';
    			var color={
    				"0":"default", // 待提交
    				"1":"default", // 待初审
    				"2":"default", // 待终审
    				"3":"warning", // 待支付
    				"4":"success"// 已支付
    			};
    			result.push('<a href="javascript:void(0);" class="btn btn-'+(color[data])+' btn-xs " data-container="body" data-titleclass="bordered-danger" data-class="dark" '+((data==11||data==12)?('data-toggle="popover-hover"'):'')+' data-placement="top" data-title="审核未通过原因" data-content="'+reason+'" data-original-title="" title="">'+name+'</a>');
    			return result.join('');
    		}},		
			{sTitle:'状态时间',  mData: "status_time" ,sWidth:'110px', mRender: Common.formatDateTime},			
// 			{sTitle:'',  mData: "create_time" , mRender: Common.formatDate},
			{sTitle:'操作',mData:"id",sWidth:"70px",bSortable:false,mRender:oBtn}
        ]
	           
 });
});
</script>
