<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adSlot_1" ></c:set>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<style>
        .ad-create-form .form-inline .input-50{
            width: 50px;
        }
        .ad-create-form .step-content{
            background-color: #ffffff;
        }
        .ad-create-form .inline-block{
            display: inline-block;
        }
        .ad-create-form .tab-content,.ad-create-form .nav-tabs,.ad-create-form .widget .widget-header,.ad-create-form .widget .widget-body,
        .ad-create-form .nav-tabs > li.active > a,.ad-create-form .nav-tabs > li.active > a:hover,.ad-create-form .nav-tabs > li.active > a:focus
        {
            -webkit-box-shadow:none;
            box-shadow:none;
        }
        .ad-create-form .nav-tabs > li.active > a,.ad-create-form .nav-tabs > li.active > a:hover,.ad-create-form .nav-tabs > li.active > a:focus{
            border-bottom: 2px solid #70bafd;
            border-top: 0px;
        }
        /*广告形态附近的tab*/
        .ad-style .nav-tabs > li.active > a,.ad-style .nav-tabs > li.active > a:hover,.ad-style .nav-tabs > li.active > a:focus{
            border: 1px solid #a4d3fe;
            color: #57b5e3;
            background-color: #e4f0fc;
        }        
        .ad-create-form .nav-tabs,.tab-content{
            background-color: transparent;
        }
        .ad-create-form .widget .widget-header{
            border: 1px solid #70bafd;
            border-bottom: 0px;
        }
        .ad-create-form .widget .widget-body{
            border: 1px solid #70bafd;
            background-color: #f9fcff;
        }
        textarea, input,select{
            background-color: #f9fcff !important;
        }
        /*开关*/
        input[type=checkbox].checkbox-slider ~ .text:before{
            content: '投放 00不投放';
        }
        .spinbox.spinbox-horizontal input.time-space{
            width: 100px;
        }
        
      .mobile-end-wrapper .popover{
            min-width: 340px;
        }
        .pc-end-wrapper .popover{
            min-width: 520px;
        }
        .end-wrapper{
            width:512px;
            text-align: center;
        }
        .pc-end-wrapper .end-wrapper{
            background: url("<%=basePath%>img/pc-end.png") no-repeat;
            height:269px;
        }
        .mobile-end-wrapper .end-wrapper{
            background: url("<%=basePath%>img/mobile-end.png") no-repeat;
            width:300px;
            height:630px;
        }        
        .pc-end-wrapper #ad-display{
          max-width: 320px;
          max-height: 200px;
        }
        .mobile-end-wrapper #ad-display{
            width: 254px;
            left: 2px;
            position: relative;
            top: 510px;       
        }
        .mobile-end-wrapper #ad-display.up{
            top: 110px;
        }
        .mobile-end-wrapper #ad-display.down{
            top: 510px;
        }
        .pc-end-wrapper .image-wrapper{
            position: relative;
            width: 319px;
            height: 201px;
            top: 19px;
            left: 96px;
        }
        .pc-end-wrapper .right-bottom #ad-display{
            position: absolute;
            right: 0px;
            bottom: 0px;
            width: 120px;
        }
        .pc-end-wrapper .bottom-side #ad-display{
            position: absolute;
            bottom: 0px;
            left: 0px;
        }
        .pc-end-wrapper .side-side #ad-display,.pc-end-wrapper .couplet-side #ad-display{
            position: absolute;
            right: 0;
            max-height: 100px !important;
            bottom: 50px;
        }
        .pc-end-wrapper #couplet-image,.mobile-end-wrapper #couplet-image{
            display: none !important;
        }
        .pc-end-wrapper .couplet-side #couplet-image{
            display: block;
            position: absolute;
            left: 0;
            max-height: 100px !important;
            bottom: 50px;
        }

</style>

<div class="col-lg-12 col-sm-12 col-xs-12">
    <form id="ad-create-form-input" method="post" action="${ctx}/ssp/config/adSlot/save" class="bv-form ad-create-form  col-lg-8 col-sm-12 col-xs-12" >
        <div class="form-body">
            <input type="hidden" name="id" value="${adSlot.id}" />
            <input type="hidden" name="tid" value="${adTactics.id}" />
            <input type="hidden" name="slot_id" value="${AutoId}"/>
            <!-- 基本信息 -->

            <div class="clearfix">
                <div class="widget ">
                    <div class="widget-header bordered-bottom bordered-blue">
                        <span class="widget-caption"> <i class=" fa-plus-circle fa"></i>
                            &nbsp;广告位新建
                        </span>
                        <div class="pull-right form-btn" style="top: 0px;position: relative;right: 6px;">
                            <button class="btn btn-yellow btn-xs" type="reset"> <i class="ace-icon fa fa-undo bigger-110"></i>
                                重置
                            </button>
                            <button type="submit" class="btn btn-blue btn-xs">
                                <i class="ace-icon fa fa-check bigger-110"></i>
                                确认
                            </button>
                        </div>
                    </div>
                    <div class="widget-body clearfix">
                        <div class="form-horizontal">
                            <div class="clearfix">
                                <div  class="form-group col-sm-6">
                                    <label for="slot_name" class="col-sm-3 control-label no-padding-right">广告位的名称&nbsp;</label>
                                    <div class="col-sm-6">
                                        <input class="form-control " type="text" name="slot_name" value="${adSlot.slot_name}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" ></div>
                                </div>
                                
                                 <div class="form-group col-sm-6">
                                    <label for="" class="col-sm-3 control-label no-padding-right">平台</label>
                                    <div class="col-sm-6">
                                    <tag:enum id="slot_target_floor" cssClass="select2me" name="slot_target_floor" attrs="" cssStyle="width:100%" enumName="t_ad_target_type" inputType="select" enumKey="${adSlot.slot_target_floor}"/>

                                	</div>
                            	</div>
                                
                            </div>

                            <div class="clearfix">
                            
                                <div  class="form-group col-sm-6">
                                    <label for="slot_name" class="col-sm-3 control-label no-padding-right">媒体名称&nbsp;</label>
                                    <div class="col-sm-6">
                                      	<select id="pub_id" name="pubId" style="width: 100%">
											<c:forEach items="${pubList}" var="item">
												<option style="width:100%" value="${item.pub_id}" <c:if test="${item.pub_id==adSlot.pub_id.pub_id}"> selected='selected'</c:if> >${item.pub_name}</option>
											</c:forEach>
										</select>
                                    </div>
                                </div>
                                
                                <div class="form-group col-sm-6">
                                    <label for="s2id_autogen9" class="col-sm-3 control-label no-padding-right">站点</label>
                                    <div class="col-sm-6">
                                     	<select id="site_id" name="siteId" style="width: 100%">
											
										</select>
                                    </div>
                                </div>
                               
                        	</div>
                        
                        <div class="clearfix">
                                <div class="form-group col-sm-6 inline-block">
                                    <label for="status" class="col-sm-3 control-label no-padding-right">是否选择投放</label>
                                    <label class="col-sm-9" style="top:5px;">
                                        <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="status" attrs=""  enumName="t_ad_status" inputType="radio" defaultValue="0" enumKey="${adSlot.status}"/>
                                        <span class="text"></span>
                                    </label>
                                </div>
                                
                                <div class="form-group col-sm-6 inline-block">
                                    <label for="status" class="col-sm-3 control-label no-padding-right">DSP补余</label>
                                    <label class="col-sm-9" style="top:5px;">
                                        <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="dspComplement" attrs=""  enumName="isOrNot" inputType="radio" defaultValue="0" enumKey="${adSlot.dspComplement}"/>
                                        <span class="text"></span>
                                    </label>
                                </div>
                        </div>
                         <div class="clearfix">
                                 <div class="form-group col-sm-6 inline-block">
                                    <label for="status" class="col-sm-3 control-label no-padding-right">是否在首页展示</label>
                                    <label class="col-sm-9" style="top:5px;">
                                        <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="showHome" attrs=""  enumName="isOrNot" inputType="radio" defaultValue="0" enumKey="${adSlot.showHome}"/>
                                        <span class="text"></span>
                                    </label>
                                </div>
                                <div class="form-group col-sm-6 inline-block">
                                    <label for="status" class="col-sm-3 control-label no-padding-right">三方源投放顺序</label>
                                    <label class="col-sm-9" style="top:5px;">
                                        <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="sourceChooseType" attrs=""  enumName="loop_type" inputType="radio" defaultValue="0" enumKey="${adSlot.sourceChooseType}"/>
                                        <span class="text"></span>
                                    </label>
                                </div>
                        </div>
                        
                         <div class="clearfix">
                                
                                 <div class="form-group col-sm-6">
                                    <label for="" class="col-sm-3 control-label no-padding-right">流量类型</label>
                                    <div class="col-sm-6">
                                    <tag:enum id="traffic_type" cssClass="select2me" name="traffic_type" attrs="" cssStyle="width:100%" enumName="ssp_traffic_type" inputType="select" enumKey="${adSlot.traffic_type}"/>

                                	</div>
                            	</div>
                                
                            </div>
                        

                    </div>

                    <div class="tabbable col-lg-12 col-sm-12 col-xs-12">
                        <ul class="nav nav-tabs" id="myTab1">
                            <li class="active tab-pc-end" id="tab-pc-end">
                                <a data-toggle="tab" href="#pc-end" aria-expanded="true">
                                    <i class="typcn typcn-device-desktop"></i>
                                    &nbsp;PC端
                                </a>
                            </li>

                            <li id="tab-mobile-end" class="tab-pc-end">
                                <a data-toggle="tab" href="#mobile-end" aria-expanded="false">
                                    <i class="typcn typcn-device-tablet"></i>
                                    &nbsp;移动端
                                </a>
                            </li>

                        </ul>

                        <div class="tab-content clearfix" style="background-color:#f9fcff">
                            <!-- 移动端 -->
                            <div class="pc-end tab-pane" id="mobile-end">

                                <!-- 广告形态 -->
                                <div class="widget flat">
                                    <div class="widget-header bordered-bottom bordered-blue">
                                        <span class="widget-caption">
                                            <i class="fa fa-cogs"></i>
                                            &nbsp;广告形态
                                        </span>
                                    </div>
                                    <div class="widget-body">
                                        <div class="form-group clearfix">
                                            <div class="tabbable col-lg-12 col-sm-12 col-xs-12">
                                                <!-- mobile -->
                                                <ul class="nav nav-tabs ad-top-classif" id="myTab2">
                                                    <li class="active">
                                                        <a data-toggle="tab" href="#mobile-ad-float" aria-expanded="true">移动浮动广告</a>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="tab" href="#mobile-ad-fix" aria-expanded="false">固定广告</a>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="tab" href="#mobile-ad-picplus" aria-expanded="false">图+</a>
                                                    </li>
                                                </ul>

                                                <div class="tab-content  ad-style ad-right-classif">
                                                    <!-- mobile -->
                                                    <input id="slot_type_mobile" name ="slot_type_mobile" type="hidden" value="${adSlot.slot_type_mobile}" />
                                                    <!-- 浮动广告 -->
                                                    <div id="mobile-ad-float" class="tab-pane active clearfix ">
                                                        <input id="slot_shape_float_mobile" name ="slot_shape_float_mobile" type="hidden" value="${adSlot.slot_shape_float_mobile}" />
                                                        <div class="tabbable clearfix">
                                                            <div class="tab-content" >
                                                                <div id="mobile-ad-float-bottom" class="tab-pane active clearfix">
                                                                    <div class="control-group form-inline">
                                                                        尺寸：
                                                                        <div class="form-inline form-group">
                                                                            <c:if test='${adSlot.slot_shape_float_mobile==2}'>
                                                                                <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_mobile" enumName="t_ad_slot_bottom_size_mobile" inputType="radio"   enumKey="${adSlot.slot_width_mobile}"/>
                                                                            </c:if>
                                                                            <c:if test='${adSlot.slot_shape_float_mobile!=2}'>
                                                                                <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_mobile" enumName="t_ad_slot_bottom_size_mobile" inputType="radio"   enumKey=""/>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                                <div id="mobile-ad-float-top" class="tab-pane">
                                                                    <div class="control-group form-inline">
                                                                        尺寸：
                                                                        <div class="form-inline form-group">
                                                                            <c:if test='${adSlot.slot_shape_float_mobile==4}'>
                                                                                <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_mobile" enumName="t_ad_slot_bottom_size_mobile" inputType="radio"   enumKey="${adSlot.slot_width_mobile}"/>
                                                                            </c:if>
                                                                            <c:if test='${adSlot.slot_shape_float_mobile!=4}'>
                                                                                <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_mobile" enumName="t_ad_slot_bottom_size_mobile" inputType="radio"   enumKey=""/>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <ul class="nav nav-tabs pull-right" id="myTab3">
                                                            <li class="active mobile-bottom-side">
                                                                <a data-toggle="tab" href="#mobile-ad-float-bottom" aria-expanded="true">底栏</a>
                                                            </li>
                                                            <li class="mobile-up-side">
                                                                <a data-toggle="tab" href="#mobile-ad-float-top" aria-expanded="false">顶栏</a>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                    <!-- 固定广告 -->
                                                    <div id="mobile-ad-fix" class="tab-pane">
                                                        <input id="slot_shape_fixed_mobile" name ="slot_shape_fixed_mobile" type="hidden" value="${adSlot.slot_shape_fixed_mobile}" />
                                                        <div class="tabbable clearfix">
                                                            <div class="tab-content" >
                                                                <div id="mobile-ad-fix-1" class="tab-pane active clearfix">
                                                                    <div class="control-group form-inline">
                                                                        尺寸：
                                                                        <div class="inline-block">
                                                                            <c:if test='${adSlot.slot_shape_fixed_mobile==3}'>
                                                                                <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_mobile" enumName="t_slot_fixed_proportion_mobile" inputType="radio"   enumKey="${adSlot.slot_width_mobile}"/>
                                                                            </c:if>
                                                                            <c:if test='${adSlot.slot_shape_fixed_mobile!=3}'>
                                                                                <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_mobile" enumName="t_slot_fixed_proportion_mobile" inputType="radio"   enumKey=""/>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div id="mobile-ad-fix-2" class="tab-pane">
                                                                    <div class="control-group form-inline">
                                                                        <div class="form-inline form-group">
                                                                          <label style="  position:relative;top: -10px;">宽：&nbsp;</label>
                                                                            <div class="spinbox inline-block">
                                                                                <c:if test='${adSlot.slot_shape_fixed_mobile==2}'>
                                                                                    <input type="text" class="spinbox-input form-control" name="slot_width_mobile_diy" value="${adSlot.slot_width_mobile}"/>
                                                                                </c:if>
                                                                                <c:if test='${adSlot.slot_shape_fixed_mobile!=2}'>
                                                                                    <input type="text" class="spinbox-input form-control" name="slot_width_mobile_diy" value=""/>
                                                                                </c:if>
                                                                                <div class="spinbox-buttons btn-group btn-group-vertical">
                                                                                    <button type="button" class="btn spinbox-up blue">
                                                                                        <i class="fa fa-chevron-up"></i>
                                                                                    </button>
                                                                                    <button type="button" class="btn spinbox-down danger">
                                                                                        <i class="fa fa-chevron-down"></i>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                            <label style="  position:relative;top: -10px;">&nbsp;%</label>
                                                                        </div>

                                                                        <div class="form-inline form-group">
                                                                            <label style="  position:relative;top: -10px;">高：&nbsp;</label>
                                                                            <div class="spinbox inline-block">
                                                                                <c:if test='${adSlot.slot_shape_fixed_mobile==2}'>
                                                                                    <input type="text" class="spinbox-input form-control" name="slot_height_mobile_diy" value="${adSlot.slot_height_mobile}"/>
                                                                                </c:if>
                                                                                <c:if test='${adSlot.slot_shape_fixed_mobile!=2}'>
                                                                                    <input type="text" class="spinbox-input form-control" name="slot_height_mobile_diy" value=""/>
                                                                                </c:if>
                                                                                <div class="spinbox-buttons btn-group btn-group-vertical">
                                                                                    <button type="button" class="btn spinbox-up blue">
                                                                                        <i class="fa fa-chevron-up"></i>
                                                                                    </button>
                                                                                    <button type="button" class="btn spinbox-down danger">
                                                                                        <i class="fa fa-chevron-down"></i>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                            <label style="  position:relative;top: -10px;">&nbsp;px</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <ul class="nav nav-tabs pull-right" id="myTab4">
                                                                <li class="active">
                                                                    <a data-toggle="tab" href="#mobile-ad-fix-1" aria-expanded="true">固定比例</a>
                                                                </li>
                                                                <li>
                                                                    <a data-toggle="tab" href="#mobile-ad-fix-2" aria-expanded="false">自定义</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <!-- 图+ -->
                                                    <div id="mobile-ad-picplus" class="tab-pane ">
                                                        <div class="tabbable clearfix">
                                                            <div class="tab-content" >
                                                                <div id="mobile-ad-picplus-1" class="tab-pane active clearfix">
                                                                    <div class="control-group form-inline"></div>
                                                                </div>
                                                                <div id="mobile-ad-picplus-2" class="tab-pane">
                                                                    <div class="control-group form-inline"></div>
                                                                </div>
                                                            </div>
                                                            <ul class="nav nav-tabs pull-right" id="myTab5">
                                                                <li class="active">
                                                                    <a data-toggle="tab" href="#mobile-ad-picplus-1" aria-expanded="true">图+1</a>
                                                                </li>
                                                                <li>
                                                                    <a data-toggle="tab" href="#mobile-ad-picplus-2" aria-expanded="false">图+2</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 效果配置 -->
                                <div class="widget">
                                    <div class="widget-header bordered-bottom bordered-blue">
                                        <span class="widget-caption">
                                            <i class="glyphicon glyphicon-eye-open"></i>
                                            &nbsp;效果配置
                                        </span>
                                    </div>
                                    <div class="widget-body">
                                        广告类型：
                                        <div class="inline-block">
                                            <tag:enum id="slot_style_mobile" cssClass="form-control form-control-inline input-medium select2me" name="slot_style_mobile" attrs=""  enumName="t_slot_style" inputType="radio" enumKey="${adSlot.slot_style_mobile}"/>
                                        </div>
                                    </div>
                                </div>

                                <!-- 策略控制 -->
                                <div class="widget">
                                    <div class="widget-header bordered-bottom bordered-blue">
                                        <span class="widget-caption">
                                            <i class="fa fa-archive"></i>
                                            &nbsp;策略控制
                                        </span>
                                    </div>
                                    <div class="widget-body">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">广告排期</label>
                                                <div class="col-xs-10 form-inline ">
                                                    <input id="dpd1" placeholder='' class="form-control date-picker " name="ad_start_time_mobile" type="text" readonly="true" value="<fmt:formatDate value="${adTactics.ad_start_time_mobile}" pattern="yyyy-MM-dd" />" />
                                                    &nbsp;至&nbsp;
                                                    <input id="dpd2" placeholder='' class="form-control date-picker " name="ad_end_time_mobile"  type="text"  readonly="true" value="<fmt:formatDate value="${adTactics.ad_end_time_mobile}" pattern="yyyy-MM-dd" />" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <br>
                                                <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">每日投放次数</label>
                                                <div class="col-xs-10 form-inline ">
                                                    <input id="publish_everyday_mobile" class="form-control " name="publish_everyday_mobile" type="text" value="${adTactics.publish_everyday_mobile}" data-bv-notempty="true"
                                                               data-bv-notempty-message="此处不能为空！"  data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$" data-bv-regexp-message="请输入数字！"/>
                                                </div>
                                            </div>

                                            <div class="form-group">

                                                <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">单UV投放频率</label>
                                                <div class="form-inline col-xs-10 ">
                                                    <tag:enum id="select-uvrate-mobile" cssClass="form-control-inline input-medium select2me" name="publish_frequency_per_uv_mobile" attrs="" cssStyle="width:25%" enumName="t_publish_frequecy" inputType="select" enumKey="${adTactics.publish_frequency_per_uv_mobile}"/>
                                                    <div class="inline-block" id="select-uvrate-detail-mobile" style="display:none;">
                                                        <tag:enum id="select-uvtime-mobile" cssClass="form-control-inline input-medium select2me" name="publish_scheme_per_uv_mobile" attrs=""  enumName="t_publish_scheme" inputType="select" enumKey="${adTactics.publish_scheme_per_uv_mobile}"/>
                                                        &nbsp;&nbsp;
                                                        <span id="select-uvtime-text-mobile">小时</span>
                                                        <input class="form-control input-50" type="text" id="times_mobile" name="times_per_union_mobile" value="${adTactics.times_per_union_mobile}" data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$" data-bv-regexp-message="请输入数字！"/>
                                                        次
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <br>
                                                <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">单UV时间间隔</label>
                                                <div class="col-xs-10 form-inline ">
                                                    <div class="spinbox spinbox-horizontal inline-block">
                                                        <input type="text" class="spinbox-input form-control"   name="slot_time_interval_mobile"  value="${adTactics.slot_time_interval_mobile}" data-bv-notempty="true"
                                                               data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="[0-9]+" data-bv-regexp-message="请输入数字！"/>
                                                        <div class="spinbox-buttons btn-group">
                                                            <button type="button" class="btn spinbox-down blueberry">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <button type="button" class="btn spinbox-up purple">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <label style="  position:relative;top: -10px;">&nbsp;秒</label>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">广告展示</label>
                                                <div class="col-xs-10 form-inline ">
                                                    <div class="spinbox spinbox-horizontal inline-block">
                                                        <input type="text" class="spinbox-input form-control"   name="slot_residencetime_mobile"  value="${adSlot.slot_residencetime_mobile}" data-bv-notempty="true"
                                                               data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="[0-9]+" data-bv-regexp-message="请输入数字！">
                                                        <div class="spinbox-buttons btn-group">
                                                            <button type="button" class="btn spinbox-down blueberry">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <button type="button" class="btn spinbox-up purple">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <label style="  position:relative;top: -10px;">&nbsp;秒后自动消失</label>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <!-- <b>高级配置</b>
                                            -->
                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">若无合适广告投放，启用</label>
                                            <div class="col-xs-10 form-inline ">
                                                <tag:enum cssClass="form-control-inline input-medium select2me" name="compensation_scheme_mobile" attrs="" cssStyle="width:25%" enumName="t_compensation_scheme" inputType="select" enumKey="${adTactics.compensation_scheme_mobile}"/>
                                                <a href="javascript:void(0);" data-container="body" data-titleclass="bordered-blue" data-class="" data-toggle="popover" data-placement="right" data-title="名词解释" data-content="流量补余：当广告位在用户指定广告来源情况下，如果广告源没有广告返回，平台自动切换到其他广告源，如没有任何广告，则填充公益广告<br>
                                                    流量返还：如果没有广告返回，则该次广告曝光不计入此次的流量使用。
                                                    <br>
                                                    默认开启流量返还。">
                                                    <i class="fa fa-question-circle"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">URL白名单</label>
                                            <div class="col-xs-10 form-inline ">
                                                <textarea id="url_whitelist_mobile" class="form-control" name="url_whitelist_mobile">${adTactics.url_whitelist_mobile}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">扩展代码(移动)</label>
                                            <div class="col-xs-10 form-inline ">
                                                <textarea rows="10" style="width: 100%" class="form-control" name="ext_code_mobile">${adSlot.ext_code_mobile}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- pc端 -->
                        <div class="pc-end tab-pane" id="pc-end">

                            <!-- 广告形态 -->
                            <div class="widget flat">
                                <div class="widget-header bordered-bottom bordered-blue">
                                    <span class="widget-caption">
                                        <i class="fa fa-cogs"></i>
                                        &nbsp;广告形态
                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="form-group clearfix">
                                        <div class="tabbable col-lg-12 col-sm-12 col-xs-12">
                                            <!-- PC端 -->
                                            <ul class="nav nav-tabs ad-top-classif" id="myTab6">
                                                <li class="active">
                                                    <a data-toggle="tab" href="#pc-ad-float" aria-expanded="true">PC浮动广告</a>
                                                </li>

                                                <li>
                                                    <a data-toggle="tab" href="#pc-ad-fix" aria-expanded="false">固定广告</a>
                                                </li>
                                                <li>
                                                    <a data-toggle="tab" href="#pc-ad-picplus" aria-expanded="false">图+</a>
                                                </li>
                                            </ul>

                                            <div class="tab-content  ad-style ad-right-classif">
                                                <!-- pc端 -->
                                                <!-- 浮动广告 -->
                                                <input id="slot_type_pc" name ="slot_type_pc" type="hidden" value="${adSlot.slot_type_pc}" />
                                                <div id="pc-ad-float" class="tab-pane active clearfix brand-ad " data-type="float">
                                                    <input id="slot_shape_float_pc" name ="slot_shape_float_pc" type="hidden" value="${adSlot.slot_shape_float_pc}" />
                                                    <div class="tabbable clearfix">
                                                        <div class="tab-content" >

                                                            <div id="pc-ad-float-right" class="tab-pane active clearfix transform-pc" data-type="right-bottom">
                                                                <div class="control-group form-inline">
                                                                    尺寸：
                                                                    <div class="inline-block">	
                                                                        <c:if test='${adSlot.slot_shape_float_pc==1}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_right_size" inputType="radio"   enumKey="${adSlot.slot_width_pc}"/>
                                                                        </c:if>
                                                                        <c:if test='${adSlot.slot_shape_float_pc!=1}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_right_size" inputType="radio"   enumKey=""/>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div id="pc-ad-float-couplet" class="tab-pane transform-pc" data-type="couplet-side">
                                                                <div class="control-group form-inline">
                                                                    尺寸：
                                                                    <div class="inline-block">
                                                                        <c:if test='${adSlot.slot_shape_float_pc==0}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_couplet_side_size" inputType="radio"   enumKey="${adSlot.slot_width_pc}"/>
                                                                        </c:if>
                                                                        <c:if test='${adSlot.slot_shape_float_pc!=0}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_couplet_side_size" inputType="radio"   enumKey=""/>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div id="pc-ad-float-bottom" class="tab-pane transform-pc" data-type="bottom-side">
                                                                <div class="control-group form-inline">
                                                                    尺寸：
                                                                    <div class="form-inline form-group">
                                                                        <c:if test='${adSlot.slot_shape_float_pc==2}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_bottom_size_pc" inputType="radio"   enumKey="${adSlot.slot_width_pc}"/>
                                                                        </c:if>
                                                                        <c:if test='${adSlot.slot_shape_float_pc!=2}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_bottom_size_pc" inputType="radio"   enumKey=""/>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="pc-ad-float-side" class="tab-pane transform-pc" data-type="side-side">
                                                                <div class="control-group form-inline">
                                                                    尺寸：
                                                                    <div class="inline-block">
                                                                        <c:if test='${adSlot.slot_shape_float_pc==3}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_couplet_side_size" inputType="radio"   enumKey="${adSlot.slot_width_pc}"/>
                                                                        </c:if>
                                                                        <c:if test='${adSlot.slot_shape_float_pc!=3}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_couplet_side_size" inputType="radio"   enumKey=""/>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <ul class="nav nav-tabs pull-right" id="myTab7">
                                                            <li class="active">
                                                                <a data-toggle="tab" href="#pc-ad-float-right" aria-expanded="true">右下角</a>
                                                            </li>

                                                            <li>
                                                                <a data-toggle="tab" href="#pc-ad-float-couplet" aria-expanded="false">对联</a>
                                                            </li>

                                                            <li>
                                                                <a data-toggle="tab" href="#pc-ad-float-bottom" aria-expanded="false">底栏</a>
                                                            </li>
                                                            <li>
                                                                <a data-toggle="tab" href="#pc-ad-float-side" aria-expanded="false">侧栏</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- 固定广告 -->
                                                <div id="pc-ad-fix" class="tab-pane brand-ad" data-type="fix">
                                                    <input id="slot_shape_fixed_pc" name ="slot_shape_fixed_pc" type="hidden" value="${adSlot.slot_shape_fixed_pc}" />
                                                    <div class="tabbable clearfix">
                                                        <div class="tab-content" >
                                                            <div id="pc-ad-fix-1" class="tab-pane active clearfix">
                                                                <div class="control-group form-inline">
                                                                    尺寸：
                                                                    <div class="inline-block">
                                                                        <c:if test='${adSlot.slot_shape_fixed_pc==0}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_banner_size" inputType="radio"   enumKey="${adSlot.slot_width_pc}"/>
                                                                        </c:if>
                                                                        <c:if test='${adSlot.slot_shape_fixed_pc!=0}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_banner_size" inputType="radio"   enumKey=""/>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="pc-ad-fix-2" class="tab-pane">
                                                                <div class="control-group form-inline">
                                                                    尺寸：
                                                                    <div class="inline-block">
                                                                        <c:if test='${adSlot.slot_shape_fixed_pc==1}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_rect_size" inputType="radio"   enumKey="${adSlot.slot_width_pc}"/>
                                                                        </c:if>
                                                                        <c:if test='${adSlot.slot_shape_fixed_pc!=1}'>
                                                                            <tag:enum cssClass="form-control form-control-inline input-medium select2me" name="slot_width_pc" attrs=""  enumName="t_ad_slot_rect_size" inputType="radio"   enumKey=""/>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="pc-ad-fix-3" class="tab-pane">
                                                                <div class="control-group form-inline">
                                                                    <div class="form-inline form-group">
                                                                        <label style="  position:relative;top: -10px;">宽：&nbsp;</label>
                                                                        <div class="spinbox inline-block">
                                                                            <c:if test='${adSlot.slot_shape_fixed_pc==2}'>
                                                                                <input type="text" class="spinbox-input form-control" name="slot_width_pc_diy" value="${adSlot.slot_width_pc}"/>
                                                                            </c:if>
                                                                            <c:if test='${adSlot.slot_shape_fixed_pc!=2}'>
                                                                                <input type="text" class="spinbox-input form-control" name="slot_width_pc_diy" value=""/>
                                                                            </c:if>
                                                                            <div class="spinbox-buttons btn-group btn-group-vertical">
                                                                                <button type="button" class="btn spinbox-up blue">
                                                                                    <i class="fa fa-chevron-up"></i>
                                                                                </button>
                                                                                <button type="button" class="btn spinbox-down danger">
                                                                                    <i class="fa fa-chevron-down"></i>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                        <label style="  position:relative;top: -10px;">&nbsp;px</label>
                                                                    </div>

                                                                    <div class="form-inline form-group">
                                                                      <label style="  position:relative;top: -10px;">高：&nbsp;</label>
                                                                        <div class="spinbox inline-block">
                                                                            <c:if test='${adSlot.slot_shape_fixed_pc==2}'>
                                                                                <input type="text" class="spinbox-input form-control" name="slot_height_pc_diy" value="${adSlot.slot_height_pc}"/>
                                                                            </c:if>
                                                                            <c:if test='${adSlot.slot_shape_fixed_pc!=2}'>
                                                                                <input type="text" class="spinbox-input form-control" name="slot_height_pc_diy" value=""/>
                                                                            </c:if>
                                                                            <div class="spinbox-buttons btn-group btn-group-vertical">
                                                                                <button type="button" class="btn spinbox-up blue">
                                                                                    <i class="fa fa-chevron-up"></i>
                                                                                </button>
                                                                                <button type="button" class="btn spinbox-down danger">
                                                                                    <i class="fa fa-chevron-down"></i>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                        <label style="  position:relative;top: -10px;">&nbsp;px</label>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <ul class="nav nav-tabs pull-right" id="myTab8">
                                                            <li class="active">
                                                                <a data-toggle="tab" href="#pc-ad-fix-1" aria-expanded="true">横幅</a>
                                                            </li>
                                                            <li>
                                                                <a data-toggle="tab" href="#pc-ad-fix-2" aria-expanded="false">矩形</a>
                                                            </li>
                                                            <li>
                                                                <a data-toggle="tab" href="#pc-ad-fix-3" aria-expanded="false">自定义</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- 图+ -->
                                                <div id="pc-ad-picplus" class="tab-pane brand-ad" data-type="pic">
                                                    <div class="tabbable clearfix">
                                                        <div class="tab-content" >
                                                            <div id="pc-ad-picplus-1" class="tab-pane active clearfix">
                                                                <div class="control-group form-inline"></div>
                                                            </div>
                                                            <div id="pc-ad-picplus-2" class="tab-pane">
                                                                <div class="control-group form-inline"></div>
                                                            </div>
                                                        </div>
                                                        <ul class="nav nav-tabs pull-right">
                                                            <li class="active">
                                                                <a data-toggle="tab" href="#pc-ad-picplus-1" aria-expanded="true">图+1</a>
                                                            </li>
                                                            <li>
                                                                <a data-toggle="tab" href="#pc-ad-picplus-2" aria-expanded="false">图+2</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 效果配置 -->
                            <div class="widget">
                                <div class="widget-header bordered-bottom bordered-blue">
                                    <span class="widget-caption">
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                        &nbsp;效果配置
                                    </span>
                                </div>
                                <div class="widget-body">
                                    广告类型：
                                    <div class="inline-block">
                                        <tag:enum id="slot_style_pc" cssClass="form-control form-control-inline input-medium select2me" name="slot_style_pc" attrs=""  enumName="t_slot_style" inputType="radio" enumKey="${adSlot.slot_style_pc}"/>
                                    </div>
                                </div>
                            </div>

                            <!-- 策略控制 -->
                            <div class="widget">
                                <div class="widget-header bordered-bottom bordered-blue">
                                    <span class="widget-caption">
                                        <i class="fa fa-archive"></i>
                                        &nbsp;策略控制
                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">定向原始广告位(PC)</label>
                                            <div class="col-xs-10 form-inline ">
													<input class=" select2" style="width:100%" name="source_slot_id_pc.source_slot_id" type="hidden"   value="${adSlot.source_slot_id_pc.source_slot_id}" display-value="${adSlot.source_slot_id_pc.source_slot_name}" result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_name" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">广告排期</label>
                                            <div class="col-xs-10 form-inline ">
                                               <input id="dpd3" placeholder='' class="form-control date-picker " name="ad_start_time_pc" type="text" readonly="true" value="<fmt:formatDate value="${adTactics.ad_start_time_pc}" pattern="yyyy-MM-dd" />" />
                                                    &nbsp;至&nbsp;
                                                <input id="dpd4" placeholder='' class="form-control date-picker " name="ad_end_time_pc"  type="text"  readonly="true" value="<fmt:formatDate value="${adTactics.ad_end_time_pc}" pattern="yyyy-MM-dd" />" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <br>
                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">每日投放次数</label>
                                            <div class="col-xs-10 form-inline ">
                                                <input id="publish_everyday_pc" class="form-control " type="text" name="publish_everyday_pc" value="${adTactics.publish_everyday_pc}" data-bv-notempty="true"
                                                               data-bv-notempty-message="此处不能为空！"  data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$" data-bv-regexp-message="请输入数字！"	></div>
                                        </div>
                                        <div class="form-group">

                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">单UV投放频率</label>
                                            <div class="form-inline col-xs-10 ">
                                                <tag:enum id="select-uvrate-pc" cssClass="form-control-inline input-medium select2me" name="publish_frequency_per_uv_pc" attrs="" cssStyle="width:25%" enumName="t_publish_frequecy" inputType="select" enumKey="${adTactics.publish_frequency_per_uv_pc}"/>
                                                &nbsp;&nbsp;
                                                <div class="inline-block" id="select-uvrate-detail-pc" style="display:none;">
                                                    <tag:enum id="select-uvtime-pc" cssClass="form-control-inline input-medium select2me" name="publish_scheme_per_uv_pc" attrs=""  enumName="t_publish_scheme" inputType="select" enumKey="${adTactics.publish_scheme_per_uv_pc}"/>
                                                    &nbsp;&nbsp;
                                                    <span id="select-uvtime-text-pc">小时</span>
                                                    <input class="form-control input-50" type="text" id="times_pc" name="times_per_union_pc" value="${adTactics.times_per_union_pc}"
                                                              data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$" data-bv-regexp-message="请输入数字！">次</div>

                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <br>
                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">单UV时间间隔</label>
                                            <div class="col-xs-10 form-inline ">
                                                <div class="spinbox spinbox-horizontal inline-block">
                                                    <input type="text" class="spinbox-input form-control"   name="slot_time_interval_pc"  value="${adTactics.slot_time_interval_pc}" data-bv-notempty="true"
                                                               data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="[0-9]+" data-bv-regexp-message="请输入数字！">
                                                    <small class="help-block" data-bv-validator="digits" data-bv-for="slot_time_interval_pc" data-bv-result="VALID" style="display: none;">输入必须为数字！</small>
                                                    <div class="spinbox-buttons btn-group">
                                                        <button type="button" class="btn spinbox-down blueberry">
                                                            <i class="fa fa-minus"></i>
                                                        </button>
                                                        <button type="button" class="btn spinbox-up purple">
                                                            <i class="fa fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <label style="  position:relative;top: -10px;">&nbsp;秒</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">广告展示</label>
                                            <div class="col-xs-10 form-inline ">
                                                <div class="spinbox spinbox-horizontal inline-block">
                                                    <input type="text" class="spinbox-input form-control"   name="slot_residencetime_pc"  value="${adSlot.slot_residencetime_pc}" data-bv-notempty="true"
                                                               data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="[0-9]+" data-bv-regexp-message="请输入数字！">
                                                    <div class="spinbox-buttons btn-group">
                                                        <button type="button" class="btn spinbox-down blueberry">
                                                            <i class="fa fa-minus"></i>
                                                        </button>
                                                        <button type="button" class="btn spinbox-up purple">
                                                            <i class="fa fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <label style="  position:relative;top: -10px;">&nbsp;秒后自动消失</label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <!-- <b>高级配置</b>
                                        -->
                                        <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">若无合适广告投放，启用</label>
                                        <div class="col-xs-10 form-inline ">
                                            <tag:enum cssClass="form-control-inline input-medium select2me" name="compensation_scheme_pc" attrs="" cssStyle="width:25%" enumName="t_compensation_scheme" inputType="select" enumKey="${adTactics.compensation_scheme_pc}"/>
                                            <a href="javascript:void(0);" data-container="body" data-titleclass="bordered-blue" data-class="" data-toggle="popover" data-placement="right" data-title="名词解释" data-content="流量补余：当广告位在用户指定广告来源情况下，如果广告源没有广告返回，平台自动切换到其他广告源，如没有任何广告，则填充公益广告<br>
                                                流量返还：如果没有广告返回，则该次广告曝光不计入此次的流量使用。
                                                <br>
                                                默认开启流量返还。">
                                                <i class="fa fa-question-circle"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">URL白名单</label>
                                        <div class="col-xs-10 form-inline ">
                                            <textarea id="url_whitelist_pc" class="form-control" name="url_whitelist_pc">${adTactics.url_whitelist_pc}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                            <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">扩展代码(PC)</label>
                                            <div class="col-xs-10 form-inline ">
                                                <textarea rows="10" style="width: 100%" class="form-control" name="ext_code_pc">${adSlot.ext_code_pc}</textarea>
                                            </div>
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</div>
</form>

<div class="col-lg-2 col-sm-12 col-xs-12">
<div class="popoverexample pc-end-wrapper" id="ad-preview">
<div class="popover right">
    <div class="arrow"></div>
    <h4 class="popover-title bordered-blueberry">
        <i class="fa fa-list-alt"></i>
        &nbsp;广告效果预览
    </h4>
    <div class="popover-content text-center">
        <div class="end-wrapper">
            <div class="image-wrapper">
                <img id="ad-display" src="">
                <img  id="couplet-image" src=""></div>
        </div>
    </div>
</div>
</div>
</div>

</div>
<br style="clear:both">

<script>
<%--         // 选择平台
        $("#slot_target_floor").change(function(){
            var selfname = ['','pc-end','mobile-end','pc-end'];
            var hidename = ['','mobile-end','pc-end','mobile-end'];
            //隐藏的都显示
            $(".pc-end").removeClass("active");
            $(".tab-pc-end").show().removeClass("active");
            $("#tab-pc-end").addClass("active");
            //默认初始化平台背景图片为pc端
            $("#ad-preview").attr("class","popoverexample pc-end-wrapper");
            var val = $(this).children("option:selected").val();



            if(parseInt(val,10) < 3){
                //隐藏
                $("#"+selfname[val])&&$("#"+selfname[val]).addClass("active");
                $("#tab-"+hidename[val])&&$("#tab-"+hidename[val]).hide();  
                $("#tab-"+selfname[val]).addClass("active");

                //选择的是移动平台，广告预览的背景图需要切换
                if(parseInt(val,10) == 2){
                     $("#ad-preview").attr("class","popoverexample mobile-end-wrapper");
                     $("#ad-display").attr("src","<%=basePath%>img/mobile/specimen.png");
                }
            }else if(parseInt(val,10) == 3){
                $("#"+selfname[val]).addClass("active");
            }

        }) --%>
        //平台选择，图片需要切换
        $(document).on("click",'.tab-pc-end',function(){
            if($(this).attr("id") == "tab-mobile-end"){
                $("#ad-preview").attr("class","popoverexample mobile-end-wrapper");
                $("#ad-display").attr("src","<%=basePath%>img/mobile/specimen.png");
            }else{
                $("#ad-preview").attr("class","popoverexample pc-end-wrapper");
            }
        });
        //PC端点击尺寸切换图片
        $(document).on("click",'.brand-ad input[type="radio"]',function(){
            //还原变形效果
            $(".image-wrapper").attr("class","image-wrapper");

            var type = $(this).parents(".brand-ad").eq(0).data("type");
            var pic_url = "<%=basePath%>"+"img/"+type+"/"+$(this).val()+".png";
            $("#ad-display").hide();
            $("#ad-display").attr("src",encodeURI(pic_url)).fadeIn();
            //对联的图片
            $("#couplet-image").attr("src",encodeURI(pic_url));
        })  
         //PC端当点击右下角对联等，需要给图片添加样式
        $(document).on("click",'.transform-pc input[type="radio"]',function(){
            var type = $(this).parents(".transform-pc").eq(0).data("type");

            $(".image-wrapper").attr("class","image-wrapper "+type);
            if(type=="couplet-side"){ 
                $("#couplet-image").hide().fadeIn();
            }else{
                $("#couplet-image").hide()
            }
        });   
        //移动端顶栏底栏切换
        $(document).on("click",'.mobile-bottom-side,.mobile-up-side',function(){
            if($(this).attr("class").indexOf("mobile-up-side")!=-1){
                $("#ad-display").removeClass("down").addClass("up");
            }else{
                $("#ad-display").removeClass("up").addClass("down");
            }
        });
        
/*  //右下角 ad-right-classif
    $(document).on("click",'.ad-right-classif ul li',function(){
        
        var $div = $(this).parent("ul").siblings(".tab-content").eq(0).children("div.tab-pane").eq($(this).index());
        var val = $div.find("input[type='radio']").eq(0).val();
        var url = val;
        console.log(url);
        //默认选中第一个
        if(val){
            var $radiobtn = $div.find("input[name='slot_width_pc'][value='"+val+"']");
            $radiobtn.trigger("click");
                
        }
                
    });
    //左上角 
    $(document).on("click",'ul.ad-top-classif li',function(){
        var index = $(this).index();
        $(this).parent("ul").siblings(".tab-content").eq(0).children(".tab-pane").eq(index).find("ul li").eq(0).children("a").trigger("click");
    }); */
        
    </script>
<script>
        $("#select-uvrate-mobile").change(function(){
            if($(this).val() == 1){
                $("#select-uvrate-detail-mobile").hide();
            }else{
                $("#select-uvrate-detail-mobile").show();
            }
        });
        $("#select-uvtime-mobile").change(function(){
            if($(this).val() == 0){
                $("#select-uvtime-text-mobile").html("天");
                $("#times_mobile").val("");
            }else{
                $("#select-uvtime-text-mobile").html("小时");
                $("#times_mobile").val("");
            }
        })                    
    </script>
<script>
        $("#select-uvrate-pc").change(function(){
            if($(this).val() == 1){
                $("#select-uvrate-detail-pc").hide();
            }else{
                $("#select-uvrate-detail-pc").show();
            }
        });
        $("#select-uvtime-pc").change(function(){
            if($(this).val() == 0){
                $("#select-uvtime-text-pc").html("天");
                $("#times_pc").val("");
            }else{
                $("#select-uvtime-text-pc").html("小时");
                $("#times_pc").val("");
            }
        })                    
    </script>

<script>
       $(document).ready(function () {
           
           jQuery(document).ready(function() {
                FormSamples.init({
                    formId:'ad-create-form-input'
                });
            
            });
            //表单校验
        /*     $("#ad-create-form-input").bootstrapValidator({
                'excluded': [':disabled']
    
            }); */
        });
       
       
       $(function(){
    	   
           //根据不同的平台显示不同的tab页
           var selfname = ['','pc-end','mobile-end','pc-end'];
           var hidename = ['','mobile-end','pc-end','mobile-end'];
           var target = $("#slot_target_floor").val();
            if (target == 2) {
                $("#"+selfname[target])&&$("#"+selfname[target]).addClass("active");
                $("#tab-"+hidename[target])&&$("#tab-"+hidename[target]).hide();    
                $("#tab-"+selfname[target]).addClass("active");
            } else if (target == 3) {
                $("#"+selfname[target]).addClass("active");
            } else {
                $("#"+selfname[target])&&$("#"+selfname[target]).addClass("active");
                $("#tab-"+hidename[target])&&$("#tab-"+hidename[target]).hide();    
                $("#tab-"+selfname[target]).addClass("active");
            } 
            
          //根据pub_id生成site的列表
            $.ajax({          
                 url:"${ctx}/ssp/config/adSite/siteAjax?pubId="+$("#pub_id").val(),
                 type : "get",    
                 cache : false,    
                 dataType : "json",   
                 success:function(data){  
                 if(data!="0"){  
                    	var siteId = document.getElementById('site_id');  
                    	//清空数组  
                    	siteId.length = 0;  
                    	for(var i=0;i<data.length;i++){  
                         var xValue=data[i].site_id;    
                         var xText=data[i].site_name;    
                         
                         if(xValue==${adSlot.site_id.site_id}){
                        	 var option=new Option(xText,xValue,true,true);                        	 
                        	 siteId.add(option);                           	 
                         }else{
                        	 var option=new Option(xText,xValue);
                        	 siteId.add(option);   
                         } 
                    	}  
                  }else{  
                     	var siteId = document.getElementById('site_id');  
                     	siteId.length = 0;  
                  	}  
               	}  
           	});
          
            //如果目标平台不是双平台的时候,目标平台切换的时候实现页面数据清空
            //根据用户选择的不同平台类型，给PC或者移动相关的字段赋不同的初值
            $("#slot_target_floor").change(function(){
                
                //隐藏的都显示
                $(".pc-end").removeClass("active");
                $(".tab-pc-end").show().removeClass("active");
                $("#tab-pc-end").addClass("active"); 
                //默认初始化平台背景图片为pc端
                $("#ad-preview").attr("class","popoverexample pc-end-wrapper"); 
                
                
                var val = $(this).val();
                if(val==1){
                    $("#"+selfname[val])&&$("#"+selfname[val]).addClass("active");
                    $("#tab-"+hidename[val])&&$("#tab-"+hidename[val]).hide();  
                    $("#tab-"+selfname[val]).addClass("active"); 
                    
                    $("#slot_type_pc").val(0);
                    $("#slot_shape_float_pc").val(1);
                  	//平台切换的时候显示默认值
                    $('#myTab6 a[href="#pc-ad-float"]').tab('show');
                    $('#myTab7 a[href="#pc-ad-float-right"]').tab('show');
                    
                    $("#slot_type_mobile").val("");
                    $("#slot_shape_float_mobile").val("");
                    $("#slot_shape_fixed_mobile").val("");
                    //平台切换的时候清对应策略表里的数据
                    $("#publish_everyday_mobile").val("");
                    $("#url_whitelist_mobile").val("");
                    //平台切换的时候给单UV投放频率一个默认值,在页面上选中
                    //$("#select-uvrate-pc").prop("defaultValue",1);
                }else if(val==2){
                    $("#"+selfname[val])&&$("#"+selfname[val]).addClass("active");
                    $("#tab-"+hidename[val])&&$("#tab-"+hidename[val]).hide();  
                    $("#tab-"+selfname[val]).addClass("active"); 
                    //选择的是移动平台，广告预览的背景图需要切换
                    $("#ad-preview").attr("class","popoverexample mobile-end-wrapper");
                    $("#ad-display").attr("src","<%=basePath%>img/mobile/specimen.png");
                    
                    $("#slot_type_mobile").val(0);
                    $("#slot_shape_float_mobile").val(2);
                    //平台切换的时候显示默认值
                    $('#myTab2 a[href="#mobile-ad-float"]').tab('show');
                    $('#myTab3 a[href="#mobile-ad-float-bottom"]').tab('show');
                    $("#slot_type_pc").val("");
                    $("#slot_shape_float_pc").val("");
                    $("#slot_shape_fixed_pc").val("");
                    //策略切换的时候清对应策略表里的数据
                    $("#publish_everyday_pc").val("");
                    $("#url_whitelist_pc").val("");
                    //平台切换的时候给单UV投放频率一个默认值
                    //$("#select-uvrate-mobile").prop("defaultValue",1);
                }else{
                    $("#"+selfname[val]).addClass("active");
                    $("#slot_type_pc").val(0);
                    $("#slot_shape_float_pc").val(1);
                    $("#slot_type_mobile").val(0);
                    $("#slot_shape_float_mobile").val(2);
                }
            });
            
         //移动端
            var slot_type_mobile = $("#slot_type_mobile").val();
            if (slot_type_mobile == 0) {
                $('#myTab2 a[href="#mobile-ad-float"]').tab('show');
            } else if (slot_type_mobile == 1) {
                $('#myTab2 a[href="#mobile-ad-fix"]').tab('show');
            } else {
                $('#myTab2 a:last').tab('show');
            }
        
           $('#myTab2 a').click(function (e) { 
               e.preventDefault();
                var selectedHref = $(this).attr('href');
            if(selectedHref=="#mobile-ad-float"){
                $("#slot_type_mobile").val(0);
                $("#slot_shape_float_mobile").val(2);
                $("#slot_shape_fixed_mobile").val("");
            }else if(selectedHref=="#mobile-ad-fix"){
                $("#slot_type_mobile").val(1);
                $("#slot_shape_float_mobile").val("");
                $("#slot_shape_fixed_mobile").val(3);
            }else{
                $("#slot_type_mobile").val(2);
            }
           })
           
          var slot_shape_float_mobile = $("#slot_shape_float_mobile").val();
          if (slot_shape_float_mobile == 2) {
                $('#myTab3 a[href="#mobile-ad-float-bottom"]').tab('show');
          } else if (slot_shape_float_mobile == 4) {
                $('#myTab3 a[href="#mobile-ad-float-top"]').tab('show');
          }
                
          $('#myTab3 a').click(function (e) { 
               e.preventDefault();
                var selectedHref = $(this).attr('href');
            if(selectedHref=="#mobile-ad-float-bottom"){
                $("#slot_shape_float_mobile").val(2);
            }else if(selectedHref=="#mobile-ad-float-top"){
                $("#slot_shape_float_mobile").val(4);
            }
           })
           
           var slot_shape_fixed_mobile = $("#slot_shape_fixed_mobile").val();
           if (slot_shape_fixed_mobile == 3) {
                $('#myTab4 a[href="#mobile-ad-fix-1"]').tab('show');
           } else if (slot_shape_fixed_mobile == 2) {
                $('#myTab4 a[href="#mobile-ad-fix-2"]').tab('show');
           }
        
           $('#myTab4 a').click(function (e) { 
               e.preventDefault();
                var selectedHref = $(this).attr('href');
            if(selectedHref=="#mobile-ad-fix-1"){
                $("#slot_shape_fixed_mobile").val(3);
            }else if(selectedHref=="#mobile-ad-fix-2"){
                $("#slot_shape_fixed_mobile").val(2);
            }
           })
           
           //pc端
           var slot_type_pc = $("#slot_type_pc").val();
           if (slot_type_pc == 0) {
                $('#myTab6 a[href="#pc-ad-float"]').tab('show');
                $('#t_ad_slot_rect_size').val("");
           } else if (slot_type_pc == 1) {
                $('#myTab6 a[href="#pc-ad-fix"]').tab('show');
           } else {
                $('#myTab6 a:last').tab('show');
           }
        
           $('#myTab6 a').click(function (e) { 
               e.preventDefault();
                var selectedHref = $(this).attr('href');
            if(selectedHref=="#pc-ad-float"){
                $("#slot_type_pc").val(0);
                $("#slot_shape_fixed_pc").val("");
                $("#slot_shape_float_pc").val(1);
            }else if(selectedHref=="#pc-ad-fix"){
                $("#slot_type_pc").val(1);
                $("#slot_shape_float_pc").val("");
                $("#slot_shape_fixed_pc").val(0);
                
            }else{
                $("#slot_type_pc").val(2);
            }
           })
           
           var slot_shape_float_pc = $("#slot_shape_float_pc").val();
           if (slot_shape_float_pc == 1) {
                $('#myTab7 a[href="#pc-ad-float-right"]').tab('show');
           } else if (slot_shape_float_pc == 0) {
                $('#myTab7 a[href="#pc-ad-float-couplet"]').tab('show');
           } else if (slot_shape_float_pc == 2) {
                $('#myTab7 a[href="#pc-ad-float-bottom"]').tab('show');
           } else {
                $('#myTab7 a:last').tab('show');
           }
        
           $('#myTab7 a').click(function (e) { 
               e.preventDefault();
                var selectedHref = $(this).attr('href');
            if(selectedHref=="#pc-ad-float-right"){
                $("#slot_shape_float_pc").val(1);
            }else if(selectedHref=="#pc-ad-float-couplet"){
                $("#slot_shape_float_pc").val(0);
            }else if(selectedHref=="#pc-ad-float-bottom"){
                $("#slot_shape_float_pc").val(2);
            }else{
                $("#slot_shape_float_pc").val(3);
            }
           })
       
           var slot_shape_fixed_pc = $("#slot_shape_fixed_pc").val();
           if (slot_shape_fixed_pc == 0) {
                $('#myTab8 a[href="#pc-ad-fix-1"]').tab('show');
           } else if (slot_shape_fixed_pc == 1) {
                $('#myTab8 a[href="#pc-ad-fix-2"]').tab('show');
           } else {
                $('#myTab8 a:last').tab('show');
           }
        
           $('#myTab8 a').click(function (e) { 
               e.preventDefault();
                var selectedHref = $(this).attr('href');
            if(selectedHref=="#pc-ad-fix-1"){
                $("#slot_shape_fixed_pc").val(0);
            }else if(selectedHref=="#pc-ad-fix-2"){
                $("#slot_shape_fixed_pc").val(1);
            }else{
                $("#slot_shape_fixed_pc").val(2);
            }
           })
           
           var select_uvrate_mobile = $("#select-uvrate-mobile").val();
            if (select_uvrate_mobile == 0) {
                $("#select-uvrate-detail-mobile").show();
            } else {
                $("#select-uvrate-detail-mobile").hide();
            }

            var select_uvrate_pc = $("#select-uvrate-pc").val();
            if (select_uvrate_pc == 0) {
                $("#select-uvrate-detail-pc").show();
            } else {
                $("#select-uvrate-detail-pc").hide();
            }
           
       })


       //初始化平台图片和平台对应的画
       var val_platform = $("#slot_target_floor option:selected").val();
       switch (val_platform) {
           case "3":
               ;
           case "2":
               //初始化mobile平台图片
               $("#ad-preview").attr("class", "popoverexample mobile-end-wrapper");
               $("#ad-display").attr("src", "<%=basePath%>img/mobile/specimen.png");
               //底栏还是顶栏
               if ($(".mobile-bottom-side").attr("class").indexOf("active") != -1) {
                   $("#ad-display").removeClass("up").addClass("down");
               } else {
                   $("#ad-display").removeClass("down").addClass("up");
               }
               if (val_platform != "3") break;
           case "1":
               //初始化PC平台图片
               $("#ad-preview").attr("class", "popoverexample pc-end-wrapper");
               //初始化选中的标签：浮动，固定还是图+
               var tab = ['float', 'fix', 'pic'];
               var index = $("#pc-end ul.ad-top-classif li.active").index();
               var radioSelected = $("input[name='slot_width_pc']:checked").val();
               //添加底栏，对联等的样式
               var index_tab = $("#slot_shape_float_pc").val();
               var classname = ['couplet-side', 'right-bottom', 'bottom-side', 'side-side'];

               index_tab && $(".image-wrapper").attr("class", "image-wrapper " + classname[index_tab]);
               $("#ad-display").attr("src", "<%=basePath%>img/" + tab[index] + "/" + encodeURI(radioSelected) + ".png");
               $("#couplet-image").attr("src", "<%=basePath%>img/" + tab[index] + "/" + encodeURI(radioSelected) + ".png");
               if (val_platform != "3") break;
       }


       //日期控件设置
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        	var checkin = $('#dpd1').datepicker({
 	       onRender: function(date) {
 	       return date.valueOf() < now.valueOf() ? 'disabled' : '';
 	       }
 	       }).on('changeDate', function(ev) {
 	       if (ev.date.valueOf() > checkout.date.valueOf()) {
 	       var newDate = new Date(ev.date)
 	       newDate.setDate(newDate.getDate() + 1);
 	       checkout.setValue(newDate);
 	       }
 	       checkin.hide();
 	       $('#dpd2').focus();
 	       }).data('datepicker');
 	       var checkout = $('#dpd2').datepicker({
 	       onRender: function(date) {
 	       return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
 	       }
 	       }).on('changeDate', function(ev) {
 	       checkout.hide();
 	       }).data('datepicker');
 	       
 	       	   var checkin2 = $('#dpd3').datepicker({
 		       onRender: function(date) {
 		       return date.valueOf() < now.valueOf() ? 'disabled' : '';
 		       }
 		       }).on('changeDate', function(ev) {
 		       if (ev.date.valueOf() > checkout2.date.valueOf()) {
 		       var newDate2 = new Date(ev.date)
 		       newDate2.setDate(newDate2.getDate() + 1);
 		       checkout2.setValue(newDate2);
 		       }
 		       checkin2.hide();
 		       $('#dpd4').focus();
 		       }).data('datepicker');
 		       var checkout2 = $('#dpd4').datepicker({
 		       onRender: function(date) {
 		       return date.valueOf() <= checkin2.date.valueOf() ? 'disabled' : '';
 		       }
 		       }).on('changeDate', function(ev) {
 		       checkout2.hide();
 		       }).data('datepicker');
        
        $('.spinbox').spinbox({step:10});
        
        //ajax pub_id和site_id联动菜单
        $("#pub_id").change(function(){
        	var pubId = $(this).val();
        	console.log(pubId);
        	$.ajax({          
                url:"${ctx}/ssp/config/adSite/siteAjax?pubId="+pubId,
                type : "get",    
                cache : false,    
                dataType : "json",   
                success:function(data){  
                if(data!="0"){  
                   	var siteId = document.getElementById('site_id');  
                   	//清空数组  
                   	siteId.length = 0;  
                   	for(var i=0;i<data.length;i++){  
                        var xValue=data[i].site_id;    
                        var xText=data[i].site_name;    
                        var option=new Option(xText,xValue);    
                        siteId.add(option);    
                   	}  
                 }else{  
                    	var siteId = document.getElementById('siteId');  
                    	siteId.length = 0;  
                 	}  
              	}  
          	});  
        
        });
    </script>