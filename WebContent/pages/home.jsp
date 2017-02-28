<%@page import="org.ever4j.utils.AdDateUtil"%>
<%@page import="org.ever4j.utils.TimeUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<%
SimpleDateFormat today =   new SimpleDateFormat( "yyyy-MM-dd");
String newDate=today.format(new Date());
String date2 = AdDateUtil.getYesterday("yyyy-MM-dd");
request.setAttribute("today", newDate);
request.setAttribute("date2", date2);
%>
<style type="text/css">
    .flash-middle{
        position: relative;
        left: 50%;
        margin-left: -300px;
    }
    .map-title{
        font-size: 20px;
        padding: 10px;
        height:40px;
    }

    .logo-pos{
        position: absolute;
        right: 25px;
        bottom: 10px;
    }
    .databox .databox-text{
        white-space: nowrap;
    }
    .relative{
        position: relative;
    }
    #visitors-chart{
    	height:250px
    }
    
</style>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding">

    <!-- 头部显示数量 -->
<!--         <div class="databox databox-xxlg" style="height:110px;"> -->
        
<!--             <div class="databox-top bg-whitesmoke no-padding" style="height: 130px"> -->
<!--                 <div class="databox-row  bg-orange no-padding" style="height: 40px"> -->
<!--                     <div class="databox-cell cell-1 text-align-left no-padding padding-top-5 padding-left-5"> -->
<!--                         <span class="databox-number white"> <i class="fa fa-bar-chart-o no-margin"></i> &nbsp;总览 -->
<!--                         </span> -->
<!--                         <span class="databox-number white"></span> -->
<!--                     </div> -->
<!--                     <div class="databox-cell cell-8 no-padding padding-top-5 text-align-left"> -->
<!--                     </div> -->
<!--                     <div class="databox-cell cell-3 text-align-right padding-10"> -->
<!--                         <span class="databox-text white" id="todayTime"></span> -->
<!--                     </div> -->
<!--                 </div> -->
<!--           <div class="databox-row " style="height: 92px"> -->
<!-- 				<div -->
<!-- 					class="databox-cell cell-2 no-padding padding-10  text-align-left"> -->
<!-- 					<span id="requestSum" class="databox-number orange no-margin" -->
<!-- 						style="font-size: 30px; line-height: 50px;"></span> <span id="ccc" -->
<!-- 						class="databox-text sky no-margin">历史总推送量</span> -->
<!-- 				</div> -->

<!-- 				<div -->
<!-- 					class="databox-cell cell-2 no-padding padding-10 text-align-left"> -->
<!-- 					<span id="requestSumToday" class="databox-number orange no-margin" -->
<!-- 						style="font-size: 20px; line-height: 50px;"></span> <span -->
<!-- 						id="loseRate" class="databox-text sky no-margin">推送量</span> -->
<!-- 				</div> -->
<!-- 				  <div class="databox-cell cell-2 no-padding padding-10 text-align-left"> -->
<!--                      	<span id="uvSumToday" class="databox-number orange no-margin" style="font-size:20px;line-height:50px;"></span> -->
<!--                         <span class="databox-text sky no-margin">用户量(UV)</span> -->
<!--                     </div> -->
<!-- 				<div -->
<!-- 					class="databox-cell cell-2 no-padding padding-10 text-align-left"> -->
<!-- 					<span id="showSumToday" class="databox-number orange no-margin" -->
<!-- 						style="font-size: 20px; line-height: 50px;"></span> <span -->
<!-- 						class="databox-text sky no-margin">展示量(PV)</span> -->
<!-- 				</div> -->
<!-- 				<div -->
<!-- 					class="databox-cell cell-2 no-padding padding-10 text-align-left"> -->
<!-- 					<span id="clickSumToday" class="databox-number orange no-margin" -->
<!-- 						style="font-size: 20px; line-height: 50px;"></span> <span -->
<!-- 						id="clickRate" class="databox-text sky no-margin">点击量</span> -->
<!-- 				</div> -->
<!-- 				<div -->
<!-- 					class="databox-cell cell-2 no-padding padding-10 text-align-left"> -->
<!-- 					<span id="closeRate" class="databox-number orange no-margin" -->
<!-- 						style="font-size: 20px; line-height: 50px;"></span> <span -->
<!-- 						class="databox-text sky no-margin">关闭量</span> -->
<!-- 				</div> -->
<!-- 			</div> -->



<!-- 		</div> -->

<!-- 	</div> -->
    <!--   中间div -->
<!--  <div class="databox-row no-padding " style="height: 35px;margin-top: 20px;"> -->
<!--  			<p class="map-title" id="chart_title_1"> -->
<!--             <i class="typcn typcn-chart-pie"></i> -->
<!--             &nbsp;客户端(PV量)和近两日各任务对比统计 -->
<!--         </p> -->
<!--  </div>    -->
</div>
                <div class=" bg-white col-sm-12" style="">
                    <div class="col-lg-12">
                        <div id="container1" style="width:100%;height:340px"></div>
                    </div>
<!--                     <div class="col-lg-6"> -->
                     					
<!-- 							<div id="container2" style="width:100%;height:380px"></div>                 -->
<!--                     </div> -->
                </div>
    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<table id="datatables" style="display: none;">
    <thead >
        <tr id="datatable1"></tr>
    </thead>
    <tbody >
        <tr id="datatable2"></tr>
        <tr id="datatable3"></tr>
        <tr id="datatable4"></tr>
        <tr id="datatable5"></tr>
        <tr id="datatable6"></tr>
    </tbody>
</table>
    
     <!-- 三个饼图 -->
    <%-- <div class="col-sm-12 bg-white " style="margin-top: 10px;overflow:hidden"  >
    	<p class="map-title" id="chart_title_1">
            <i class="typcn typcn-chart-pie"></i>
            &nbsp;客户端信息统计(PV量)
        </p>
        
        <div class="databox-row no-padding" style="height:35px">
            <div style="float: right;">
            <div class="widget-buttons">	
                                      <div id="pie_date"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 2px 10px 6px 10px;line-height:16px;">
					                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
					                  <span>${today }</span> <b class="caret"></b>
					            </div>        
                   		</div>
                   		
      		<input id="chart_type_2" style="display: none;" value="pv" name="PV量"></input>
                   		<a  href="javascript:void(0);"  onclick="setValue('chart_type_2','pv',this) ;loadChartPie();"  class="btn btn-warning btn-sm" >PV量</a>
                   		<a  href="javascript:void(0);"  onclick="setValue('chart_type_2','uv',this) ;loadChartPie();"  class="btn btn-blue btn-sm" >UV量</a>
			</div>  
        
        </div>
    <!-- PC终端操作系统 -->
        <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
        	<div id="container3" style="min-width:300px;height:300px"></div>
        </div>
<!-- PC终端浏览器 -->
        <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
            <div id="container5" style="min-width:300px;height:300px"></div>
        </div>
<!-- 移动终端 -->
        <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
           	<div id="container4" style="min-width:300px;height:300px"></div>
        </div>
    </div> --%>
    
    <!-- 地理分布图 -->
   <%--  <div class="col-sm-12 bg-white " style="margin-top: 10px;">
        <p class="map-title" id="chart_title_2">
            <i class="typcn typcn-location-outline"></i>
            &nbsp;地理分布图 (PV量)
			 <div class="databox-row no-padding" style="height:35px">		
			<div style="float: right;">
						<div class="widget-buttons">	
                                      <div id="map_date"  style="background: #fff; cursor: pointer; border: 1px solid #ccc;padding: 2px 10px 6px 10px;line-height:16px;">
					                  <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
					                  <span>${today }</span> <b class="caret"></b>
					            </div>        
                   		</div>
                   		<input id="chart_type_3" style="display: none;" value="pv" name="PV量"></input>
                   		<a  href="javascript:void(0);"  onclick="setValue('chart_type_3','pv',this) ;loadMapData();"  class="btn btn-warning btn-sm" >PV量</a>
                   		<a  href="javascript:void(0);"  onclick="setValue('chart_type_3','uv',this) ;loadMapData();"  class="btn btn-blue btn-sm" >UV量</a>
                   		<a  href="javascript:void(0);"  onclick="setValue('chart_type_3','ip',this) ;loadMapData();"  class="btn btn-blue btn-sm" >IP量</a>
			</div>  
			</div>                                
								 	  
        </p>
        <div class="">
            <div id="main" style="height: 508px; width: auto; border: 0px solid #ccc; padding: 10px;">
        </div>
        <img class="logo-pos" src="${ctx}/img/spirite/logo-blue.png">
       	</div>
     </div>   --%>	
   
</div>

<script type="text/javascript">
String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
}
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
// 	_GLOBAL.setInterval(function(){
// 		loadChartData2();loadChartData1();
// 	},60*1000*5);
	var loadMapData;
	var loadChartData2;
	var loadChartData1;
	jQuery(document).ready(function() {
		//在页面加载的时候向那adRequestStatDayAction异步发请求，获取累计请求总次数request
						var getAllRequestCount = function() {
							$.ajax({
								url : "../../everad/logs/lcAll/ajaxRequest",
								type : "get",
								cache : false,
								dataType : "json",
								success : function(data) {
									data = eval("(" + data + ")");
									$("#requestSum").text(
											data.requestCountHistoryAll);
									$("#requestSumToday").text(
											data.rsCountToday);
									$("#showSumToday").text(data.showRate);
									$("#clickSumToday").html(data.clickRate);
									$("#uvSumToday").text(data.uvSumToday); 
									// $("#clickSumToday").html(data.clickRate+"<span style='font-size:15px;color:#369;'>("+data.clickRate+")</span>");
									$("#closeRate").text(data.closeRate);
									//$("#clickRate").html("点击(<span class='orange'>"+ data.clickRate+ "</span>)");

								}
							});
						}
						getAllRequestCount();
						_GLOBAL.setInterval(getAllRequestCount, 3000);
			//加载近七日数据
			$.ajax({          
	            url:"/ssp/logs/adRequestStatDay/ajaxRequestChart",
	            type : "get",    
	            cache : false,    
	            dataType : "json", 
	            data:{
					
				},
	            success : function(data){  
	            	loadChartHourData12(data.xCharts,data.yCharts,data.tname);
	          	}  
	      	});
			$.ajax({          
	            url:"/ssp/logs/adRequestStatDay/ajaxRequestChart2",
	            type : "get",    
	            cache : false,    
	            dataType : "json", 
	            success : function(data){
	            	//alert(data.yCharts.pvname);
	            	var top = data.xCharts;
	            	$("#datatable1").append("<th></th>");
	            	//alert(top.length);
	            	for (var int = 0; int < top.length; int++) {
	            		$("#datatable1").append("<th>"+top[int]+"</th>");
					}
	            	$("#datatable2").append("<th>"+data.yCharts.rsname+"</th>");
	            	for (var int = 0; int < data.yCharts.rs.length; int++) {
	            		$("#datatable2").append("<td>"+data.yCharts.rs[int]+"</td>");
					}
	            	$("#datatable3").append("<th>"+data.yCharts.pvname+"</th>");
	            	for (var int = 0; int < data.yCharts.pv.length; int++) {
	            		$("#datatable3").append("<td>"+data.yCharts.pv[int]+"</td>");
					}
	            	$("#datatable4").append("<th>"+data.yCharts.uvname+"</th>");
	            	for (var int = 0; int < data.yCharts.uv.length; int++) {
	            		$("#datatable4").append("<td>"+data.yCharts.uv[int]+"</td>");
					}
	            	$("#datatable5").append("<th>"+data.yCharts.cliname+"</th>");
	            	for (var int = 0; int < data.yCharts.cli.length; int++) {
	            		$("#datatable5").append("<td>"+data.yCharts.cli[int]+"</td>");
					}
	            	$("#datatable6").append("<th>"+data.yCharts.cloname+"</th>");
	            	for (var int = 0; int < data.yCharts.cli.length; int++) {
	            		$("#datatable6").append("<td>"+data.yCharts.clo[int]+"</td>");
					}
	            	loadChartHourData13();
				}  
	      	});
			
		
		//初始化今日广告总请求24小时分布曲线图highCharts数据
		 loadChartData2 = function(){
				var type = $('#chart_type_1').val();
				var tname = $('#chart_type_1').attr('name');
			var date = $('#today_hour_date span').text();
			$.ajax({
				url : "/ssp/logs/adCount/ajaxAdCount",				
				type : "get",
				cache : false,
				dataType : "json",
				data:{
					type:type,
					date2:date
				},
				success : function(data){
					loadChartHourData2(data.xChart,data.yChart,data.yChart2,type,date,tname);
				}
			});
		}
		
		
		
		loadChartPie = function(){
			var type = $('#chart_type_2').val();
			var tname = $('#chart_type_2').attr('name');
			var date = $('#pie_date span').text();
			$('#chart_title_1').html('<i class="typcn typcn-chart-pie"></i>&nbsp; 客户端信息统计('+tname+')');
			
			loadChartData3(type,date,tname);
			loadChartData4(type,date,tname);
			loadChartData5(type,date,tname);
		}
		
		//PC终端操作系统highCharts数据
		var loadChartData3 = function(type,date,tname){

			$.ajax({
				url : "/ssp/logs/adOsStatAll/ajaxPcOSproportion" ,
				type : "get" ,
				cache : false ,
				dataType : "json" ,
				data:{
					type:type,
					date:date
				},
				success : function(data){
					loadChartHourData3(data.pcOsPro,type,tname);
				}
			});
		} 
		
		//移动终端操作系统highCharts数据
		var loadChartData4 = function(type,date,tname){
		
			$.ajax({
				url : "/ssp/logs/adOsStatAll/ajaxMobileOSproportion" ,
				type : "get" ,
				cache : false ,
				dataType : "json" ,
				data:{
					type:type,
					date:date
				},
				success : function(data){
					loadChartHourData4(data.mobileOsPro,type,tname);
				}
			});
		}

		
		//PC终端浏览器HighCharts数据
		var loadChartData5 = function(type,date,tname){
			
			$.ajax({
				url : "/ssp/logs/adBrowserStatAll/ajaxPcBrowserChart" ,
				type : "get" ,
				cache : false ,
				dataType : "json" ,
				data:{
					type:type,
					date:date
				},
				success : function(data){
					loadChartHourData5(data.pcBrowserPro,type,tname);
				}
			});
		}
		
		//eChart地图数据
		loadMapData = function(){
			var type = $('#chart_type_3').val();
			var tname = $('#chart_type_3').attr('name');
			var date = $('#map_date span').text();
			$('#chart_title_2').html('<i class="typcn typcn-location-outline"></i>&nbsp;地理分布图 ('+tname+')');
			$.ajax({
				url : "/ssp/logs/adUvStatDay/ajaxMapData" ,
				type : "get" ,
				cache : false ,
				dataType : "json" ,
				data:{
					type:type,
					date:date
				},
				success : function(data){
					DrawEChart(data.pro,data.cities,data.uvYestoday,data.ipYestoday,type,data.pvYestoday,tname);
				}
			});
		}
		
		
			
		
		//近七日pv量折线图
		function loadChartHourData12(xCharts,yCharts,tname) {
			
		    $('#container1').highcharts({
		        chart: {
		            zoomType: 'x',
		            spacingRight: 20
		        },
		        title: {
		            text: '最近七日'+tname+"趋势"
		        },
		        xAxis: {
				    categories: eval(xCharts)
				    ,tickInterval:2
				   
		        },
		        yAxis: {
		        	 title: {
		                 text: '单位(次)'
		             },
		             labels: {
		                 formatter: function() {
		                     return this.value / 10000 +'W';
		                 }
		             },
		             allowDecimals: false,        //控制数轴是否显示小数。
		             min: 0,                                //控制数轴的最小值
		        },
		        tooltip: {
		            shared: true,
		            xDateFormat: '%Y-%m-%d',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	                '<td style="padding:0"><b>{point.y:f} 次</b></td></tr>',
		        },
		        legend: {
		            enabled: false
		        },
		        plotOptions: {
		            area: {
		                fillColor: {
		                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
		                    stops: [
		                        [0, Highcharts.getOptions().colors[0]],
		                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
		                    ]
		                },
		                	lineWidth: 1,
			                marker: {
			                    enabled: false
			                },
			                shadow: false,
			                states: {
			                    hover: {
			                        lineWidth: 1
			                    }
			                },
		               
		                threshold: -2
		            }
		        },

		        series: [{
		           /*  type: 'area', */
		            name : tname,
		            data: eval(yCharts)
		        }]
		    });
		};	
		function loadChartHourData13() {
			$('#container2').highcharts({
		        data: {
		            table: 'datatables'
		        },
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: '近两日各任务总统计对比'
		        },
		        yAxis: {
		        	labels: {
		                 formatter: function() {
		                     return this.value / 10000 +'W';
		                 }
		             },
		            allowDecimals: false,
		            title: {
		                text: '单位(次)'
		            }
		        },
		        tooltip: {
		            formatter: function () {
		                return '<b>' + this.series.name + '</b><br/>' +
		                    this.point.y + ' ' + this.point.name.toLowerCase();
		            }
		        }
		    });
			
		};
			
			
			//异网结束
		function toThousands(num) {
		    return (num || 0).toString().replace(/(\d)(?=(?:\d{3})+$)/g, '$1,');
		}
		var loadChartHourData2 = function(xCharts,yCharts,yCharts2,type,date,tname){
			
			$('#container2').highcharts({                                          
	 			chart: {
// 					 backgroundColor: '#fbfbfb'
		        },                                                                    
				title: {                                                          
					text: "今日"+tname+"趋势(对比"+date+")"                               
				},                                                                
				xAxis: { 
					showLastLabel:true,
					tickLength:10,
					tickInterval:2,
					overflow:'justify',
					 tickmarkPlacement: 'on',
				    categories: eval(xCharts),
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
// 				                backgroundColor: '#F8F8F8',   //背景颜色
				                borderColor: '#FCFFC5' ,     //边框颜色
				                borderRadius: 2,             //边框的圆角大小
				                borderWidth: 1,               //边框宽度(大小)
				                enabled: true,             //是否显示提示框
				                shadow: true,              //提示框是否应用阴影  ?没有看出明显效果?????????
				                shared: true,               //当打开这个属性，鼠标几个某一区域的时候，如果有多条线，所有的线上的据点都会有响应
				                crosshairs: {                 //交叉点是否显示的一条纵线
				                    width: 2,
// 				                    color: 'gray',
				                   dashStyle: 'shortdot'
				                },
				                style: {  //提示框内容的样式
				                    color: '#000000',
				                    padding: '10px',    //内边距 (这个会常用到)
				                    fontSize: '9px'            
				                },
				                formatter: function () {
				                	//<span style="color:{series.color}">●</span> {series.name}: <b>{point.y}</b><br/>
				                	var s = '<b>' + this.x +  '</b>';
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
				                }
				},                                                             
				series: [
				 	
				{                                                                                                      
					name: '${today}',   
					color: 'orange',
					zIndex:1,
					data: eval(yCharts)                             
				},{                                                                                                      
					name: date,   
					color: '#2DC3E8',
					zIndex:0,
					data: eval(yCharts2)                             
				}
				]                                                                         
			});
		  }
		
		var loadChartHourData3 = function (pro,type,tname) {
		    	// Build the chart
		        $('#container3').highcharts({
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false
		            },
		            title: {
		                text: 'PC终端操作系统('+tname+")"
		            },
		            tooltip: {
		        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
		                name: tname+"份额",
		                data: eval(pro)
		            }]
		        });
		}
		
		var loadChartHourData4 = function (pro,type,tname) {
	        $('#container4').highcharts({
	            chart: {
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: '移动终端('+tname+")"
	            },
	            tooltip: {
	        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
	                name: tname+"份额",
	                data: eval(pro)
	            }]
	        });
		}
		
		var loadChartHourData5 = function (pro,type,tname) {
	    	// Build the chart
	        $('#container5').highcharts({
	            chart: {
// 	                plotBackgroundColor: null,
// 	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: 'PC终端浏览器('+tname+")"
	            },
	            tooltip: {
	        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
	                name: tname+'份额',
	                data: eval(pro)
	            }]
	        });
		}
		
		var getMaxMin = function(data){
			var mm = {max:0,min:Number.MAX_VALUE};
			
			for(var i in data){
				var a = data[i];
				if(a.value){
					if(a.value>mm.max){
						mm.max=a.value;
					}
					if(a.value<mm.min){
						mm.min = a.value;
					}
				}
			}
			
			return mm;
		}
		
        //创建ECharts图表方法
        function DrawEChart(pro,cities,uvCount,ipCount,type,pvCount,tname) {
        	var myChart = echarts.init(document.getElementById('main'));
        	var proData = eval(pro);
        	var proMM = getMaxMin(proData);
        	proMM = {
        			min:proMM.min*5,
        			max:proMM.max/15
        	}
        	
            //定义图表options
            var option = {
            		title: {
		                text: 'UV量 : '+uvCount+"\nIP量 : "+ipCount +"\nPV量 : "+pvCount,
		                x:'right',
// 		                textAlign:'left',
		                textStyle:{
		                	fontFamily:'Microsoft Yahei',
		                	fontWeight:'bold',
		                	fontSize:14,
		                	color:'orange'
		                }
		            },
                tooltip: {
                    trigger: 'item'
                },
                 dataRange: {
                    x: 'left',
                    y: 'bottom',
                    min: proMM.min,
                    max: proMM.max,
                    color:['orange','yellow'],
                    text:['高','低'],           // 文本，默认为数值文本
                    splitNumber:0
                }, 
                toolbox: {
                    show: false,
                    orient: 'vertical',
                    x: 'right',
                    y: 'center',
                    feature: {
                        mark: { show: true },
                        dataView: { show: true, readOnly: false }
                    }
                },
                series: [
				        {
				            tooltip: {
				                trigger: 'item',
				                //formatter: '{b}'
				            },
				            name: tname,
				            type: 'map',
				            mapType: 'china',
				            mapLocation: {
				                x: '15%',
				                y: '10%',
				                width: '30%'
				            },
				            roam: false,
				            selectedMode: 'single',
				            itemStyle: {
				                //normal:{label:{show:true}},
				                emphasis: { label: { show: true} }
				            },
				            
				            data:proData
				        		
				        }
				    ], 
                animation: false
            };
            var cityData = eval(cities);
            

            
            var defaultProvince = '广东';
            option.series[1] = {
                    name: tname,
                    type: 'map',
                    mapType: defaultProvince,
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                    mapLocation: {
                        x: '50%',
                        y: '10%',
                        width:"80%",
                        height:"80%"
                    },
                    
                    roam: false,
                    data: eval(cities)
                };
                
                option.legend = {
                    x:'right',
                    data:['']
                };
                option.dataRange = {
                    orient: 'horizontal',
                    x: 'right',
                    min: proMM.min,
                    max: proMM.max,
                    color:['orange','yellow'],
                    text:['高','低'],           // 文本，默认为数值文本
                    splitNumber:0
                };
                myChart.setOption(option, true);

            //图表对象渲染
            var ecConfig = echarts.config;
            myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param){
                var selected = param.selected;
                var selectedProvince;
                var name;
                //默认展示广东
                for (var i = 0, l = option.series[0].data.length; i < l; i++) {
                    name = option.series[0].data[i].name;
                    option.series[0].data[i].selected = selected[name];
                    if (selected[name]) {
                        selectedProvince = name;
                    }
                }
                if (typeof selectedProvince == 'undefined') {
                    option.series.splice(1);
                    option.legend = null;
                    option.dataRange = null;
                    myChart.setOption(option, true);
                    return;
                }
                option.series[1] = {
                    name: '',
                    type: 'map',
                    mapType: selectedProvince,
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                    mapLocation: {
                        x: '50%',
                        y: '10%',
                        width:"80%",
                        height:"80%"
                    },
                    
                    roam: false,
                    data: eval(cities)
                };
                
                option.legend = {
                    x:'right',
                    data:['']
                };
                option.dataRange = {
                    orient: 'horizontal',
                    x: 'right',
                    min: proMM.min,
                    max: proMM.max,
                    color:['orange','yellow'],
                    text:['高','低'],           // 文本，默认为数值文本
                    splitNumber:0
                };
                myChart.setOption(option, true);
            });

            myChart.setOption(option,true);
        }
		
		
		
		
// 		loadChartData1();	
// 		loadChartData2();
// 		loadChartPie();
// 		loadMapData();
		
		
		
		var cb = function(start, end, label) {
	        $('#map_date span').html(start.format('YYYY-MM-DD'));
	        loadMapData();
	      };

	      var optionSet1 = {
			singleDatePicker:true,
	        format: 'YYYY-MM-DD',
	        locale: {
	            daysOfWeek: ['日', '一', '二', '三', '四', '五','六'],
	            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
	            firstDay: 1
	        }
	      };
	      $('#map_date').daterangepicker(optionSet1,cb);  
		var cb2 = function(start, end, label) {
	        $('#pie_date span').html(start.format('YYYY-MM-DD'));
	        loadChartPie();
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
	      $('#pie_date').daterangepicker(optionSet2,cb2);  
	      
		var cb3 = function(start, end, label) {
	        $('#today_hour_date span').html(start.format('YYYY-MM-DD'));
	        loadChartData2();
	      };

	      var optionSet3 = {
	  			singleDatePicker:true,
	  	        format: 'YYYY-MM-DD',
	  	        locale: {
	  	            daysOfWeek: ['日', '一', '二', '三', '四', '五','六'],
	  	            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
	  	            firstDay: 1
	  	        }
	  	      };
	      $('#today_hour_date').daterangepicker(optionSet3,cb3);  
		
		
	});
	  
    $(function() {
        //顶部特效
//         InitiateSparklineCharts.init();
        var dateTime = new Date();
        var yy = dateTime.getFullYear();
        var MM = dateTime.getMonth() + 1;
        var dd = dateTime.getDate();
        var week = dateTime.getDay();
        var days = ["日 ", "一 ", "二 ", "三 ", "四 ", "五 ", "六 ", ]
        $("#todayTime").html("今天是" + yy + "年" + MM + "月" + dd + "日（" + "星期" + days[week]+"）");
        //中部
        // InitiateVisitorChart.init();
        //饼图
                    //-------------------------Visitor Sources Pie Chart----------------------------------------//
//             var data = [
//                 {
//                     data: [[1, 21]],
//                     color: '#fb6e52'
//                 },
//                 {
//                     data: [[1, 12]],
//                     color: '#e75b8d'
//                 },
//                 {
//                     data: [[1, 11]],
//                     color: '#a0d468'
//                 },
//                 {
//                     data: [[1, 10]],
//                     color: '#ffce55'
//                 },
//                 {
//                     data: [[1, 46]],
//                     color: '#5db2ff'
//                 }
//             ];
//             var placeholder = $("#dashboard-pie-chart-sources");
//             placeholder.unbind();

//             $.plot(placeholder, data, {
//                 series: {
//                     pie: {
//                         innerRadius: 0.45,
//                         show: true,
//                         stroke: {
//                             width: 4
//                         }
//                     }
//                 }
//             });
    })
    
    
    
</script>