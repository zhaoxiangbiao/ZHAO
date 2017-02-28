<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/rsIncomeSlot/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_RSINCOMESLOT_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告位收入" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_rsIncomeSlot_1" ></c:set>

	
<div class="data-div">
					<div class="widget collapsed " style="margin-top:5px;margin-bottom:0px">
						<div class="widget-header ">
							<span id='list-title' class="widget-caption">【${stat_date }】</span>
							<div class="widget-buttons">
							<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
										<input type="hidden"  name="filter_EQD_stat_date" value="${stat_date}" >
<!-- 										广告位ID: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_EQI_slot_id"  placeholder=""> -->
										广告位名称: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_LIKES_slot_name"  placeholder="">
<!-- 										媒体ID: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_EQI_slot_id"  placeholder=""> -->
										媒体名称: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="filter_LIKES_pub_name"  placeholder="">
										
				                        <button id="list_query_btn" href="javascript:;" class="btn btn-blue btn-xs search"  data-title="查询" data-form="true">查询</button>
							</form>
							</div>
					              <div class="widget-buttons">
<%-- 										<button  href="/ssp/logs/adSourceData/summarizationOfData?statDate=${stat_date}" class="btn btn-palegreen btn-xs " data-handler="MODAL" data-title="收入数据录入" data-form=true> --%>
<!-- 										收入录入 -->
<!-- 										</button> -->
<%-- 										<button href="${urlPrev }countIncome?stat_date=${stat_date}&syncIncome=1" class="btn btn-xs btn-palegreen " data-callback="$('#_income_refresh_current_month').click();"  data-handler="CONFIRM" data-title="确定要对【${stat_date}】的收入进行结算吗？ " > --%>
<!-- 										结算当天 -->
<!-- 										</button> -->
<%-- 										<button href="${urlPrev }countIncome?stat_date=${stat_month}&syncIncome=1" class="btn btn-xs btn-palegreen " data-callback="$('#_income_refresh_current_month').click();"  data-handler="CONFIRM" data-title="确定要对【${stat_month}】的收入进行结算吗？ " > --%>
<!-- 										结算当月 -->
<!-- 										</button> -->
										<button  href="${urlPrev }sourceIncomePage?statDate=${stat_date}" class="btn btn-warning btn-xs " data-handler="MODAL" data-title="收入录入【${stat_date}】" data-form=true>
										收入录入(新)
										</button>
										<button href="${urlPrev }countIncome?stat_date=${stat_date}&syncIncome=0" class="btn btn-xs btn-warning " data-callback="$('#_income_refresh_current_month').click();"  data-handler="CONFIRM" data-title="确定要对【${stat_date}】的收入进行结算吗？ " >
										结算当天(新)
										</button>
<%-- 										<button href="${urlPrev }countIncome?stat_date=${stat_month}&syncIncome=0" class="btn btn-xs btn-warning " data-callback="$('#_income_refresh_current_month').click();"  data-handler="CONFIRM" data-title="确定要对【${stat_month}】的收入进行结算吗？ " > --%>
<!-- 										结算当月(新) -->
<!-- 										</button> -->
										
										
										
<%-- 										<button href="${urlPrev }confirm?statDate=${stat_date}" class="btn btn-xs btn-primary "   data-handler="CONFIRM" data-set="#${tableId } .checkboxes"> --%>
<!-- 										审核通过 -->
<!-- 										</button> -->
										<button href="${urlPrev }confirm?all=1&statDate=${stat_date}" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM"  data-title="确定要对【${stat_date}】审核通过吗？ " data-callback="$('#_income_refresh_current_month').click()">
										审核通过(当天)
										</button>
<%-- 										<button href="${urlPrev }cancel?statDate=${stat_date}" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM"  data-set="#${tableId } .checkboxes"> --%>
<!-- 										审核不通过 -->
<!-- 										</button> -->
										<button href="${urlPrev }cancel?all=1&statDate=${stat_date}" class="btn btn-xs btn-darkorange "  data-handler="CONFIRM"  data-title="确定要对【${stat_date}】审核不通过吗？ " data-callback="$('#_income_refresh_current_month').click()">
										审核不通过(当天)
										</button>
										<button href="${urlPrev }resetfinalIncome?all=1&statDate=${stat_date}" class="btn btn-xs  btn-purple "  data-handler="CONFIRM"  data-title="确定要对【${stat_date}】的最终收入进行重置吗？ " data-callback="$('#_income_refresh_current_month').click()">
										重置最终收入(当天)
										</button>
										
				                     
				                    </div>
						</div>
						<div class="widget-body">
							
						</div>
				</div>
				<div class="widget no-header ">
						<div class="widget-body" id="${tableId }1div">
								<table class="table table-condensed table-bordered table-hover " id="${tableId }">							
								</table>		
						</div>
				</div>	
				
				</div>


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
					'<a class="btn  btn-xs edit" href="javascript:void(0)" >'+'调整</a>'+
					'<a class="btn  btn-xs dropdown-toggle " href="javascript:void(0);" data-toggle="dropdown" data-close-others="true">'+
					'<i class="fa fa-angle-'+ud+'"></i></a>'+
					'<ul class="dropdown-menu dropdown-blue pull-right">');
			if(all.status!=2){
				result.push('<li><a data-handler="CONFIRM"  data-callback=\'$("#_income_refresh_current_month").click()\'  data-title="" href="${urlPrev }confirm?statDate=${stat_date}&ids='+all.id+'"><i class="glyphicon glyphicon-ok primary"></i> 审核通过</a></li>');
			}
			if(all.status!=3){
				result.push('<li><a data-handler="CONFIRM"  data-callback=\'$("#_income_refresh_current_month").click()\'  data-title="" href="${urlPrev }cancel?statDate=${stat_date}&ids='+all.id+'"  data-prompt="reason" data-title="请输入原因:"><i class="glyphicon glyphicon-remove primary"></i> 审核不通过</a></li>');
			}
				result.push('<li><a data-handler="CONFIRM" data-callback=\'$("#_income_refresh_current_month").click()\' data-title="" href="${urlPrev }resetfinalIncome?statDate=${stat_date}&ids='+all.id+'"><i class="glyphicon glyphicon-repeat primary"></i> 重置最终收入</a></li>');
			
			
			result.push('</ul></div>');
			return result.join('');
//		  	  return '<a class="blue-stripes" href="javascript:loadChartData('+data+',\''+all.${tt}_name+'\');" ">查看数据</a> ';	        
	 };
	
 var oTable = TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[4, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:false,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 uxSumConfig:{
		 title:{
			 text:'总计',
			 cols:[
			 	0,1
			 ]
		 },
		 hiddenCols:[5,6,7,9,11,14,15,16]
	 },
	 aoColumns: [		
// 			{sTitle:'媒体ID',  mData: "pub_id",uxLongText:true},				
			{sTitle:'媒体名称',  sWidth:'140px', mData: "pub_name",uxLongText:true},				
// 			{sTitle:'',  mData: "site_id",uxLongText:true},				
// 			{sTitle:'',  mData: "site_name",uxLongText:true},				
// 			{sTitle:'广告位ID',  mData: "slot_id",uxLongText:true},				
			{sTitle:'广告位名称', sWidth:'140px', mData: "slot_name",uxLongText:true},		
// 			{sTitle:'',  mData: "stat_date" , mRender: Common.formatDate},					
// 			{sTitle:'',  mData: "client_type",uxLongText:true},				
// 			{sTitle:'',  mData: "ra",uxLongText:true},				
// 			{sTitle:'',  mData: "rs",uxLongText:true},				
			{sTitle:'PV',  mData: "pv",uxLongText:true,uxNumber:true,uxSum:true},				
			{sTitle:'点击',  mData: "cli",uxLongText:true,uxNumber:true,uxSum:true},				
// 			{sTitle:'',  mData: "clo",uxLongText:true},				
// 			{sTitle:'',  mData: "uv",uxLongText:true},				
// 			{sTitle:'',  mData: "ip",uxLongText:true},				
// 			{sTitle:'',  mData: "status_group_0",uxLongText:true},				
// 			{sTitle:'',  mData: "status_group_1",uxLongText:true},				
// 			{sTitle:'',  mData: "status_group_2",uxLongText:true},				
// 			{sTitle:'',  mData: "status_group_3",uxLongText:true},				
// 			{sTitle:'',  mData: "status_group_4",uxLongText:true},				
// 			{sTitle:'',  mData: "status_group_5",uxLongText:true},				
			{sTitle:'毛收入',  mData: "gross_income",sWidth:'70px',uxLongText:true,uxPrice:true,uxSum:true},				
			{sTitle:'CPM/CPC',  mData: "gross_price",sClass:"ux-number",sWidth:'50px',
				mRender:function(data,index,all){
				return Common.toThousands(data,2)+"/"+Common.toThousands(all.gross_income/all.cli,2);
			}},	
			{sTitle:'质量',  mData: "quality",sWidth:'50px',uxLongText:true,uxPrice:true},				
			{sTitle:'分成',  mData: "ratio",sWidth:'50px',sClass:"ux-number",mRender:function(data){
				return data+"%";
			}},				
			{sTitle:'净收入',  mData: "net_income",sWidth:'70px',uxLongText:true,uxPrice:true,uxSum:true},				
			{sTitle:'CPM/CPC',  mData: "net_price",sClass:"ux-number",sWidth:'50px',
				mRender:function(data,index,all){
				
				return Common.toThousands(data,2)+"/"+Common.toThousands(all.net_income/all.cli,2);
			}},				
			{sTitle:'最终收入',  mData: "final_income",sWidth:'70px',uxLongText:true,uxPrice:true,uxSum:true},				
			{sTitle:'CPM/CPC',  mData: "final_price",sClass:"ux-number",sWidth:'50px',
				mRender:function(data,index,all){
				return Common.toThousands(data,2)+"/"+Common.toThousands(all.final_income/all.cli,2);
			}},
			{sTitle:'服务费',  mData: "service_charge",uxLongText:true,uxPrice:true,uxSum:true},				
			{sTitle:'补贴',  mData: "subsidy",uxLongText:true,sWidth:'60px',uxPrice:true,uxSum:true},				
			{sTitle:'收入/源',  mData: "source_income_count",sWidth:'70px',render:function(data,index,all){
				var menu = [];
				menu.push('<a class="btn btn-xs btn-'+((all.source_income_count == all.source_flow_count)?'success':'warning')+'" data-handler="MODAL" data-title="广告源收入明细【'+all.slot_name+'】" href="${urlPrev}/sourceListPage?slotId='+all.slot_id+'&statDate=${stat_date}" >'+ all.source_income_count +"/"+all.source_flow_count +"</a>");
// 				return  '<span class="label label-'+((all.source_income_count == all.source_flow_count)?'success':'warning')+'">'+ all.source_income_count +"/"+all.source_flow_count +"</span>";
				return menu.join(' ');
			}},				
// 			{sTitle:'流量源',  mData: "source_flow_count",uxLongText:true},				
			{sTitle:'状态', sWidth:'80px', mData: "status",mRender : function(data,type,full){
    			var result = [];
    			var name = _GLOBAL.getEnum('slot_income_status',data);
    			var reason =  full.reason?full.reason:'无.';
    			result.push('<a href="javascript:void(0);" class="btn btn-'+(data==2?'success':'warning')+' btn-xs" data-container="body" data-titleclass="bordered-danger" data-class="dark" '+((data==3)?('data-toggle="popover-hover"'):'')+' data-placement="top" data-title="审核未通过原因" data-content="'+reason+'" data-original-title="" title="">'+name+'</a>');
    			return result.join('');
    		}},		
// 			{sTitle:'',  mData: "create_time" , mRender: Common.formatDate},			        
           {sTitle:'操作',
								  mData: "id" ,
								  bSortable:false,
							 	  mRender:oBtn
							 	 ,"sWidth": "80px"}
        ]
	           
 });
 
 
 var isEditing = null;




 //Cancel Editing or Adding a Row
 $('#${tableId}').on("click", 'a.cancel', function (e) {
     e.preventDefault();
     if ($(this).attr("data-mode") == "new") {
         var nRow = $(this).parents('tr')[0];
         oTable.fnDeleteRow(nRow);
     } else {
         restoreRow(oTable, isEditing);
         isEditing = null;
     }
 });

 //Edit A Row
 $('#${tableId}').on("click", 'a.edit', function (e) {
     e.preventDefault();

     var nRow = $(this).parents('tr')[0];

     if (isEditing !== null && isEditing != nRow) {
         restoreRow(oTable, isEditing);
         editRow(oTable, nRow);
         isEditing = nRow;
     } else {
         editRow(oTable, nRow);
         isEditing = nRow;
     }
 });

 //Save an Editing Row
 $('#${tableId}').on("click", 'a.save', function (e) {
     e.preventDefault();
     saveRow(oTable, isEditing);
     isEditing = null;
     //Some Code to Highlight Updated Row
        
 });


 function restoreRow(oTable, nRow) {
     var aData = oTable.fnGetData(nRow);
     var jqTds = $('>td', nRow);

     for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
         oTable.fnUpdate(aData[i], nRow, i, false);
     }

     oTable.fnDraw();
 }
 function round(v,e) 
 { 
	 var t=1; 
	 for(;e>0;t*=10,e--); 
	 for(;e<0;t/=10,e++); 
	 return Math.floor(v*t)/t; 
 }
 function editRow(oTable, nRow) {
     var aData = oTable.fnGetData(nRow);
     
     var jqTds = $('>td', nRow);
     jqTds[6].innerHTML = '<input type="text" id="input_final_quality" class="form-control input-xs " style="text-align:1right;width:50px;font-size: 13px;padding:1px;" value="' + aData['quality'] + '">';
     jqTds[10].innerHTML = '<input type="text" id="input_final_income" class="form-control input-xs" style="text-align:1right;width:100px;font-size: 13px;padding:1px;" value="' + aData['final_income'] + '">';
     jqTds[11].innerHTML = '<input type="text" id="input_final_price" class="form-control input-xs" style="text-align:1right;width:100px;font-size: 13px;padding:1px;" value="' + aData['final_price'] + '">';
     jqTds[16].innerHTML = ' <a href="#" class="btn btn-warning btn-xs cancel"><i class="fa fa-times"></i> </a> '
     						+ '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-save"></i> </a>';
     
     $('#input_final_income').on('keyup',function(t){
    	 var income = $(t.target).val();
    	 var pv = aData.pv;
    	 var price = round(income*1000/pv, 4);
    	 $('#input_final_price').val(price);
    	 var service_charge = aData['gross_income']-income;
    	 var subsidy = income-aData['net_income'];
    	 jqTds[12].innerHTML = round(service_charge, 2);
    	 jqTds[13].innerHTML = round(subsidy,2);
     })
     $('#input_final_price').on('keyup',function(t){
    	 var  price = $(t.target).val();
    	 var  pv = aData.pv;
    	 var  income = round(price*pv/1000, 2);
    	 $('#input_final_income').val(income);
    	 
    	 var service_charge = aData['gross_income']-income;
    	 var subsidy = income-aData['net_income'];
    	 jqTds[12].innerHTML = round(service_charge, 2);
    	 jqTds[13].innerHTML = round(subsidy,2);
     })
 }

 function saveRow(oTable, nRow) {
	 var aData = oTable.fnGetData(nRow);
     var jqInputs = $('input', nRow);
     var quality = jqInputs[0].value;
     var income = jqInputs[1].value;
     var price =  jqInputs[2].value;
	 $.ajax({
         type: "POST",
         cache: false,
         data:{
        	 id:aData['id'],
        	 quality:quality,
        	 price:price,
        	 slotId:aData['slot_id'],
        	 statDate:Common.formatDate(aData['stat_date']),
        	 income:income
         },
         url: "${urlPrev }editFinalIncome",
         dataType: "json",
         success: function (data) {
//      		oTable.fnDraw();
				$('#_income_refresh_current_month').click()
         }
	 });
 }

 function cancelEditRow(oTable, nRow) {
     oTable.fnDraw();
 }
 
});
</script>
