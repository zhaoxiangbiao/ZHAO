<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adSspDataCount/" ></c:set>
<c:set scope="page" var="urlPrev1" value="${ctx }/ssp/config/adPub/" ></c:set>

<c:set scope="page" var="dataTitle" value="广告媒体" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adSspDataCount_1" ></c:set>
<%
SimpleDateFormat today =   new SimpleDateFormat( "yyyy-MM-dd");
String newDate=today.format(new Date());
request.setAttribute("today", newDate);
%>
<div class="row" style="margin-top:-18px;">
  <div class="col-lg-12 col-sm-12 col-xs-12">
    <div class="data-div">
      <div class="widget-header clearfix"  style="text-align:left;">
        <div class="widget flat radius-bordered clearfix" style="margin-top:10px">
          <label class="col-lg-4" style="width:70px;margin-top:10px" >时间：</label>
          <div class="col-lg-4"  style="margin-top:5px">

            <div id="reservation"  style="background: #fff;cursor: pointer; border: 1px solid #ccc;padding: 5px 5px;width:220px"> <i class="glyphicon glyphicon-calendar fa fa-calendar blue"></i>
              <span>${today } 至   ${today }</span> <b class="caret"></b>
            </div>
          </div>
          <label class="col-lg-4" style="width:100px;margin-top:10px" >终端类型：</label>
          <div class="col-lg-4"  style="height:15px;margin-top:10px">
            <div class="radio">
              <label>
                <input name="form-field-radio1" type="radio" checked="checked"  onclick="javascript:loadChartData();" >
                <span class="text">全部</span>
              </label>
            </div>
            <div class="radio">
              <label>
                <input name="form-field-radio1" type="radio"   onclick="javascript:loadChartData();" >
                <span class="text">PC</span>
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
        <div class="col-lg-13 col-sm-13 col-xs-13" style="height:70px;margin-top:10px">

          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4"   >
            <div class="databox radius-bordered databox-shadowed databox-graded">
              <div class="databox-left bg-orange">
                <div class="databox-piechart">
                  <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="50" data-animate="500" data-linewidth="3" data-size="45" data-trackcolor="#fa8872">
                    <span class="white font-90">广告请求数</span>
                  </div>
                </div>
              </div>
              <div class="databox-right">
                <span class="databox-number orange" id="requestCount"></span>
                <div class="databox-stat orange radius-bordered"> <i class="stat-icon icon-lg fa fa-random"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4"   >
            <div class="databox radius-bordered databox-shadowed databox-graded">
              <div class="databox-left bg-yellow">
                <div class="databox-piechart">
                  <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="15" data-animate="500" data-linewidth="3" data-size="45" data-trackcolor="#fee29f">
                    <span class="white font-90">有效请求数</span>
                  </div>
                </div>
              </div>
              <div class="databox-right">
                <span class="databox-number yellow" id="requestSuccessCount"></span>
                <div class="databox-stat yellow radius-bordered">
                  <i class="stat-icon  icon-lg fa  fa-sign-out"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4"   >
            <div class="databox radius-bordered databox-shadowed databox-graded">
              <div class="databox-left bg-azure">
                <div class="databox-piechart">
                  <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="76" data-animate="500" data-linewidth="3" data-size="45" data-trackcolor="#7fe2fa">
                    <span class="white font-90">展现数</span>
                  </div>
                </div>
              </div>
              <div class="databox-right">
                <span class="databox-number azure"  id="showCount"></span>
                <div class="databox-state bg-azure">
                  <i class="fa fa-minus-square-o"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4"   >
            <div class="databox radius-bordered databox-shadowed databox-graded">
              <div class="databox-left bg-orange">
                <div class="databox-piechart">
                  <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="50" data-animate="500" data-linewidth="3" data-size="45" data-trackcolor="#fa8872">
                    <span class="white font-90">点击数</span>
                  </div>
                </div>
              </div>
              <div class="databox-right">
                <span class="databox-number orange" id="clickCount"></span>
                <div class="databox-stat orange radius-bordered">
                  <i class="stat-icon icon-lg fa fa-hand-o-up"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4"   >
            <div class="databox radius-bordered databox-shadowed databox-graded">
              <div class="databox-left bg-yellow">
                <div class="databox-piechart">
                  <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="15" data-animate="500" data-linewidth="3" data-size="45" data-trackcolor="#fee29f">
                    <span class="white font-90">关闭数</span>
                  </div>
                </div>
              </div>
              <div class="databox-right">
                <span class="databox-number yellow" id="closeCount"></span>
                <div class="databox-stat yellow radius-bordered">
                  <i class="stat-icon  icon-lg fa fa-minus-circle"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4"   >
            <div class="databox radius-bordered databox-shadowed databox-graded">
              <div class="databox-left bg-azure">
                <div class="databox-piechart">
                  <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="76" data-animate="500" data-linewidth="3" data-size="45" data-trackcolor="#7fe2fa">
                    <span class="white font-90">点击率</span>
                  </div>
                </div>
              </div>
              <div class="databox-right">
                <span class="databox-number azure"  id="clickRate"></span>
                <div class="databox-state bg-azure">
                  <i class="fa fa-spinner"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div  class="col-lg-1 col-sm-1 col-xs-1" style="height:10px;margin-top:-20px;">
          <div  id="findWhere"   style="display: none;">
            <button   class="btn btn-info btn-xs "  data-container="body" data-titleclass="bordered-blue" data-class="" data-toggle="popover-hover" data-placement="top" data-title="过滤条件" data-content="点击清除该条件，查看全部数据。" href="javascript:void(0);" filter-data=""></button>
          </div>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12" style="height:400px;margin-top:15px;">
          <div id="container" style="width:99%;height:300px"></div>
        </div>

      </div>
      <div class="horizontal-space"></div>
		<div class="widget collapsed " style="margin-top:5px;margin-bottom:0px">
			<div class="widget-header ">
				<span class="widget-caption">数据列表</span>
                  <div class="widget-buttons">
                        <button href="javascript:;" class="btn btn-blue btn-xs search"  data-title="广告来源" data-form="true">查询</button>
                        <a href="#" data-toggle="collapse">
                            <i class="fa blue fa-plus"></i>
                        </a>
                    </div>
					</div>
					<div class="widget-body">
					<form class="form-inline" role="form" onsubmit="return false;" id="form_${tableId}">
							<div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">媒体名称</label>
							<div class="col-sm-8">
								<input type="text" class="form-control  " name="filter_LIKES_pub_name"  placeholder="">
							</div>
							</div>	
					</form>
			</div>
		 </div>
      <div class="widget no-header " style="margin-top:5px">
        <table class="table table-condensed table-bordered table-hover " id="${tableId}"></table>
      </div>

    </div>
  </div>
</div>
<!-- END ROW CONTENT-->
		

<!-- END PAGE CONTENT --> 

<script>
$(document).ready(function() {
  $('.date-picker').datepicker();
  Select2Ex.handleForm4select2({
    target: $("#form_${tableId }")
  });
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
    dateLimit: {
      days: 60
    },
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
      daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
      monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
      firstDay: 1
    }
  };
  $('#reservation').daterangepicker(optionSet1, cb);


  TableAjax.init('${tableId}', {
    sAjaxSource: "${urlPrev1 }listJSON",
    aaSorting: [
      [1, "desc"]
    ], // 需要自定义
    uxUrlPrev: "${urlPrev1 }",
    uxDataTitle: "${dataTitle }",
    uxCheckable: false,
    uxCloseScroll: true,
    uxDrapable: false,
    aoColumns: [{
        sTitle: '媒体名称',
        mData: "pub_name",
        uxLongText: true
      }, {
        sTitle: '媒体状态',
        mData: "pub_status",
        uxEnum: 't_ad_status',
        uxFastSet: false
      }, {
        sTitle: '操作',
        mData: "pub_id",
        mRender: function(data, d, all) {

          //'<a class="blue-stripes" data-handler="CONFIRM" style="margin:20px"   href="${ctx }/ssp/config/adSlot/setStatusNew?slotId='+all.slotid+'">'+statusName+'</a>'
          return '<a class="blue-stripes" style="margin:20px"  href="javascript:loadChartData(' + data + ',\'' + all.pub_name + '\');" ">查看数据</a>' + '|<a class="blue-stripes" style="margin:20px" data-handler="MODAL" href="${ctx }/ssp/config/adPub/view1?pub_id=' + all.pub_id + '">媒体信息</a>' + '|<a class="blue-stripes" style="margin:20px"  data-handler="MODAL" href="${ctx}/ssp/logs/adCountPubEveryDayCount/listPage?id=' + all.pub_id + '">每日明细</a>' + '|<a class="blue-stripes" style="margin:20px" data-handler="INLINE" data-title="修改广告位" data-form=true  href="${ctx }/ssp/config/adPub/edit1?pub_id=' + all.pub_id + '">修改媒体</a>';
          // return '<a class="blue-stripes" style="margin:20px"  data-handler="MODAL" href="null">暂停</a>|<a class="blue-stripes" style="margin:20px"  href="${ctx }/ssp/config/adSlot/edit?slot_id='+all.slotid+'" data-handler="INLINE">修改</a>|<a class="blue-stripes" style="margin:20px"  href="javascript:loadChartData('+data+',\''+all.slotname+'\');" ">报表</a>|<a class="blue-stripes" style="margin:20px"  data-handler="MODAL" href="${ctx}/ssp/logs/adCountSlotEveryDay/listPage?id='+all.slotid+'">详情</a>|<a class="blue-stripes" style="margin:20px"  href="null">代码</a>';                              
        }
      }

    ]
  });



  $("#findWhere").on('click', function() {
    $("#findWhere > button").attr('filter-data', null);
    $("#findWhere").hide();
    loadChartData();
  })


  loadChartData = function(pubId, pubName) {

    var findDate = $('#reservation span').text().split(" 至 ");
    var startDate = findDate[0];
    var endDate = findDate[1];
    var type = 0;
    var clientType = null;
    var id = null;
    if (document.getElementsByName("form-field-radio1")[1].checked) {
      clientType = 1;
    } else if (document.getElementsByName("form-field-radio1")[2].checked) {
      clientType = 2;
    } else {
      clientType = 0;
    }
    // 设置条件
    if (pubId) {
      $("#findWhere > button").attr('filter-data', pubId);
      $("#findWhere > button").html(pubName + '   <i class="fa fa-times"></i>');
      $("#findWhere").show();
    }

    // 获取条件
    id = $("#findWhere > button").attr('filter-data');
    id = id ? id : null;
    $.ajax({
      type: "POST",
      cache: false,
      data: {
        pubid: id,
        startDate: startDate,
        endDate: endDate,
        type: type,
        clientType: clientType
      },
      url: "${urlPrev }count",
      dataType: "json",
      success: function(data) {
        //  刷新图形报表
        console.log(data);
        document.getElementById("requestCount").innerText = data.requestCount;
        document.getElementById("requestSuccessCount").innerText = data.requestSuccessCount;
        document.getElementById("showCount").innerText = data.showCount;
        document.getElementById("clickCount").innerText = data.clickCount;
        document.getElementById("closeCount").innerText = data.closeCount;
        var clickRate = '--';
        if (Math.round(data.clickCount / data.showCount * 10000) / 100.00) {
          clickRate = Math.round(data.clickCount / data.showCount * 10000) / 100.00 + "%";
        }
        document.getElementById("clickRate").innerText = clickRate;
        loadChartHourData(data.CLICKCOUNT, data.REQUESTCOUNT, data.SHOWCOUNT, data.CLOSECOUNT, data.CLICKRATE, data.XMESSAGE, data.XSTEP);
      },
      error: function(xhr, ajaxOptions, thrownError) {},
      async: false
    });

  }

  loadChartHourData = function(clickCount, requestCount, showCount, closeCount, clickrate, xMessage, xsetp) {
    console.log( $("#pub").width())
    $('#container').highcharts({
      chart: {
        backgroundColor: '#fbfbfb',
        width:$("#pub").width()-30
      },
      title: {
        text: ''
      },
      xAxis: {
        showLastLabel: true,
        tickLength: 10,
        tickInterval: eval(xsetp),
        overflow: 'justify',
        tickmarkPlacement: 'on',
        categories: eval(xMessage),
        labels: {
          //  staggerLines:1,
          //  step:eval(xsetp), 
          //  align:0
        }

      },
      credits: {
        enabled: false
      },
      yAxis: {
        title: {
          text: '次数'
        },
        min: 0,
        plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
        }]
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
        backgroundColor: '#F8F8F8', //背景颜色
        borderColor: '#FCFFC5', //边框颜色
        borderRadius: 2, //边框的圆角大小
        borderWidth: 1, //边框宽度(大小)
        enabled: true, //是否显示提示框
        shadow: true, //提示框是否应用阴影  ?没有看出明显效果?????????
        shared: true, //当打开这个属性，鼠标几个某一区域的时候，如果有多条线，所有的线上的据点都会有响应
        crosshairs: { //交叉点是否显示的一条纵线
          width: 2,
          color: 'gray',
          dashStyle: 'shortdot'
        },
        style: { //提示框内容的样式
          color: '#000000',
          padding: '10px', //内边距 (这个会常用到)
          fontSize: '9px'
        }
      },
      series: [{
        name: '点击',
        color: '#2DC3E8',
        data: eval(clickCount)
      }, {
        name: '展示',
        color: '#FB6E52',
        data: eval(showCount)
      }, {
        name: '点击率(%)',
        color: '#907E52',
        data: eval(clickrate)
      }]
    });
  }
  $(function(){
    loadChartData();
  })
});
</script>