<%@page import="com.junfu360.common.utils.AdDateUtil"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adSourceData/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADSOURCEDATA_" ></c:set>
<c:set scope="page" var="dataTitle" value="原始广告位数据汇总表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adSourceData_1" ></c:set>
<%
request.setAttribute("yesterday", AdDateUtil.getYesterday("yyyy-MM-dd"));
%>
    <style>
        .left-10{
            margin-left: 10px;
        }
        td{
        	bgcolor:"#FFFFFF";
        }
        td input{ 
        	border:none;
        	border-left:0px;border-top:0px;border-right:0px;border-bottom:1px;
        }
    </style>
    <div class="">
     <div class=" form-inline">
    	<form id="${formId }_1" method="post" action="/ssp/logs/adSourceData/refreshData" class="bv-form" role="form">
        
        <select id="selectData" style="width:10%">
            <option value="2">全部</option>
            <option value="1">已录入 </option>
            <option value="0">未录入<option>
        </select>
        <!-- <input class="form-control left-10" id="reservation"> -->
        <label class="left-10">广告源:&nbsp;</label>
       	<input id="sourceCommit" type="hidden">
       	<input id="advertCommit" type="hidden">
		<select id="sourceName" name="source_name"  style="width:10%">
			<option style="width:100%" value="">全部</option>
				<c:forEach items="${sourceList}" var="item" >
					<option style="width:100%" value="${item.source_id}">${item.source_name}</option>
				</c:forEach>
		</select>    
		 <label class="left-10">直客:&nbsp;</label>
		<select id="advertName" name="advert_name"  style="width:10%">
		<option style="width:100%" value="">全部</option>
				<c:forEach items="${advertList}" var="item" >
					<option style="width:100%" value="${item.advert_id}">${item.name}</option>
				</c:forEach>
		</select>    
		
		 <div class="form-group ">
							<label  class="col-sm-4 control-label no-padding-right">日期</label>
							<div class="col-sm-8">
							<input placeholder='' class="form-control date-range-picker " name="statdate" id="statdate" type="text" value="${date }" />
	   </div>
		 </div>    
        	<button id="selectButton" type="button" class="btn btn-primary pull-right">查询</button>
        </form>
    </div>
	
	<div id="dataList" class=" row">
	
	</div>
    
    </div>

    <script type="text/javascript">
    
    $(function() {
        //-------------------------Visitor Sources Pie Chart----------------------------------------//
        $("#sourceName").val("");
  		$("#advertName").val("");
  		var selectData = {
					selectInput:$("#selectData option:selected").val(),
					sourceId :  $("#sourceCommit").val(),
					advertId :  $("#advertCommit").val(),
					statdate :  $("#statdate").val()
			}; 
        $.ajax({          
		        url:"${ctx}/ssp/logs/adSourceData/refreshData",
		        type : "get",    
		        cache : false, 
		        data:selectData,
		        dataType : "html",   
		        success:function(data){  
		        	$("#dataList").html(data);
		  		}
			});
  		
  		
  		$('.date-range-picker').datepicker();
        
    })
    
    	$("#sourceName").change(function(){
			   $("#sourceCommit").val($("#sourceName").val()); 		
    	});
	$("#advertName").change(function(){
		   $("#advertCommit").val($("#advertName").val()); 		
	});
		$("#selectButton").click(function(){
			$('#selectButton').removeAttr("disabled");
			var selectData = {
					selectInput:$("#selectData option:selected").val(),
					sourceId :  $("#sourceCommit").val(),
					advertId :  $("#advertCommit").val(),
					statdate :  $("#statdate").val()
			}; 
			
			console.log(selectData);
			$.ajax({          
		        url:"${ctx}/ssp/logs/adSourceData/refreshData",
		        data:selectData,
		        type : "post",  
		        cache : false,    
		        dataType : "html",   
		        success:function(data){  
		        	$("#dataList").html(data);
		  		}
			});
		});
    
    
   
    </script>
