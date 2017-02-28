<%@page import="java.util.Calendar"%>
<%@page import="com.junfu360.common.utils.AdDateUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- 三方源、三方DSP、自有DSP -->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adPub/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADPUB_" ></c:set>
<c:set scope="page" var="dataTitle" value="广告媒体" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adPub_1" ></c:set>
<%
SimpleDateFormat today =   new SimpleDateFormat( "yyyy-MM-dd");
String newDate=today.format(new Date());
request.setAttribute("today", newDate);
String date2 = AdDateUtil.getYesterday("yyyy-MM-dd");
request.setAttribute("date2", date2);


int maxHour = 23;
Calendar calendar = Calendar.getInstance();
   calendar.setTime(new Date());
   maxHour = calendar.get(Calendar.HOUR_OF_DAY)-1;
   request.setAttribute("maxHour",maxHour);

%>

<div class="row">
	<div class="col-md-12">
	<div class="data-div">
			<div class="widget-header ">
					<span class="widget-caption">数据概览</span>       
					<div  id="findWhere"  class="widget-buttons"  style="display: none;">
						 <button   class="btn btn-info btn-xs "  data-container="body" data-titleclass="bordered-blue" data-class="" data-toggle="popover-hover" data-placement="top" data-title="过滤条件" data-content="点击清除该条件，查看全部数据。" href="javascript:void(0);" filter-data=""></button>
					</div>	
					<div class="widget-buttons ">	
					
						 <div class="">
<!-- 								<label class="control-label">终端类型：</label> -->
                                       <div class="radio">
                                           <label>
                                               <input name="form-field-radio1" type="radio" checked="checked"  onclick="javascript:loadChartData();" >
                                               <span class="text">全部 </span>
                                           </label>
                                       </div>
                                       <div class="radio">
                                           <label>
                                               <input name="form-field-radio1" type="radio"   onclick="javascript:loadChartData();" >
                                               <span class="text">PC </span>
                                           </label>
                                       </div>
                                       <div class="radio">
                                             <label>
                                                 <input name="form-field-radio1" type="radio"  onclick="javascript:loadChartData();" >
                                                 <span class="text">移动</span>
                                             </label>
                                       </div>
						</div>                                  
					 </div>	               
					<div class="widget-buttons buttons-bordered" id="hdDiv" <c:if test="${compare}"> style="display:none;"</c:if> >	
					
						 <div class="">
<!-- 								<label class="control-label">统计周期：</label> -->
                                       <div class="radio">
                                           <label>
                                               <input name="form-field-radio" type="radio" checked="checked"  onclick="javascript:loadChartData();" >
                                               <span class="text">小时 </span>
                                           </label>
                                       </div>
                                         <div class="radio">
                                             <label>
                                                 <input name="form-field-radio" type="radio" class="inverted"  onclick="javascript:loadChartData();" >
                                                 <span class="text">天</span>
                                             </label>
                                         </div>
						</div>                                  
					 </div>                                  
						<div class="widget-buttons" id="reservationDiv" <c:if test="${compare}"> style="display:none;"</c:if> >	
                                 <div id="reservation"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
					                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
					                  <span>${today } 至   ${today }</span> <b class="caret"></b>
					            </div>        
                   		</div>
                   		<div class="widget-buttons" id="date1Div" <c:if test="${!compare}"> style="display:none;"</c:if> >	
                                 <div id="date1"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
					                 日期1<i class="glyphicon glyphicon-calendar fa fa-calendar blue" style="margin-left: 5px;"></i>
					                  <span>${today }</span> <b class="caret"></b>
					            </div>        
                   		</div>
                   		
						<div class="widget-buttons">	
                                     <div class="checkbox">
                                           <label>
                                               <input id="compare_id" type="checkbox" onclick="changeMode(this)"   <c:if test="${compare}"> checked="checked" </c:if> >
                                               <span class="text">对比</span>
                                           </label>
                                       </div>     
                   		</div>
                   		<div class="widget-buttons" id="date2Div" <c:if test="${!compare}"> style="display:none;"</c:if> >	
                                 <div id="date2"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
					                   日期2<i class="glyphicon glyphicon-calendar fa fa-calendar blue" style="margin-left: 5px;"></i>
					                  <span>${date2 }</span> <b class="caret"></b>
					            </div>        
                   		</div>
					</div>
					
			<div class="widget-body">
					
					
<div  id="selectType_div" class="databox-row no-padding " style="height: 35px; <c:if test="${!compare}"> display:none; </c:if>" >
               								 <div style="float: right; margin: 0 20px 0px 0px;">
      		<input id="chart_type_1" style="display: none;" value="pv" name="PV量"></input>
      		<a  href="javascript:void(0);"  onclick="setValue('chart_type_1','pv',this) ;loadChartData();"  class="btn btn-warning btn-sm" >PV量</a>
      		<a  href="javascript:void(0);"  onclick="setValue('chart_type_1','cli',this) ;loadChartData();"  class="btn btn-blue btn-sm" >点击量</a>
      		<a  href="javascript:void(0);"  onclick="setValue('chart_type_1','round((cli/pv)*100,2)',this) ;loadChartData();"  class="btn btn-blue btn-sm" >点击率</a>
      		<a  href="javascript:void(0);"  onclick="setValue('chart_type_1','uv',this) ;loadChartData();"  class="btn btn-blue btn-sm" >UV量</a>
      		<a  href="javascript:void(0);"  onclick="setValue('chart_type_1','ip',this) ;loadChartData();"  class="btn btn-blue btn-sm" >IP量</a>
      		
					                                       
					                                       
											</div>   
</div>
					<div class="databox ">
                                 <div class="databox-row row-12">
                                    
                                     <div class="databox-cell cell-2 no-padding padding-10 text-align-center">
                                         <span class="databox-text sky no-margin">展现数</span>
                                         <span class="databox-number orange no-margin" id="showCount"></span>
                                     </div>
                                     <div class="databox-cell cell-2 no-padding padding-10 text-align-center">
                                         <span class="databox-text sky no-margin">点击数</span>
                                         <span class="databox-number orange no-margin" id="clickCount"></span>
                                     </div>
                                     <div class="databox-cell cell-2 no-padding padding-10 text-align-center">
                                         <span class="databox-text sky no-margin">点击率</span>
                                         <span class="databox-number orange no-margin" id="clickRate"></span>
                                     </div>
                                 </div>
                                 
                        </div>
                        <span class="databox-text gray " id="msg" style="float:right;margin-right: 30px;"></span>
                        
                        
                        
						<div class="widget collapsed " style="margin-bottom:5px;">
								<div id="container" style="width:100%;height:300px"></div>	
						</div>
			</div>
			
				<div class="widget collapsed " style="margin-top:5px;margin-bottom:0px">
						<div class="widget-header ">
							<span class="widget-caption">数据列表</span>
							<div class="widget-buttons">
							<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
										<input type="hidden" id="clientTypeList" name="clientType"  >
										<input type="hidden" id="startDateList" name="startDate" >
										<input type="hidden" id="endDateList" name="endDate"  >
										<input type="hidden" id="startDate2List" name="startDate2"  >
										<input type="hidden" id="selectTypeList" name="selectType"  >
										<input type="hidden" id="tableTypeList" name="tableType" value="${tt}" >
										
										<div id="compare_hour" style="display: inline-block; width: auto; ">
										时段:
										<select data-toggle="simplecolorpicker" style="height:30px;margin-top:-2px;" class="form-control  " name="hour1" >
                                           <c:forEach begin="0" end="23" var="i">
                                            	<option value="${i}"   <c:if test="${i==0 }">selected="selected"</c:if> >${i }点</option>
                                            </c:forEach>
                                        </select>至
										<select  data-toggle="simplecolorpicker" style="height:30px;margin-top:-2px;" class="form-control  " name="hour2"  >
                                            <c:forEach begin="0" end="23" var="i">
                                            	
                                            	<option value="${i}"   <c:if test="${i==maxHour }">selected="selected"</c:if> >${i }点</option>
                                            </c:forEach>
                                        </select>
										</div>
										
										ID: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="itemId"  placeholder="">
										名称: <input type="text"  style="height:26px;margin-top:-1px;" class="form-control  " name="itemName"  placeholder="">
										
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
						<div class="widget-body" id="${tableId }1div">
								<table class="table table-condensed table-bordered table-hover " id="${tableId }1">							
								</table>		
						</div>
						<div class="widget-body" id="${tableId }2div">
								<table class="table table-condensed table-bordered table-hover " id="${tableId }2">							
								</table>		
						</div>
				</div>	
			</div>
	</div>
					<!-- END SAMPLE TABLE PORTLET-->
</div>
<script>
function setValue(id,value,node){
	document.getElementById(id).value=value;
	
	document.getElementById(id).name=node.text;
	
	$(node).closest('div.databox-row').find("a.btn").addClass('btn-blue');
	$(node).closest('div.databox-row').find("a").removeClass('btn-warning');
	
	$(node).addClass('btn-warning');
	$(node).removeClass('btn-blue');
	if($(node).parent().parent().hasClass('dropdown-menu')){
		
		$(node).parent().parent().prev('a.dropdown-toggle').removeClass('btn-blue');
		$(node).parent().parent().prev('a.dropdown-toggle').addClass('btn-warning');
	}
}

var _chart_s_1 = null;
var _chart_s_2 = null;

function changeMode(t){
	// 对比
	if(t.checked){
		$('#compare_hour').show();
		$('#date1Div').show();
		$('#date2Div').show();
		$('#selectType_div').show();
		$('#reservationDiv').hide();
		$('#hdDiv').hide();
		
		if(!_chart_s_2){
			_chart_s_2 = chart_opt.series;
		}
		if(!_chart_s_1){
			_chart_s_1 = getChartSeries();
		}
		chart_opt.series=_chart_s_1;
	}
	// 趋势
	else{
		$('#compare_hour').hide();
		$('#date1Div').hide();
		$('#date2Div').hide();
		$('#selectType_div').hide();
		$('#reservationDiv').show();
		$('#hdDiv').show();
		if(!_chart_s_1){
			_chart_s_1 = chart_opt.series;
		}
		if(!_chart_s_2){
			_chart_s_2 = getChartSeries();
		}
		chart_opt.series=_chart_s_2;
	}
	loadChartData();
}
if(!$('#compare_id').is(':checked')){	
	$('#compare_hour').hide();
}
$(document).ready(function() {
	 $('.date-picker').datepicker();
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	
 	var cb = function(start, end, label) {
        $('#reservation span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
        loadChartData();
      };

      var optionSet1 = {
//         startDate: moment().subtract(29, 'days'),
        startDate: moment(),
        endDate: moment(),
//         minDate: '',
//         maxDate: '12/31/2015',
        dateLimit: { days: 60 },
        showDropdowns: true,
        showWeekNumbers: true,
        timePicker: false,
        ranges: {
           '今天': [moment(), moment()],
           '昨天': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
           '最近 7 天': [moment().subtract(6, 'days'), moment()],
           '最近 30 天': [moment().subtract(29, 'days'), moment()],
           '本月 ': [moment().startOf('month'), moment().endOf('month')],
           '上月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        opens: 'left',
        buttonClasses: ['btn btn-default'],
        applyClass: 'btn-sm btn-primary',
        cancelClass: 'btn-sm',
        format: 'YY/MM/DD',
        separator: ' 到 ',
        locale: {
            applyLabel: '确定',
            cancelLabel: '取消',
            fromLabel: '开始',
            toLabel: '结束',
            customRangeLabel: '自定义',
            daysOfWeek: ['日', '一', '二', '三', '四', '五','六'],
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            firstDay: 1
        }
      };
      $('#reservation').daterangepicker(optionSet1,cb);  
 	var cbd1 = function(start, end, label) {
        $('#date1 span').html(start.format('YYYY-MM-DD'));
        loadChartData();
      };
 	var cbd2 = function(start, end, label) {
        $('#date2 span').html(start.format('YYYY-MM-DD'));
        loadChartData();
      };

      var optionSet2 = {
  			singleDatePicker:true,
  	        format: 'YYYY-MM-DD',
  	        locale: {
  	            daysOfWeek: ['日', '一', '二', '三', '四', '五','六'],
  	            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
  	            firstDay: 1
  	        }
  	      };
      $('#date1').daterangepicker(optionSet2,cbd1);  

      $('#date2').daterangepicker(optionSet2,cbd2);  
      
	//look-up 查询条件 会员 

 	

 	$("#findWhere").on('click',function(){
 		$("#findWhere > button").attr('filter-data',null);
		 $("#findWhere").hide();
		 loadChartData();
 	}) 
 	
 	var table_1=false;
 	var table_2=false;
loadChartData = function(pubId,pubName){
	 var findDate=$('#reservation span').text().split(" 至 ");
	 var startDate=findDate[0].trim();
 	 var startDate2=$('#date2 span').text().trim();
	 var endDate=findDate[1].trim();
 	 if($('#compare_id').is(':checked')){
 		startDate=$('#date1 span').text().trim();
 	 }
	 var type=null;
	 var clientType=null;
	 var id=null;
	 if(document.getElementsByName("form-field-radio")[0].checked){
		type=0;
	 }else{
		type=1;
	 }
	 if(document.getElementsByName("form-field-radio1")[1].checked){
		 clientType=1;
	 }else if(document.getElementsByName("form-field-radio1")[2].checked){
		 clientType=2;
	 }else{
		 clientType=0;
	 }
//  <input type="hidden" id="clientTypeList" name="clientType"  >
// 	<input type="hidden" id="startDateList" name="startDate"  >
// 	<input type="hidden" id="endDateList" name="endDate"  >
// 	<input type="hidden" id="startDate2List" name="startDate2"  >
	// 设置列表查询条件
	$('#clientTypeList').val(clientType);
	$('#startDateList').val(startDate);
	$('#endDateList').val(endDate);
	$('#startDate2List').val(startDate2);
	$('#selectTypeList').val($('#chart_type_1').val());

// 	  $("#sample-onehandle").noUiSlider({
//           range: [20, 100],
//           start: 40,
//           step: 20,
//           handles: 1,
//           connect: "lower",
//           serialization: {
//               to: [$("#low"), 'html']
//           }
//       });

	
	 // 设置条件
	 if(pubId){
		 $("#findWhere > button").attr('filter-data',pubId);
		 $("#findWhere > button").html(pubName+'   <i class="fa fa-times"></i>');
		 $("#findWhere").show();
	 }else{
		 var oBtn = function(data,d,all,row){
	 		 var result = [];
	 		var ud="down";
// 			 if(row.row>7){
// 				 ud="up";
// 			 }
				// 自定义按钮组
				
				result.push('<div class=" btn-group drop'+ud+'">'+
						'<a class="btn  btn-xs" href="javascript:loadChartData('+data+',\''+all.${tt}_name+'\');" >'+'报表</a>'+
						'<a class="btn  btn-xs dropdown-toggle" href="javascript:void(0);" data-toggle="dropdown" data-close-others="true">'+
						'<i class="fa fa-angle-'+ud+'"></i></a>'+
						'<ul class="dropdown-menu dropdown-blue pull-right">');
				
				result.push('<li><a data-handler="MODAL" data-title="广告位明细-${ttName}【'+all.${tt}_name+'】" href="${urlPrev}slotList?itemId='+all.${tt}_id+'&tt=${tt}&ttName='+encodeURIComponent('${ttName}')+'"><i class="glyphicon glyphicon-indent-right primary"></i> 广告位明细</a></li>');
				result.push('<li><a data-handler="MODAL" data-title="每日明细-${ttName}【'+all.${tt}_name+'】" href="${urlPrev}dailyList2?itemId='+all.${tt}_id+'&tt=${tt}&ttName='+encodeURIComponent('${ttName}')+'"><i class="glyphicon glyphicon-calendar primary"></i> 每日明细</a></li>');
// 				if('${tt}'=='slot'){
// 					result.push('<li><a data-handler="MODAL" data-title="${ttName}信息【'+all.${tt}_name+'】" href="${ctx }/ssp/config/adSlot/view1?slot_id='+all.${tt}_id+'"><i class="glyphicon glyphicon-info-sign primary"></i> ${ttName}信息</a></li>');
// 					result.push('<li><a data-handler="INLINE"  data-title="修改${ttName}信息【'+all.${tt}_name+'】"   data-form=true  href="${ctx }/ssp/config/adSlot/edit?slot_id='+all.slot_id+'"> <i class="glyphicon glyphicon-edit primary"></i> 修改广告位</a></li>');
// 					result.push('<li><a data-handler="MODAL"  data-title="设置配比【'+all.${tt}_name+'】"   data-form=true  href="${ctx }/ssp/config/adDspPproportion/listPage?typeStr=3&targetIdStr='+all.slot_id+'"> <i class="glyphicon glyphicon-tasks primary"></i> 设置配比</a></li>');
// 				}
// 				if('${tt}'=='pub'){
// 					result.push('<li><a data-handler="MODAL" data-title="${ttName}信息【'+all.${tt}_name+'】" data-handler="MODAL" href="${ctx }/ssp/config/adPub/view?id='+all.id+'"><i class="glyphicon glyphicon-info-sign primary"></i> ${ttName}信息</a></li>');
// 					result.push('<li><a data-handler="INLINE"  data-title="修改${ttName}信息【'+all.${tt}_name+'】"   data-form=true  href="${ctx }/ssp/config/adPub/edit1?pub_id='+all.pub_id+'"> <i class="glyphicon glyphicon-edit primary"></i> 修改${ttName}</a></li>');
					
// 				}
// 				if('${tt}'=='site'){
// 					result.push('<li><a data-handler="MODAL" data-title="${ttName}信息【'+all.${tt}_name+'】" data-handler="MODAL" href="${ctx }/ssp/config/adSite/view?id='+all.id+'"><i class="glyphicon glyphicon-info-sign primary"></i> ${ttName}信息</a></li>');
// 					result.push('<li><a data-handler="INLINE" data-title="修改${ttName}信息【'+all.${tt}_name+'】"  data-form=true  href="${ctx }/ssp/config/adSite/edit1?site_id='+all.site_id+'"> <i class="glyphicon glyphicon-edit primary"></i> 修改${ttName}</a></li>');
// 				}
				
				result.push('</ul></div>');
				return result.join('');
//	 		  	  return '<a class="blue-stripes" href="javascript:loadChartData('+data+',\''+all.${tt}_name+'\');" ">查看数据</a> ';	        
	 	 };
		 
		 // 列表查询
		 if($('#compare_id').is(':checked')){
			 $("#${tableId}2div").hide();
			 $("#${tableId}1div").show();
			 if(!table_1){
				 table_1=true;
				 TableAjax.init('${tableId}1',{
					 sAjaxSource: "${urlPrev }listJSONCompare2",
					 aaSorting: [[4, "desc" ]], // 需要自定义
					 uxUrlPrev:"${urlPrev }",
					 uxDataTitle:"${dataTitle }",
					 uxCheckable:false,
					 uxCloseScroll:true,
					 uxDrapable:false,
					 uxShowTotal:{
						 title:{
							 text:'总计',
							 cols:[
							 	0,1
							 ]
						 },
						 hiddenCols:[6]
					 },
					 aoColumns: [		
							{sTitle:'${ttName}id',  mData: "${tt}_id",bSortable:false,"sWidth": "150px"},			
							{sTitle:'${ttName}名称',  mData: "${tt}_name",bSortable:true,"sWidth": "200px"},					
							{sTitle:'日期1',mData: "ra1" ,"sWidth": "100px",uxNumber:true},
							{sTitle:'日期2',mData: "ra2" ,"sWidth": "100px",uxNumber:true},
							{sTitle:'变化量(日期1-日期2)',mData: "diff",
								mRender:function(data,d,all){
									if(!data){
										data=0;
									}
									var color = data>=0?"red":"green";
						 		  	 return "<span style='color:"+color+";'>"+(data>=0?"+"+Common.toThousands(data):Common.toThousands(data))+"</span>"
						 	 	}
							,"sWidth": "100px",sClass : "ux-number"},
							{sTitle:'变化比例(%)',mData: "rate" ,
								mRender:function(data,d,all){
									if(!data){
										data=0;
									}
									var color = data>=0?"red":"green";
						 		  	 return "<span style='color:"+color+";'>"+(data>=0?"+"+data:data)+"</span>"
						 	 	}
							,"sWidth": "100px",sClass : "ux-number"},
							{sTitle:'操作',
								  mData: "${tt}_id" ,
								  bSortable:false,
							 	  mRender:oBtn
							 	 ,"sWidth": "100px"}
							
				        ]
			 	});
			 }
		 }else{
			 $("#${tableId}1div").hide();
			 $("#${tableId}2div").show();
			 if(!table_2){
				 table_2=true;
				 var otable = TableAjax.init('${tableId}2',{
					 buttons:[{
// 							extend: 'columnsToggle',
							extend: 'colvis',
							collectionLayout: 'fixed two-column',
							columns: ':not(:first-child)'
						}],
					 sAjaxSource: "${urlPrev }listJSONAll2",
					 aaSorting: [[2, "desc" ]], // 需要自定义
					 uxUrlPrev:"${urlPrev }",
					 uxDataTitle:"${dataTitle }",
					 uxCheckable:false,
					 uxCloseScroll:false,
					 uxDrapable:false,
					 uxShowTotal:{
						 title:{
							 text:'总计',
							 cols:[
							 	0,1
							 ]
						 },
						 hiddenCols:[7]
					 },
					 aoColumns: [
					        <c:if test="${tt eq 'creative'}">
							{sTitle:'创意ID',  mData: "${tt}_id",bSortable:false,sWidth:"100px"},			
							{sTitle:'创意名称',  mData: "${tt}_name",bSortable:true,uxCutText:50,sWidth:"150px"},
							</c:if>
					        <c:if test="${tt eq 'source_slot'}">
							{sTitle:'${ttName}ID',  mData: "${tt}_id",bSortable:false,sWidth:"100px"},			
							{sTitle:'${ttName}名称',  mData: "${tt}_name",bSortable:true,uxCutText:50,sWidth:"150px"},
							</c:if>
					        <c:if test="${tt eq 'odsp'}">
							{sTitle:'${ttName}-ID',  mData: "${tt}_id",bSortable:false,sWidth:"100px"},			
							{sTitle:'${ttName}名称',  mData: "${tt}_name",bSortable:true,uxCutText:50,sWidth:"150px"},
							</c:if>
							
							{sTitle:'展示(PV)',mData: "pv" ,uxNumber:true},
							{sTitle:'点击',mData: "cli" ,uxNumber:true},
							{sTitle:'点击率(%)',mData: "rate" ,uxNumber:true},
							{sTitle:'UV',mData: "uv" ,uxNumber:true},
							{sTitle:'IP',mData: "ip" ,uxNumber:true},
							{sTitle:'操作',
								  mData: "${tt}_id" ,
								  bSortable:false,
							 	  mRender:oBtn
							}
							 
				        ]
			 	});
				 
				
			 }
		 }
		 
		 $('#list_query_btn').click();
	 }

	 function compareRate(a,b){
		
     	var p = (((a-b)/b)*100).toFixed(2);
     	if(b==0){
     		p='∞';
     	}
     	var s = '<span style="color:'+(p>=0?'red':'green')+';font-size:11px;">('+(p>=0?"+"+p:p)+'%)</span>';
  
        return s;
	 }
	 // 获取条件
     id= $("#findWhere > button").attr('filter-data');
	 id = id?id:null;
	 $.ajax({
         type: "POST",
         cache: false,
         data:{
        	 itemId:id,
        	 startDate:startDate,
        	 endDate:endDate,
        	 startDate2:startDate2,
//         	 endDate2:endDate2,
        	 type:type,
        	 clientType:clientType,
        	 tableType:'${tt}',
        	 selectType:$('#chart_type_1').val(),
        	 compare:$('#compare_id').is(':checked')
         },
         url: "${urlPrev }count3",
         dataType: "json",
         success: function (data) {
        	 //  刷新图形报表
        	  if($('#compare_id').is(':checked')){
        		
// 	             document.getElementById("requestCount").innerHTML = data.ra+"<br/>"+compareRate(data.ra,data.ra2);
// 	             document.getElementById("requestSuccessCount").innerHTML = data.rs+"<br/>"+compareRate(data.rs,data.rs2);
	             document.getElementById("showCount").innerHTML = data.pv+"<br/>"+compareRate(data.pv,data.pv2);
	             document.getElementById("clickCount").innerHTML = data.cli+"<br/>"+compareRate(data.cli,data.cli2);
// 	             document.getElementById("closeCount").innerHTML = data.clo+"<br/>"+compareRate(data.clo,data.clo2);
	             var clickRate='';
	             if(Math.round(data.cli / data.pv * 10000) / 100.00){
	            	 clickRate=Math.round(data.cli / data.pv * 10000) / 100.00 ;
	             }
	             var clickRate2=0;
	             if(Math.round(data.cli2 / data.pv2 * 10000) / 100.00){
	            	 clickRate2=Math.round(data.cli2 / data.pv2 * 10000) / 100.00 ;
	             }
	             
	             document.getElementById("clickRate").innerHTML = clickRate+"<br/>"+compareRate(clickRate,clickRate2);
	             
        	  }else{
//         		 document.getElementById("requestCount").innerText = data.ra;
//  	             document.getElementById("requestSuccessCount").innerText = data.rs;
 	             document.getElementById("showCount").innerText = data.pv;
 	             document.getElementById("clickCount").innerText = data.cli;
//  	             document.getElementById("closeCount").innerText = data.clo;
 	             var clickRate='--';
 	             if(Math.round(data.cli / data.pv * 10000) / 100.00){
 	            	 clickRate=Math.round(data.cli / data.pv * 10000) / 100.00 + "%";
 	             }
 	             document.getElementById("clickRate").innerText = clickRate; 	
        	  }
             
        	  if(data.maxHour){
		            document.getElementById("msg").innerHTML = "以上汇总数据为 0点 --"+data.maxHour+"点(包含)的数据";
	           }else{
	        	    document.getElementById("msg").innerHTML = " ";
	           }
        	 loadChartHourData(data,$('#compare_id').is(':checked'));     
         },
         error: function (xhr, ajaxOptions, thrownError) {
         },
         async: false
     });

 }
 	function toThousands(num) {
	    return (num || 0).toString().replace(/(\d)(?=(?:\d{3})+$)/g, '$1,');
	}
 	
var chart_opt = {                                          
			chart: {
				 backgroundColor: '#fbfbfb'
	        },                                                                    
			title: {                                                          
				text: ''                                
			}, 
			colors:[
				'#FB6E52','#4572A7', '#89A54E', '#80699B', '#3D96AE', 
				   '#DB843D', '#92A8CD', '#A47D7C', '#B5CA92'
			],
			xAxis: { 
				showLastLabel:true,
				tickLength:10,
				tickInterval:data.XSTEP,
				overflow:'justify',
				 tickmarkPlacement: 'on',
//			    categories: eval(xMessage),
				labels:{
				//	staggerLines:1,
				//	step:eval(xsetp), 
				//	align:0
				}     
	          
			}, credits: {
			     enabled: false
			},
			yAxis: {
				title : { 
					text : '' 
				}, 
				min: 0, 
				plotLines : [ { 
					value : 0, 
					width : 1, 
					color : '#808080' 
				} ] 
			},
			series: compare?[{                                                                                                      
//				name: '时段1',   
				color: 'orange',
				zIndex:1                        
			},{                                                                                                      
//				name: '时段2',   
				color: '#2DC3E8',
				zIndex:0                       
			}]:[
//			         {name: '请求',visible:true},
			         {name: '展示',visible:true},
			         {name: '点击',visible:true},
			         {name: '点击率',visible:true},
//			         {name: '关闭',visible:false},
//			         {name: '域名黑名单',visible:false},
//			         {name: '广告位策略',visible:false},
//			         {name: '防作弊',visible:false},
//			         {name: '文档尺寸异常',visible:false},
//			         {name: '空物料',visible:false},
//			         {name: '其他',visible:false},
			         {name: 'UV',visible:true},
			         {name: 'IP',visible:true}
			
			],
			tooltip: {  
			                backgroundColor: '#F8F8F8',   //背景颜色
			                borderColor: '#FCFFC5' ,     //边框颜色
			                borderRadius: 2,             //边框的圆角大小
			                borderWidth: 1,               //边框宽度(大小)
			                enabled: true,             //是否显示提示框
			                shadow: true,              //提示框是否应用阴影  ?没有看出明显效果?????????
			                shared: true,               //当打开这个属性，鼠标几个某一区域的时候，如果有多条线，所有的线上的据点都会有响应
			                crosshairs: {                 //交叉点是否显示的一条纵线
			                    width: 2,
			                    color: 'gray',
			                   dashStyle: 'shortdot'
			                },
			                style: {  //提示框内容的样式
			                    color: '#000000',
			                    padding: '10px',    //内边距 (这个会常用到)
			                    fontSize: '9px'            
			                },
			                formatter: compare? function () {
			                	//<span style="color:{series.color}">●</span> {series.name}: <b>{point.y}</b><br/>
			                	var s = '<b>' + this.points[0].key +  '</b>';
			        
			                	if(this.points.length==2){
			                		
				                	var a = this.points[0].y;
				                	var b = this.points[1].y;
				                	var p = (((a-b)/b)*100).toFixed(2);
				                	if(b==0){
				                		p='∞';
				                	}
				                	
				                    s+='【<span style="margin-left:10px;"> '+(p>=0?'<span style="color:red;">+':'<span style="color:green;">')+p+'%</span></span>】';
			                	}

			                    $.each(this.points, function () {
			                        s += '<br/>' + '<span style="color:'+this.series.color+'">●</span> '+this.series.name+': <b>'+toThousands(this.point.y)+'</b><br/>';
			                    });
								
			                    return s;
			                }:null
			},                                                             
			data:{
				rows:data.chart_data,
				firstRowAsNames: true
			}                                                                   
		};
loadChartHourData = function(data,compare){
		$('#container').highcharts(chart_opt);
}
 setTimeout(loadChartData,200)                                        
});                           
</script>