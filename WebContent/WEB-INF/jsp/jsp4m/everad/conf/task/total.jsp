<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<head>
<title>终端明细号码</title>
</head>
 
<form class="form-horizontal">
	<div class="row">
		  <div class="col-lg-3 col-sm-6 col-xs-12">
				<div class="databox-right bg-white bordered bordered-platinum">
				    <span class="databox-number sky">${rescount}</span>
				    <div class="databox-text darkgray">推送总数量</div>
				</div>
		 </div>
	
	
		<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="databox-right bg-white bordered bordered-platinum">
		    <span class="databox-number sky">${showcount}</span>
		    <div class="databox-text darkgray">展示总数量</div>
		</div>
		</div>
		<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="databox-right bg-white bordered bordered-platinum">
		    <span class="databox-number sky">${clicount}</span>
		    <div class="databox-text darkgray">点击总数量</div>
		</div>
		</div>
	
		<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="databox-right bg-white bordered bordered-platinum">
		    <span class="databox-number sky">${clocount}</span>
		    <div class="databox-text darkgray">关闭总数量</div>
		</div>
		</div>
	</div>
	<div class="row">
		  <div class="col-lg-3 col-sm-6 col-xs-12">
				<div class="databox-right bg-white bordered bordered-platinum">
				    <span class="databox-number sky">${ruser}</span>
				    <div class="databox-text darkgray">推送用户总数</div>
				</div>
		 </div>
	
	
		<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="databox-right bg-white bordered bordered-platinum">
		    <span class="databox-number sky">${suser}</span>
		    <div class="databox-text darkgray">展示用户总数</div>
		</div>
		</div>
		<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="databox-right bg-white bordered bordered-platinum">
		    <span class="databox-number sky">${showper}%</span>
		    <div class="databox-text darkgray">展示成功率</div>
		</div>
		</div>
	
		<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="databox-right bg-white bordered bordered-platinum">
		    <span class="databox-number sky">${cliper}%</span>
		    <div class="databox-text darkgray">点击率</div>
		</div>
		</div>
	</div>
	<div class="row">
		  <div class="col-lg-3 col-sm-6 col-xs-12">
				<div class="databox-right bg-white bordered bordered-platinum">
				    <span class="databox-number sky">${showUserPir}%</span>
				    <div class="databox-text darkgray">用户到达率</div>
				</div>
		 </div>
	
	
		<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="databox-right bg-white bordered bordered-platinum">
		    <span class="databox-number sky">${ip}</span>
		    <div class="databox-text darkgray">ip总数</div>
		</div>
		</div>
	</div>
</form>
