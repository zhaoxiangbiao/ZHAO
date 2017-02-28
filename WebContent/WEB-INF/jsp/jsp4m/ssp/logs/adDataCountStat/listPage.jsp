<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adDataCountStat/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADDATACOUNTSTAT_" ></c:set>
<c:set scope="page" var="dataTitle" value="收入报表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adDataCountStat_1" ></c:set>
<%
SimpleDateFormat today =   new SimpleDateFormat( "yyyy-MM");
SimpleDateFormat today1 =   new SimpleDateFormat( "yyyy-MM-dd");
String newDate=today.format(new Date());
Calendar theCa = Calendar.getInstance();
theCa.setTime(new Date());
Date date = theCa.getTime();
String month=today.format(date);
request.setAttribute("month", month);
Calendar theCa1 = Calendar.getInstance();
theCa1.add(theCa1.DATE,   -2);
Date date1 = theCa1.getTime();
String yesterday=today1.format(date1);
request.setAttribute("yesterday", yesterday);


%>

<div class="data-div">

	
    <!-- 收入概览 -->
		<div   style="background: #fff; cursor: pointer; border: 0px solid #ccc;padding: 5px 5px;align-right: 10px;line-height:16px;">		
				<div class="widget-buttons">	
		           	<input placeholder='' value="${yesterday}" class="form-control date-range-picker " id="countDay" name="countDay"  type="text" />
		        </div>
		        <button onClick="javascript:getCountDay();" class="btn btn-blue btn-xs search"  data-title="查询" data-form="false">查询</button>			 
				总收入<span id="sumIncomeYesterday" ></span>元
		</div>
<div class="row">
        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
      
            <div class="databox databox-xxlg databox-vertical databox-shadowed bg-white radius-bordered padding-5">
                
                		
					
                <div class="databox-bottom">
                  		
                       <div id="container" style="min-width:200px;height:280px"></div>
                  
                </div>
                
            </div>
        </div>
        
<!-- 7日收入趋势 -->
        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
            <div class="databox databox-xxlg databox-vertical databox-shadowed bg-white radius-bordered padding-5">      
                <div class="databox-bottom">
                	<div class="databox-row row-12">
                       	<div id="container2" style="width:700px;height:280px"></div>	
                    </div>
                </div>
            </div>
        </div>
</div>
			
			 			<div   style="background: #fff; cursor: pointer; border: 0px solid #ccc;padding: 5px 5px;align-right: 10px;line-height:16px;">		
								<div class="widget-buttons">	
                                       <div id="reservation-js"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 5px 10px;line-height:16px;">
						                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
						                  <span >${yesterday} 至   ${yesterday}</span> <b class="caret"></b>
						            </div>    
			                   	</div>
			                   	<input id="-id-datetime_js" type="hidden"  value="${yesterday} 至   ${yesterday}" />
			                   	 <button onClick="javascript:getJsCount();" class="btn btn-blue btn-xs search"  data-title="计算" data-form="false">计算</button>			 
						</div>
			 
			 

<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					 
					<div class="widget collapsed " style="margin-bottom:5px;">
			<div class="widget-header ">
				<span class="widget-caption">
				<span id="dateFind">
				
				</span>
				总收入
				<span id="sumIncome" >
				
				</span>元（媒体分成： <span id="lastIncome"></span>元，平台服务费： <span id="serviceIncome"></span>元）
				</span>
                  <div class="widget-buttons">
                        
                        <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="广告来源" data-form="true" onclick="javascript:thisDate();">查询</button>
                        <a href="#" data-toggle="collapse">
                            <i class="fa blue fa-plus"></i>
                        </a>
                    </div>
                  <div class="widget-buttons buttons-bordered">
								<sec:authorize ifAllGranted="${rolePrev }NEW">
									<button href="/ssp/logs/adSourceData/summarizationOfData" class="btn btn-palegreen btn-xs " 
									 data-handler="INLINE" data-title="收入数据录入" data-form=true>
										收入数据录入
									</button>
 								</sec:authorize>
							</div>
						</div>
						
						<div class="widget-body">
						
						<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
								
						<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">日期</label>
							<div class="col-sm-8">
							<input type="text" name="" id="picker_statdate" value="${month }" readonly="true"/>
							
							<input id="-id-datetime_time" type="hidden" name="datetime_stat_date" value="${month } 至   ${month }" />				
							
						</div>
						</div>
						</form>
						</div>
						</div>
						
						
						<div class="widget no-header ">
			
			<div class="widget-body">
						<table class="table table-condensed table-bordered table-hover " id="${tableId }">
						</table>
							
						</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
</div>
</div>
	<!-- END ROW CONTENT-->
		

<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	
	$('#picker_statdate').datePicker({
		followOffset:[0, 24],
		altFormat : 'yyyy-mm',
		showMode : 1
	});
	
	 $('.date-picker').datepicker();
	 	var cb = function(start, end, label) {
	        $('#reservation-js span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
	        $('#-id-datetime_js').val(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
	       // loadChartData();
	      };

	      var optionSet1 = {
//	         startDate: moment().subtract(29, 'days'),
	        startDate: moment(),
	        endDate: moment(),
//	         minDate: '',
	         maxDate: moment().subtract(0, 'days'),
	        dateLimit: { days: 365 },
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
	        buttonClasses: ['btn btn-green'],
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
	      $('#reservation-js').daterangepicker(optionSet1,cb);  
	      
	getJsCount = function(){ 
	    var findDate = $('#reservation-js span').text().split(" 至");
	    var startDate = findDate[0];
	    var endDate = findDate[1];
  	   	$.ajax({
              type: "POST",
              cache: false,
              data:{
             	 startDate:startDate,
             	 endDate:endDate
            	 },
              url: "${urlPrev }getCountJS",
              dataType: "json",
              success: function (data) {
             	 //  刷新图形报表
             	 console.log(data);
             	 
      			document.getElementById("sumIncome").innerText = data.SUMINCOME;
      			document.getElementById("lastIncome").innerText = data.LASTINCOME;
      			document.getElementById("serviceIncome").innerText = data.SERVICEINCOME;
                
              },
              error: function (xhr, ajaxOptions, thrownError) {
              },
              async: false
          });
	}
	thisDate = function(){
		 var yearMonth=$('#picker_statdate').val().split("-");
		 var year=yearMonth[0];
		 var month=yearMonth[1];
		var  day = new Date(year,month,0);
		
    	$('#-id-datetime_time').val( $('#picker_statdate').val()+'-01'+'至'+ year+'-'+month+'-'+day.getDate());
    	document.getElementById("dateFind").innerText = $('#picker_statdate').val()+'月';
    	var startDate=$('#picker_statdate').val()+'-01';
    	var endDate=year+'-'+month+'-'+day.getDate();
    	$.ajax({
            type: "POST",
            cache: false,
            data:{
           	 startDate:startDate,
           	 endDate:endDate
          	 },
            url: "${urlPrev }sumInComeCount",
            dataType: "json",
            success: function (data) {
           	 //  刷新图形报表
           	 console.log(data);
           	 
    			document.getElementById("sumIncome").innerText = data.SUMINCOME;
    			document.getElementById("lastIncome").innerText = data.LASTINCOME;
    			document.getElementById("serviceIncome").innerText = data.SERVICEINCOME;
              
            },
            error: function (xhr, ajaxOptions, thrownError) {
            },
            async: false
        });
	}
	thisDate();
	//look-up 查询条件 会员 
	Select2Ex.handleForm4select2({target:$("#form_${tableId }")});	

 TableAjax.init('${tableId}',{
	 sAjaxSource: "${urlPrev }listJSON",
	 aaSorting: [[0, "desc" ]], // 需要自定义
	 uxUrlPrev:"${urlPrev }",
	 uxDataTitle:"${dataTitle }",
	 uxCheckable:false,
	 uxCloseScroll:true,
	 uxDrapable:false,
	 aoColumns: [
			{sTitle:'日期',  mData: "stat_date" , mRender: Common.formatDate},					
			{sTitle:'总收入',  mData: "income",uxLongText:true},				
			{sTitle:'媒体分成',  mData: "last_income",uxLongText:true},				
			{sTitle:'平台服务费',  mData: "service_income",uxLongText:true},		        
			{sTitle:'操作',
				  mData: "stat_date" ,
			 	  mRender:function(data,d,all){
				 		  	  return '<a class="blue-stripes" data-handler="MODAL" style="margin:20px"  href="${ctx }/ssp/logs/adDataPubStatDay/configManager?statDate='+Common.formatDate(all.stat_date)+'">详情</a>';
				 		  			
			 	  }
			 }
        ]
	           
 });
 loadChartData = function(){
		/*  var startDate=findDate[0];
		 var endDate=findDate[1]; */
		// var today = new Date();  
		 var s=new Date().format('yyyy-MM-dd'); 
		 var date=new Date(Date.parse(s));  
		 
		var startDate=new Date((+date)-24*3600*1000*6).format('yyyy-MM-dd').toLocaleString();
   	 	var endDate= s;
		var statDate=new Date((+date)-24*3600*1000).format('yyyy-MM-dd').toLocaleString()

		 $.ajax({
	         type: "POST",
	         cache: false,
	         data:{
	        	 statDate:statDate,
	        	 startDate:startDate,
	        	 endDate:endDate
	       	 },
	         url: "${urlPrev }count",
	         dataType: "json",
	         success: function (data) {
	        	 //  刷新图形报表
	        	 console.log(data);
	           	 

	           	 loadChartHourData(data.SEVENDAY,data.XMESSAGE); 
	         },
	         error: function (xhr, ajaxOptions, thrownError) {
	         },
	         async: false
	     });

 }

 getCountDay = function(){ 
		var statDate=$('#countDay').val();
	//	alert(statDate);
		 $.ajax({
	         type: "POST",
	         cache: false,
	         data:{
	        	 statDate:statDate
	       	 },
	         url: "${urlPrev }getBCountDay",
	         dataType: "json",
	         success: function (data) {
	        	 //  刷新图形报表
	        	 console.log(data);
	           	
	        	 document.getElementById("sumIncomeYesterday").innerText=data.sumIncomeYesterday;
	        	 if(data.BMESSAGE!="0"){
		        	 loadChartHourDataB(data.BMESSAGE);
	        	 }
	         },
	         error: function (xhr, ajaxOptions, thrownError) {
	         },
	         async: false
	     });

}

 loadChartHourData = function(sumIncome,xMessage){
			$('#container2').highcharts({                                          
			chart: {
				 backgroundColor: '#fbfbfb'
	        },                                                                    
			title: {                                                          
				text: '7日收入趋势'                                
			},                                                                
			xAxis: { 
				showLastLabel:true,
				tickLength:10,
				tickInterval:0,
				overflow:'justify',
				 tickmarkPlacement: 'on',
			    categories: eval(xMessage),
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
					text : '次数' 
				}, 
				min: 0, 
				plotLines : [ { 
					value : 0, 
					width : 1, 
					color : '#808080' 
				} ] 
			},
			  plotOptions: {
		          spline: {
		              lineWidth: 4,
		              states: {
		                  hover: {
		                      lineWidth: 5
		                  }
		              },
		              marker: {
		                  enabled: false
		              }
		          }
		      },
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
			                }
			},                                                             
			series: [{                                                                                                      
				name: '收入',   
				color: '#2DC3E8',
				data: eval(sumIncome)                             
			}		
			]                                                                         
		});
  }
 loadChartHourDataB = function(sumIncome){
	 
		// alert(sumIncome);
	    $('#container').highcharts({
    	   chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
	        title: {
	            text: '收入概览'
	        },
	        tooltip: {
	    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        credits: {  
	        	  enabled: false  
	        	},  
	        plotOptions: {
	        	 pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: false
	                    },
	                    showInLegend: true
	                }
	        },
	        series: [{
	            type: 'pie',
	            name: '收入占比',
	            data:eval(sumIncome)
	        }]
	    });
  }
 loadChartData();
 getCountDay();
});
$('.date-range-picker').datepicker();

</script>
