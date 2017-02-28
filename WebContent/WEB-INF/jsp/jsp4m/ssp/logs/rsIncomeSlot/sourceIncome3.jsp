<%@page import="java.util.Calendar"%>
<%@page import="com.junfu360.common.utils.AdDateUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/rsIncomeSlot/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADPUB_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告媒体" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_sourceIncome_3" ></c:set>


<div class="row">
	<div class="col-md-12">
	<div class="data-div">
					
			
				<div class="widget collapsed " style="margin-top:5px;margin-bottom:0px">
						<div class="widget-header ">
							<span class="widget-caption">数据列表</span>
							<div class="widget-buttons">
							<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								<input type="hidden" id="startDateSS1" name="statDate" value="${statDate }" >
										<div class="widget-buttons " style="display: none;">	
					 					</div>
										创意名称: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="sName"  placeholder="">
										
							</form>
							</div>
					              <div class="widget-buttons">
				                        <button id="list_query_btn" href="javascript:;" class="btn btn-blue btn-xs search"  data-title="查询" data-form="true">查询</button>
				                    </div>
						</div>
						<div class="widget-body">
							
						</div>
				</div>
				<div class="widget no-header ">
						<div class="widget-body" id="${tableId }div">
								<table class="table table-condensed table-bordered table-hover " id="${tableId }">							
								</table>		
						</div>
						
				</div>	
			</div>
	</div>
					<!-- END SAMPLE TABLE PORTLET-->
</div>
<script>
$(document).ready(function() {
	var oBtn = function(data,d,all,row){
		 var ud="down";
		 
		 var result = [];
			
			// 自定义按钮组
			
			result.push('<div class=" btn-group drop'+ud+'">'+
					'<a class="btn  btn-xs edit" href="javascript:void(0)" >'+'录入</a>')
					
			return result.join('');
//		  	  return '<a class="blue-stripes" href="javascript:loadChartData('+data+',\''+all.${tt}_name+'\');" ">查看数据</a> ';	        
	 };
     var oTable = TableAjax.init('${tableId}',{
					 sAjaxSource: "${urlPrev }sourceIncomeJson3",
					 aaSorting: [[1, "desc" ]], // 需要自定义
					 uxUrlPrev:"${urlPrev }",
					 uxDataTitle:"${dataTitle }",
					 uxCheckable:false,
					 uxCloseScroll:true,
					 uxDrapable:false,
					
					 aoColumns: [		
									{sTitle:'创意',"sWidth": "140px",mData: "creative_name" },
									{sTitle:'展示(PV)',"sWidth": "140px",mData: "pv" ,uxNumber:true},
									{sTitle:'点击',  mData: "cli",sClass:"ux-number",sWidth:'150px',
										mRender:function(data,index,all){
											return Common.toThousands(data)+"("+Common.round(all.cli*100/all.pv,2)+")";
									}},
									
									{sTitle:'认可展示(PV)',"sWidth": "140px",mData: "pv2" ,uxNumber:true},
// 									{sTitle:'认可点击',"sWidth": "140px",mData: "cli2" ,uxNumber:true},
									{sTitle:'认可点击',  mData: "cli2",sClass:"ux-number",sWidth:'150px',
										mRender:function(data,index,all){
											if(all.cli2 && all.pv2){
												return Common.toThousands(data)+"("+Common.round(all.cli2*100/all.pv2,2)+")";
											}else{
												return "";
											}
									}},
									{sTitle:'收入',"sWidth": "140px",mData: "income" ,uxPrice:true},
									{sTitle:'CPM',  mData: "income",sClass:"ux-number",sWidth:'70px',
										mRender:function(data,index,all){
											
										return Common.toThousands(all.income/all.pv*1000,2);
									}},
									{sTitle:'操作',
										  mData: "id" ,
										  bSortable:false,
									 	  mRender:oBtn
									 	 ,"sWidth": "100px"}
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


      var restoreRow = function (oTable, nRow) {
          var aData = oTable.fnGetData(nRow);
          var jqTds = $('>td', nRow);

          for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
              oTable.fnUpdate(aData[i], nRow, i, false);
          }

          oTable.fnDraw();
      }
     var round =function (v,e) 
      { 
     	 var t=1; 
     	 for(;e>0;t*=10,e--); 
     	 for(;e<0;t/=10,e++); 
     	 return Math.floor(v*t)/t; 
      }
      var editRow = function (oTable, nRow) {
          var aData = oTable.fnGetData(nRow);
          
          var jqTds = $('>td', nRow);
          jqTds[3].innerHTML = '<input type="text" id="input_final_quality" class="form-control input-xs " style="text-align:1right;width:100px;font-size: 13px;padding:1px;" value="' + (aData['pv2']?aData['pv2']:aData['pv'] )+ '">';
          jqTds[4].innerHTML = '<input type="text" id="input_final_income" class="form-control input-xs" style="text-align:1right;width:100px;font-size: 13px;padding:1px;" value="' + (aData['cli2']?aData['cli2']:aData['cli'])  + '">';
          jqTds[5].innerHTML = '<input type="text" id="input_final_price" class="form-control input-xs" style="text-align:1right;width:100px;font-size: 13px;padding:1px;" value="' + (aData['income']?aData['income']:'0')  + '">';
          jqTds[7].innerHTML = ' <a href="#" class="btn btn-warning btn-xs cancel"><i class="fa fa-times"></i> </a> '
          						+ '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-save"></i> </a>';
          
//           $('#input_final_income').on('keyup',function(t){
//          	 var income = $(t.target).val();
//          	 var pv = aData.pv;
//          	 var price = round(income*1000/pv, 4);
//          	 $('#input_final_price').val(price);
//          	 var service_charge = aData['gross_income']-income;
//          	 var subsidy = income-aData['net_income'];
//          	 jqTds[12].innerHTML = round(service_charge, 2);
//          	 jqTds[13].innerHTML = round(subsidy,2);
//           })
//           $('#input_final_price').on('keyup',function(t){
//          	 var  price = $(t.target).val();
//          	 var  pv = aData.pv;
//          	 var  income = round(price*pv/1000, 2);
//          	 $('#input_final_income').val(income);
         	 
//          	 var service_charge = aData['gross_income']-income;
//          	 var subsidy = income-aData['net_income'];
//          	 jqTds[12].innerHTML = round(service_charge, 2);
//          	 jqTds[13].innerHTML = round(subsidy,2);
//           })
      }

      var saveRow = function (oTable, nRow) {
     	 var aData = oTable.fnGetData(nRow);
          var jqInputs = $('input', nRow);
          var pv2 = jqInputs[0].value;
          var cli2 = jqInputs[1].value;
          var income =  jqInputs[2].value;
     	 $.ajax({
              type: "POST",
              cache: false,
              data:{
//              	 id:aData['id'],
             		 pv2:pv2,
                	 cli2:cli2,
                	 pv:aData['pv'],
                	 cli:aData['cli'],
                	 target_type:3,
                	 target_id:aData['creative_id'],
                	 target_name:aData['creative_name'],
                	 stat_date:'${statDate }',
                	 income:income
              },
              url: "${urlPrev }editSourceIncome",
              dataType: "json",
              success: function (data) {
          		oTable.fnDraw();
              }
     	 });
      }

      var cancelEditRow = function (oTable, nRow) {
          oTable.fnDraw();
      }
			
});  

</script>