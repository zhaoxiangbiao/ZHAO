<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="urlPrev" value="${ctx }/everad/conf/task/" ></c:set>
<%
	Object obj = session.getAttribute("curUser");
	if(obj == null){
%>
	<script type="text/javascript">
		window.location.href="${ctx}/j_spring_security_logout";
	</script>
<%

	}
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Head -->

<head>
    <meta charset="utf-8" />
    <title><%=sysTitle%></title>

    <meta name="description" content="blank page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    
    
    <link rel="shortcut icon" href="${ctx}/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="#" rel="stylesheet" />
    <link href="${ctx}/assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${ctx}/assets/css/weather-icons.min.css" rel="stylesheet" />
    <link href="${ctx}/assets/js/datatable/Buttons-1.1.2/css/buttons.dataTables.css" rel="stylesheet" />

    <!--Fonts-->
<!--     <link href="http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css"> -->
<!--     <link href='http://fonts.useso.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'> -->
 
	
	<!-- dateRange -->
	<link href="${ctx}/assets/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" />

	<link href="${ctx}/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.css" rel="stylesheet" type="text/css" />
	

	<!--Page Related styles-->
	<link href="${ctx}/assets/css/dataTables.bootstrap.css" rel="stylesheet" />
	
    <!--Beyond styles-->
    <link href="${ctx}/assets/css/demo.min.css" rel="stylesheet" />
    <link href="${ctx}/assets/css/typicons.min.css" rel="stylesheet" />
    <link href="${ctx}/assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="#" rel="stylesheet" type="text/css" />
    <link id="beyond-link" href="${ctx}/assets/css/beyond.min.css" rel="stylesheet" />


	<!-- zTree -->
	<link href="${ctx}/assets/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" media="screen"/>
	
	
	<!-- custom -->
    <link href="${ctx}/assets/css/custom.css" rel="stylesheet" />
    
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>    
    
    <script src="${ctx}/assets/js/app/global.js"></script>
    <script type="text/javascript">
    _GLOBAL.ctx = "${ctx}";
	_GLOBAL.imgUrlPrev = "${sysbaseConfig_image_url_prefix }";
    </script>
    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="${ctx}/assets/js/skins.min.js"></script>
</head>
<!-- /Head -->
<!-- Body -->
<body>
    <!-- Loading Container -->
    <div class="loading-container">
        <div class="loading-progress">
            <div class="rotator">
                <div class="rotator">
                    <div class="rotator colored">
                        <div class="rotator">
                            <div class="rotator colored">
                                <div class="rotator colored"></div>
                                <div class="rotator"></div>
                            </div>
                            <div class="rotator colored"></div>
                        </div>
                        <div class="rotator"></div>
                    </div>
                    <div class="rotator"></div>
                </div>
                <div class="rotator"></div>
            </div>
            <div class="rotator"></div>
        </div>
    </div>
    <!--  /Loading Container -->
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="navbar-container">
                <!-- Navbar Barnd -->
                <div class="navbar-header pull-left">
                    <a href="#" class="navbar-brand">
                        <small>
                            <img style="width: 177px;height: 40px;" src="${ctx}/img/desc-common.png" alt=""  />
                        </small>
                    </a>
                </div>
                <!-- /Navbar Barnd -->
                <!-- Sidebar Collapse -->
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="collapse-icon fa "></i>
                </div>
<!--  <img style="margin-left:50px;" src="/img/desc-common-OPT.png" alt="desc"  /> -->

                <!-- /Sidebar Collapse -->
                <!-- Account Area and Settings --->
                <div class="navbar-header pull-right">
                    <div class="navbar-account">
                        <ul class="account-area">
                            <li>
                                
                                <!--Notification Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-notifications">
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <div class="notification-icon">
                                                    <i class="fa fa-phone bg-themeprimary white"></i>
                                                </div>
                                                <div class="notification-body">
                                                    <span class="title">Skype meeting with Patty</span>
                                                    <span class="description">01:00 pm</span>
                                                </div>
                                                <div class="notification-extra">
                                                    <i class="fa fa-clock-o themeprimary"></i>
                                                    <span class="description">office</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <div class="notification-icon">
                                                    <i class="fa fa-check bg-darkorange white"></i>
                                                </div>
                                                <div class="notification-body">
                                                    <span class="title">Uncharted break</span>
                                                    <span class="description">03:30 pm - 05:15 pm</span>
                                                </div>
                                                <div class="notification-extra">
                                                    <i class="fa fa-clock-o darkorange"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <div class="notification-icon">
                                                    <i class="fa fa-gift bg-warning white"></i>
                                                </div>
                                                <div class="notification-body">
                                                    <span class="title">Kate birthday party</span>
                                                    <span class="description">08:30 pm</span>
                                                </div>
                                                <div class="notification-extra">
                                                    <i class="fa fa-calendar warning"></i>
                                                    <i class="fa fa-clock-o warning"></i>
                                                    <span class="description">at home</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <div class="notification-icon">
                                                    <i class="fa fa-glass bg-success white"></i>
                                                </div>
                                                <div class="notification-body">
                                                    <span class="title">Dinner with friends</span>
                                                    <span class="description">10:30 pm</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="dropdown-footer ">
                                        <span>
                                            Today, March 28
                                        </span>
                                        <span class="pull-right">
                                            10°c
                                            <i class="wi wi-cloudy"></i>
                                        </span>
                                    </li>
                                </ul>
                                <!--/Notification Dropdown-->
                            </li>
                            <li>
                             
                            
                                <!--/Messages Dropdown-->
                            </li>

                            <li>
                              
                                <!--Tasks Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-tasks dropdown-arrow ">
                                    <li class="dropdown-header bordered-darkorange">
                                        <i class="fa fa-tasks"></i>
                                        4 Tasks In Progress
                                    </li>

                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <span class="pull-left">Account Creation</span>
                                                <span class="pull-right">65%</span>
                                            </div>

                                            <div class="progress progress-xs">
                                                <div style="width:65%" class="progress-bar"></div>
                                            </div>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <span class="pull-left">Profile Data</span>
                                                <span class="pull-right">35%</span>
                                            </div>

                                            <div class="progress progress-xs">
                                                <div style="width:35%" class="progress-bar progress-bar-success"></div>
                                            </div>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <span class="pull-left">Updating Resume</span>
                                                <span class="pull-right">75%</span>
                                            </div>

                                            <div class="progress progress-xs">
                                                <div style="width:75%" class="progress-bar progress-bar-darkorange"></div>
                                            </div>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <span class="pull-left">Adding Contacts</span>
                                                <span class="pull-right">10%</span>
                                            </div>

                                            <div class="progress progress-xs">
                                                <div style="width:10%" class="progress-bar progress-bar-warning"></div>
                                            </div>
                                        </a>
                                    </li>

                                    <li class="dropdown-footer">
                                        <a href="#">
                                            See All Tasks
                                        </a>
                                        <button class="btn btn-xs btn-default shiny darkorange icon-only pull-right"><i class="fa fa-check"></i></button>
                                    </li>
                                </ul>
                                <!--/Tasks Dropdown-->
                            </li>
                          
                            <li>
                                <a class="login-area dropdown-toggle" data-toggle="dropdown">
<!--                                     <div class="avatar" title="View your public profile"> -->
<%--                                         <img src="${ctx}/assets/img/avatars/adam-jansen.jpg"> --%>
<!--                                     </div> -->
                                    <section>
                                        <h2><span class="profile"><span>退出</span></span></h2>
                                    </section>
                                </a>
                                <!--Login Area Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                    <li class="username"><a>David Stevenson</a></li>
                                    <li class="email"><a>${sessionScope.curUserName}</a></li>
                                    <!--Avatar Area-->
                                    <li>
                                        <div class="avatar-area">
<%--                                             <img src="${ctx}/assets/img/avatars/adam-jansen.jpg" class="avatar"> --%>
<!--                                             <span class="caption">Change Photo</span> -->
                                        </div>
                                    </li>
                                    <!--Avatar Area-->
                                     <li class="edit">
<!--                                         <a href="#" class="pull-left">Setting</a> -->
                                        <a href="${ctx}/system/sysUser/editInfo" class="pull-right" data-handler="MODAL" data-title="修改密码" modal-size="400px">修改密码</a>
                                    </li>
                                    <!--Theme Selector Area-->
                                    <li class="theme-area">
                                        <ul class="colorpicker" id="skin-changer">
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#5DB2FF;" rel="${ctx}/assets/css/skins/blue.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#2dc3e8;" rel="${ctx}/assets/css/skins/azure.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#03B3B2;" rel="${ctx}/assets/css/skins/teal.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#53a93f;" rel="${ctx}/assets/css/skins/green.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#FF8F32;" rel="${ctx}/assets/css/skins/orange.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#cc324b;" rel="${ctx}/assets/css/skins/pink.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#AC193D;" rel="${ctx}/assets/css/skins/darkred.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#8C0095;" rel="${ctx}/assets/css/skins/purple.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#0072C6;" rel="${ctx}/assets/css/skins/darkblue.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#585858;" rel="${ctx}/assets/css/skins/gray.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#474544;" rel="${ctx}/assets/css/skins/black.min.css"></a></li> --%>
<%--                                             <li><a class="colorpick-btn" href="#" style="background-color:#001940;" rel="${ctx}/assets/css/skins/deepblue.min.css"></a></li> --%>
                                        </ul>
                                    </li>
                                    <!--/Theme Selector Area-->
                                    <li class="dropdown-footer">
                                        <a href="javascript:void(0)" id="trigger_logout">
                                            退出系统
                                        </a>
                                    </li>
                                </ul>
                                <!--/Login Area Dropdown-->
                            </li>
                            <!-- /Account Area -->
                            <!--Note: notice that setting div must start right after account area list.
                            no space must be between these elements-->
                            <!-- Settings -->
                        </ul>
                        <!-- Settings -->
                    </div>
                </div>
                <!-- /Account Area and Settings -->
            </div>
        </div>
    </div>
    <!-- /Navbar -->
    <!-- Main Container -->
    <div class="main-container container-fluid">
        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <div class="page-sidebar" id="sidebar">
                <!-- Page Sidebar Header-->
                
                <!-- /Page Sidebar Header -->
                <!-- Sidebar Menu -->
                <ul class="nav sidebar-menu" id="_main_page_sidebar_menu">
                  
                </ul>
                <!-- /Sidebar Menu -->
            </div>
            <!-- /Page Sidebar -->
            
            <!-- Page Content -->
            <div id="_main-page-content" class="page-content">
                <!-- Page Breadcrumb -->
<!--                 <div class="page-breadcrumbs"> -->
<!--                     <ul id="_main-page-bread" class="breadcrumb"> -->
<!--                         <li> -->
<!--                             <i class="fa fa-home"></i> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                	<div class="page-breadcrumbs">
                    <div id="_main-page-bread" class="breadcrumb">
                        
                    </div>
                    </div>
                    <!--Header Buttons-->
                    <div class="header-buttons">
                    <a style="padding-top: 12px;width:100px;" data-handler="CONFIRM"  class=" btn btn-default" href="${urlPrev }sync">下发策略</a>
<!--                         <a class="sidebar-toggler" href="#"> -->
<!--                             <i class="fa fa-arrows-h"></i> -->
<!--                         </a> -->
<!--                         <a class="refresh" id="refresh-toggler" href="javascript:;"> -->
<!--                             <i class="glyphicon glyphicon-refresh"></i> -->
<!--                         </a> -->
<!--                         <a class="fullscreen" id="fullscreen-toggler" href="#"> -->
<!--                             <i class="glyphicon glyphicon-fullscreen"></i> -->
<!--                         </a> -->
                    </div>
                    <!--Header Buttons End-->
                </div>
                <!-- /Page Header -->
                <!-- Page Body -->
                <div id="_main-page-body" class="page-body">
                    <!-- Your Content Goes Here -->
                </div>
                <!-- /Page Body -->
            </div>
            <!-- /Page Content -->
        </div>
        <!-- /Page Container -->
        <!-- Main Container -->

    </div>

    <!--Basic Scripts-->
    <script src="${ctx}/assets/js/jquery.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
    
	<script src="${ctx}/assets/js/jquery.cookie.min.js" type="text/javascript"></script>
    
    <!--Page Related Scripts-->
    <script src="${ctx}/assets/js/bootbox/bootbox.js"></script>
    <script src="${ctx}/assets/js/jquery.blockui.min.js" type="text/javascript"></script>  
    <script src="${ctx}/assets/js/toastr/toastr.js" type="text/javascript"></script>  
       
       
    <!--Highcharts Scripts-->
    <script src="${ctx}/assets/js/highcharts/highcharts.js"></script>    
    <script src="${ctx}/assets/js/highcharts/data.js"></script>    
    
    <!--Sparkline Charts Needed Scripts-->
    <script src="${ctx}/assets/js/charts/sparkline/jquery.sparkline.js"></script>
    <script src="${ctx}/assets/js/charts/sparkline/sparkline-init.js"></script>

    <!--Easy Pie Charts Needed Scripts-->
    <script src="${ctx}/assets/js/charts/easypiechart/jquery.easypiechart.js"></script>
    <script src="${ctx}/assets/js/charts/easypiechart/easypiechart-init.js"></script>

    <!--Flot Charts Needed Scripts-->
    <script src="${ctx}/assets/js/charts/flot/jquery.flot.js"></script>
    <script src="${ctx}/assets/js/charts/flot/jquery.flot.resize.js"></script>
    <script src="${ctx}/assets/js/charts/flot/jquery.flot.pie.js"></script>
    <script src="${ctx}/assets/js/charts/flot/jquery.flot.tooltip.js"></script>
    <script src="${ctx}/assets/js/charts/flot/jquery.flot.orderBars.js"></script>
    
    <!-- dataTable  -->
    <script src="${ctx}/assets/js/datatable/jquery.dataTables-1.10.11.min.js"></script>
    <script src="${ctx}/assets/js/datatable/ZeroClipboard.js"></script>
    <script src="${ctx}/assets/js/datatable/dataTables.tableTools.min.js"></script>
    <script src="${ctx}/assets/js/datatable/dataTables.bootstrap.min.js"></script>
    <script src="${ctx}/assets/js/datatable/Buttons-1.1.2/js/dataTables.buttons.js"></script>
    <script src="${ctx}/assets/js/datatable/Buttons-1.1.2/js/buttons.colVis.js"></script>
    
    
    <!-- select2 -->
    <script src="${ctx}/assets/plugins/select2/select2.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/select2/select2_locale_zh-CN.js" type="text/javascript"></script>
    
    <!-- validation  -->
     <script src="${ctx}/assets/js/validation/bootstrapValidator.js"></script>
	 <script src="${ctx}/assets/js/validation/zh_CN.js"></script>
    
     <!--app Scripts-->
    <script src="${ctx}/assets/js/app/app.js"></script>
    <script src="${ctx}/assets/js/app/customSelect2.js"></script>
    <script src="${ctx}/assets/js/app/common.js"></script>
    <script src="${ctx}/assets/js/app/form-samples.js"></script>
    <script src="${ctx}/assets/js/app/table-ajax.js"></script>
    <script src="${ctx}/assets/js/app/requestStatus.js"></script>
        
     <!--Bootstrap Date Picker-->
    <script src="${ctx}/assets/js/datetime/bootstrap-datepicker.js"></script>
    <script src="${ctx}/assets/js/datetime/jquery.DatePicker.min.js"></script>
     <!--Bootstrap Date Range Picker-->
    <script src="${ctx}/assets/plugins/daterangepicker/moment.js"></script>
    <script src="${ctx}/assets/plugins/daterangepicker/daterangepicker.js"></script>
    
     <!--Fuelux Spinbox-->
    <script src="${ctx}/assets/js/fuelux/spinbox/fuelux.spinbox.min.js"></script>
    
     <!--ZeroClipboard-->
    <script src="${ctx}/assets/js/zeroclip/ZeroClipboard.min.js"></script>
    
    <!-- zTree -->
    <script src="${ctx}/assets/plugins/zTree_v3/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
    
 
    <!-- echarts -->
    <script src="${ctx}/assets/js/charts/chartjs/echarts-all.js" type="text/javascript"></script>
    
    
     <script src="${ctx}/assets/js/json/json-minified.js" type="text/javascript"></script>
   
   <script src="${ctx}/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script>
		 /*Sets Themed Colors Based on Themes*/
	    var themeprimary ;
	    var themesecondary ;
	    var themethirdcolor ;
	    var themefourthcolor ;
	    var themefifthcolor ;
	    /*#region Get Colors*/
		//Get colors from a string base on theme colors
		function getcolor(colorString) {
		    switch (colorString) {
		        case ("themeprimary"):
		            return themeprimary;
		        case ("themesecondary"):
		            return themesecondary;
		        case ("themethirdcolor"):
		            return themethirdcolor;
		        case ("themefourthcolor"):
		            return themefourthcolor;
		        case ("themefifthcolor"):
		            return themefifthcolor;
		        default:
		            return colorString;
		    }
		}
		/*#endregion Get Colors*/
		jQuery(document).ready(function() {
		    _GLOBAL.init("${ctx}","${sysbaseConfig_image_url_prefix }");
			App.init();
			$.ajaxSetup({   
			       contentType:"application/x-www-form-urlencoded;charset=utf-8",   
			       complete:function(XMLHttpRequest,textStatus){ 
			         var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); //通过XMLHttpRequest取得响应头，sessionstatus，  
				         if(sessionstatus=="timeout"){ 
						     //如果超时就处理 ，指定要跳转的页面  
					         window.location.replace("${ctx}/");   
				         }   
			          }   
			});
		});
		
	</script>
    <!--Page Related Scripts-->
</body>
<!--  /Body -->

</html>
