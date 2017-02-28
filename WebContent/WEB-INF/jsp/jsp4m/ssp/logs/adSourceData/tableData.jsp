<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adSourceData/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADSOURCEDATA_" ></c:set>
<c:set scope="page" var="dataTitle" value="原始广告位数据汇总表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adSourceData_1" ></c:set>
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
 
 <div class="col-sm-12">
    	<form id="form1" method="post" action="${ctx }/ssp/logs/adSourceData/saveData" class="bv-form" >
      		<div class="form-body">
        		<div class="col-lg-12 col-sm-12 col-xs-12">
          			<div class="well with-header clearfix">
            			<div class="header bordered-palegreen">第三方</div>
            				<div class="form-group clearfix">
              					<div class=" col-sm-12">
              						<table class="table table-striped table-hover table-bordered" id="editabledatatable">
           									 <thead>
                								<tr role="row">
                    								<th>时间</th>
                   		 							<th>广告源</th>
                   		 							<th>计费类型</th>
                    								<th>认可展示</th>
                    								<th>认可点击</th>
                    								<th>认可点击率(%)</th>
                    								<th>认可CPC</th>
                    								<th>自有展示</th>
                    								<th>自有点击</th>
                    								<th>自有点击率(%)</th>
                    								<th>CPC</th>
                    								<th>CPM</th>
                    								<th>收入</th>
                    								<th></th>
                								</tr>
           		 							</thead>
           		 							
           		 							<tbody>
           		 							<input id="thirdindex" type="hidden"/>
           		 							 
           		 							
              							<c:forEach items="${thirdLists}" var="item" varStatus="s">
											<c:if test="${item.source_id.source_name!=null && item.source_slot_id.source_slot_name!=null}">
												<input type="hidden" name="thirdList[${s.index }].id" type="text" value="${item.id}"/>
                    							<input type="hidden" name="thirdList[${s.index }].source_id.source_id" type="text" value="${item.source_id.source_id}"/>
                    							<input type="hidden" name="thirdList[${s.index }].source_slot_id.source_slot_id" type="text" value="${item.source_slot_id.source_slot_id}"/>
                    							<input type="hidden" name="thirdList[${s.index }].advert_id.advert_id" type="text" value="${item.advert_id.advert_id}"/>
                    							<input type="hidden" name="thirdList[${s.index }].wh_id.wh_id" type="text" value="${item.wh_id.wh_id}"/>
                    							<input type="hidden" name="thirdList[${s.index }].dsp_type" type="text" value="${item.dsp_type}"/>
                    							<input id="clickrate3${s.index }" type="hidden" name="thirdList[${s.index }].clickrate" type="text" value="${item.clickrate}"/>
                    							<input type="hidden" name="thirdList[${s.index }].statdate" type="text" readonly="true" 
                    										value="<fmt:formatDate value="${item.statdate}" pattern="yyyy-MM-dd"/>"/>
                    							<input type="hidden" name="thirdList[${s.index }].cpc" type="text" value="${item.cpc}"/>
                    							<input type="hidden" name="thirdList[${s.index }].self_pv" type="text" value="${item.self_pv}"/>
                    							<input type="hidden" name="thirdList[${s.index }].self_click" type="text" value="${item.self_click}"/>
                    							<input id="selfclickrate3${s.index }" type="hidden" name="thirdList[${s.index }].self_clickrate" type="text" value="${item.self_clickrate}"/>
                    							<input type="hidden" name="thirdList[${s.index }].self_cpc" type="text" value="${item.self_cpc}"/>
                    							<input type="hidden" name="thirdList[${s.index }].self_cpm" type="text" value="${item.self_cpm}"/>
                    							<input id="status3${s.index }" type="hidden" name="thirdList[${s.index }].status" type="text" value="${item.status}"/>
                									<tr>
                    									<td>
                    										<fmt:formatDate value="${item.statdate}" pattern="yyyy-MM-dd"/>
                    									</td>
                    									<td>${item.source_id.source_name}</td>
                    									<td>
                    									<c:choose>
                    									<c:when test="${item.cost_type==1}">
                    									cpc
                    									</c:when>
                    									<c:when test="${item.cost_type==2}">
                    									cpm
                    									</c:when>
                    									<c:otherwise>
                    									<font color="green">
                    									 </c:otherwise>      
                    									</c:choose>
                    									</td>
                    									<td>
                    										<div id="pv3td${s.index }" class="thirdjishu">
                    											${item.pv}
                    										</div>
                    										<div id="pv3input${s.index }" class="thirdoushu">
                    											<input class="form-control " id="thirdpv${s.index }" name="thirdList[${s.index }].pv" type="text" value="${item.pv}" 
                    											  onfocus="$('#thirdindex').val(${s.index })" onchange="calculateClickRate()" />
                    										</div>
                    									</td>
                    									<td>
                    										<div  id="click3td${s.index }" class="thirdjishu">
                    											${item.click}
                    										</div>
                    										<div id="click3input${s.index }" class="thirdoushu">
                    											<input id="thirdclick${s.index }" class="form-control " name="thirdList[${s.index }].click" type="text" value="${item.click}"
                    											onfocus="$('#thirdindex').val(${s.index })" onchange="calculateClickRate()"/>
                    										</div>
                    									</td>
                    									<td id="thirdclickrate${s.index }">
                    										${item.clickrate}
                    									</td>
                    									<td id="thirdcpc${s.index }">
                    										${item.cpc}
                    									</td>
                    									<td id="thirdselfpv${s.index }">
                    										${item.self_pv}
                    									</td>
                    									<td id="thirdselfclick${s.index }">
                    										${item.self_click}
                    									</td>
                    									<td id="thirdselfclickrate${s.index }">
                    										${item.self_clickrate}
                    									</td>
                    									<td id="thirdselfcpc${s.index }">
                    										${item.self_cpc}
                    									</td>
                   	 									<td id="thirdselfcpm${s.index }">
                   	 										${item.self_cpm}
                   	 									</td>
                    									<td>
                    										<div id="income3td${s.index }" class="thirdjishu">
                    											${item.income}
                    										</div>
                    										<div id="income3input${s.index }" class="thirdoushu">
                    											<input id="thirdincome${s.index }" class="form-control " name="thirdList[${s.index }].income" type="text" value="${item.income}"
                    											  onfocus="$('#thirdindex').val(${s.index })" onchange="calculatethird()"/>
                    										</div>
                    									</td>
                   										<td>
                        								<div id="buttonE${s.index }" class="thirdjishu">
															<button type="button" class="btn btn-default pull-left editthirdjishu" id="edit3${s.index }" onmouseover="buttonhover(${s.index },${item.id })">编辑</button>                   										
                   										</div>
                   										<div id="buttonS${s.index }" class="thirdoushu">
                   											<button id="save3${s.index }" type="submit" class="btn btn-default pull-left thirdsave">保存</button>                   										
                   											<button type="button" class="btn btn-default pull-left cancelthirdoushu" id="cancel3${s.index }" onmouseover="$('#thirdindex').val(${s.index })" >取消</button> 
                   										</div>
                    									</td>
                									</tr>
											</c:if>              						
              							</c:forEach>
              								</tbody>
              						</table>	
              					</div>
              				</div>
              		</div>
              	</div>
          </div>
          </form>
    </div>
  
  <div class="col-sm-12">
    	<form id="form2" method="post" action="${ctx }/ssp/logs/adSourceData/saveData" class="bv-form" >
      		<div class="form-body">
        		<div class="col-lg-12 col-sm-12 col-xs-12">
          			<div class="well with-header clearfix">
            			<div class="header bordered-palegreen">直客</div>
            				<div class="form-group clearfix">
              					<div class=" col-sm-12">
              						<table class="table table-striped table-hover table-bordered" id="editabledatatable">
           									 <thead>
                								<tr role="row">
                    								<th>时间</th>
                   		 							<th>广告源</th>
                   		 							<th>计费类型</th>
                    								<th>认可展示</th>
                    								<th>认可点击</th>
                    								<th>认可点击率(%)</th>
                    								<th>认可CPC</th>
                    								<th>自有展示</th>
                    								<th>自有点击</th>
                    								<th>自有点击率(%)</th>
                    								<th>CPC</th>
                    								<th>CPM</th>
                    								<th>收入</th>
                    								<th></th>
                								</tr>
           		 							</thead>
           		 							
           		 							<tbody>
           		 							<input id="thirdindex_wh" type="hidden"/>
           		 							 
           		 							
              							<c:forEach items="${selfLists}" var="item" varStatus="s">
										 
												<input type="hidden" name="selfList[${s.index }].id" type="text" value="${item.id}"/>
                    							<input type="hidden" name="selfList[${s.index }].source_id.source_id" type="text" value="${item.source_id.source_id}"/>
                    							<input type="hidden" name="selfList[${s.index }].source_slot_id.source_slot_id" type="text" value="${item.source_slot_id.source_slot_id}"/>
                    							<input type="hidden" name="selfList[${s.index }].advert_id.advert_id" type="text" value="${item.advert_id.advert_id}"/>
                    							<input type="hidden" name="selfList[${s.index }].wh_id.wh_id" type="text" value="${item.wh_id.wh_id}"/>
                    							<input type="hidden" name="selfList[${s.index }].dsp_type" type="text" value="${item.dsp_type}"/>
                    							<input id="clickrate2${s.index }" type="hidden" name="selfList[${s.index }].clickrate" type="text" value="${item.clickrate}"/>
                    							<input type="hidden" name="selfList[${s.index }].statdate" type="text" readonly="true" 
                    										value="<fmt:formatDate value="${item.statdate}" pattern="yyyy-MM-dd"/>"/>
                    							<input type="hidden" name="selfList[${s.index }].cpc" type="text" value="${item.cpc}"/>
                    							<input type="hidden" name="selfList[${s.index }].self_pv" type="text" value="${item.self_pv}"/>
                    							<input type="hidden" name="selfList[${s.index }].self_click" type="text" value="${item.self_click}"/>
                    							<input id="selfclickrate2${s.index }" type="hidden" name="selfList[${s.index }].self_clickrate" type="text" value="${item.self_clickrate}"/>
                    							<input type="hidden" name="selfList[${s.index }].self_cpc" type="text" value="${item.self_cpc}"/>
                    							<input type="hidden" name="selfList[${s.index }].self_cpm" type="text" value="${item.self_cpm}"/>
                    							<input id="status2${s.index }" type="hidden" name="selfList[${s.index }].status" type="text" value="${item.status}"/>
                									<tr>
                    									<td>
                    										<fmt:formatDate value="${item.statdate}" pattern="yyyy-MM-dd"/>
                    									</td>
                    									<td>${item.advert_id.name}</td>
                    									<td>
                    									<c:choose>
                    									<c:when test="${item.cost_type==1}">
                    									cpc
                    									</c:when>
                    									<c:when test="${item.cost_type==2}">
                    									cpm
                    									</c:when>
                    									<c:otherwise>
                    									<font color="green">
                    									 </c:otherwise>      
                    									</c:choose>
                    									</td>
                    									<td>
                    										<div id="pv2td${s.index }" class="thirdjishu">
                    											${item.pv}
                    										</div>
                    										<div id="pv2input${s.index }" class="thirdoushu">
                    											<input class="form-control " id="thirdpv_wh${s.index }" name="selfList[${s.index }].pv" type="text" value="${item.pv}" 
                    											  onfocus="$('#thirdindex_wh').val(${s.index })" onchange="calculateClickRate_wh()" />
                    										</div>
                    									</td>
                    									<td>
                    										<div  id="click2td${s.index }" class="thirdjishu">
                    											${item.click}
                    										</div>
                    										<div id="click2input${s.index }" class="thirdoushu">
                    											<input id="thirdclick_wh${s.index }" class="form-control " name="selfList[${s.index }].click" type="text" value="${item.click}"
                    											onfocus="$('#thirdindex_wh').val(${s.index })" onchange="calculateClickRate_wh()"/>
                    										</div>
                    									</td>
                    									<td id="thirdclickrate_wh${s.index }">
                    										${item.clickrate}
                    									</td>
                    									<td id="thirdcpc_wh${s.index }">
                    										${item.cpc}
                    									</td>
                    									<td id="thirdselfpv_wh${s.index }">
                    										${item.self_pv}
                    									</td>
                    									<td id="thirdselfclick_wh${s.index }">
                    										${item.self_click}
                    									</td>
                    									<td id="thirdselfclickrate_wh${s.index }">
                    										${item.self_clickrate}
                    									</td>
                    									<td id="thirdselfcpc_wh${s.index }">
                    										${item.self_cpc}
                    									</td>
                   	 									<td id="thirdselfcpm_wh${s.index }">
                   	 										${item.self_cpm}
                   	 									</td>
                    									<td>
                    										<div id="income2td${s.index }" class="thirdjishu">
                    											${item.income}
                    										</div>
                    										<div id="income2input${s.index }" class="thirdoushu">
                    											<input id="thirdincome_wh${s.index }" class="form-control " name="selfList[${s.index }].income" type="text" value="${item.income}"
                    											  onfocus="$('#thirdindex_wh').val(${s.index })" onchange="calculatethird_wh()"/>
                    										</div>
                    									</td>
                   										<td>
                        								<div id="buttonEE${s.index }" class="thirdjishu">
															<button type="button" class="btn btn-default pull-left editthirdjishu" id="edit2${s.index }" onmouseover="buttonhover_wh(${s.index },${item.id })">编辑</button>                   										
                   										</div>
                   										<div id="buttonSS${s.index }" class="thirdoushu">
                   											<button id="save2${s.index }" type="submit" class="btn btn-default pull-left thirdsave">保存</button>                   										
                   											<button type="button" class="btn btn-default pull-left cancelthirdoushu" id="cancel2${s.index }" onmouseover="$('#thirdindex_wh').val(${s.index })" >取消</button> 
                   										</div>
                    									</td>
                									</tr>
											     						
              							</c:forEach>
              								</tbody>
              						</table>	
              					</div>
              				</div>
              		</div>
              	</div>
          </div>
          </form>
    </div>
      

    <script type="text/javascript">
    
    $(document).ready(function() {
    	
    	  FormSamples.init({
    		    formId: 'form1',
    		    success: function() {}
    		  });
    		  FormSamples.init({
    		    formId: 'form2',
    		    success: function() {}
    		  });
    	  
 
    	});
    
    
    
    $(function() {
        //-------------------------Visitor Sources Pie Chart----------------------------------------//
  
		
		$(".thirdjishu").show();
		$(".thirdoushu").hide();
		
		$(".selfjishu").show();
		$(".selfoushu").hide();
		
		//$("#hiddenSubmit").hide();
		
        $('#reservation').daterangepicker();
         $('.date-picker').datepicker();
 
    })
    		var clickrate; 
    	    var selfclickrate;
    		var buttonhover = function(a,b){
    			$('#thirdindex').val(a);
    			$('#updateitem').val(b);
    			
    			var indexButton = $('#thirdindex').val();
    			$('#edit3'+indexButton).click(function(){
        			$("#buttonE"+indexButton).hide();
        	    	$("#buttonS"+indexButton).show();
        	    	
        	    	$("#pv3td"+indexButton).hide();
        	    	$("#pv3input"+indexButton).show();
        	    	
        	    	$("#click3td"+indexButton).hide();
        	    	$("#click3input"+indexButton).show();
        	    	
        	    	$("#income3td"+indexButton).hide();
        	    	$("#income3input"+indexButton).show();
        		});
    			
    			$("#cancel3"+indexButton).click(function(){
    				$("#buttonS"+indexButton).hide();
        	    	$("#buttonE"+indexButton).show();
        	    	
        	    	$("#pv3td"+indexButton).show();
        	    	$("#pv3input"+indexButton).hide();
        	    	
        	    	$("#click3td"+indexButton).show();
        	    	$("#click3input"+indexButton).hide();
        	    	
        	    	$("#income3td"+indexButton).show();
        	    	$("#income3input"+indexButton).hide();
        	    });
    			
    			//保存的时候把当前行数据的status改为0
    			$("#save3"+indexButton).click(function(){
    				$("#status3"+indexButton).val(1);
    				 $("#clickrate3"+indexButton).val(clickrate);
    				$("#selfclickrate3"+indexButton).val(selfclickrate);
    			});
    			
  
    		}
   			
   			
    		var buttonhover_wh = function(a,b){
    			$('#thirdindex_wh').val(a);
    			
       			var indexButton = $('#thirdindex_wh').val();
    			$('#edit2'+indexButton).click(function(){
        			$("#buttonEE"+indexButton).hide();
        	    	$("#buttonSS"+indexButton).show();
        	    	
        	    	$("#pv2td"+indexButton).hide();
        	    	$("#pv2input"+indexButton).show();
        	    	
        	    	$("#click2td"+indexButton).hide();
        	    	$("#click2input"+indexButton).show();
        	    	
        	    	$("#income2td"+indexButton).hide();
        	    	$("#income2input"+indexButton).show();
        		});
    			
    			$("#cancel2"+indexButton).click(function(){
    				$("#buttonSS"+indexButton).hide();
        	    	$("#buttonEE"+indexButton).show();
        	    	
        	    	$("#pv2td"+indexButton).show();
        	    	$("#pv2input"+indexButton).hide();
        	    	
        	    	$("#click2td"+indexButton).show();
        	    	$("#click2input"+indexButton).hide();
        	    	
        	    	$("#income2td"+indexButton).show();
        	    	$("#income2input"+indexButton).hide();
        	    });
    			
    			//保存的时候把当前行数据的status改为0
    			$("#save2"+indexButton).click(function(){
    				$("#status2"+indexButton).val(1);
    				 $("#clickrate2"+indexButton).val(clickrate);
    				$("#selfclickrate2"+indexButton).val(selfclickrate);
    			});
    		}
   				
    		 
    		
				
    		
    			
    		
    		 /* $(".editthirdjishu").click(function(){
    			$("div .thirdoushu").show();
    	    	$("div .thirdjishu").hide();
    		});
    		
    		$(".cancelthirdoushu").click(function(){
    	    	  
    			$("div .thirdjishu").show();
    			$("div .thirdoushu").hide();
    		
    	    });  */ 
    			
    	/* 	$(".editselfjishu").click(function(){
    			$("div .selfoushu").show();
    	    	$("div .selfjishu").hide();
        		
    			});
				
    		
    		$(".cancelselfoushu").click(function(){
    	  
    			$("div .selfjishu").show();
    			$("div .selfoushu").hide();
    		
    	    });	 */	
    			
    	    
    		var calculateClickRate = function(){
    	    	
    			var index = $('#thirdindex').val();
    			var pv = $('#thirdpv'+index).val()*1;
    			var click = $('#thirdclick'+index).val()*1; 
    			var selfclick = $('#thirdselfclick'+index).html()*1;
    			var income = $('#thirdincome'+index).val()*1;
    			var clickrate=0;
    			var cpc =0;
    			var selfcpc = 0;
    			if(pv>0){
    				clickrate = click/pv*100;
    			}
    			if(click>0){
        			 cpc = income/click;
        			
    			}
    			if(selfclick>0){
    				 selfcpc = income/selfclick;
    			}
    			$('button[type="submit"]').removeAttr("disabled");
    			$('#thirdclickrate'+index).html(clickrate.toFixed(2)+'%');
    			$('#thirdcpc'+index).html(cpc.toFixed(2));
    			$('#thirdselfcpc'+index).html(selfcpc.toFixed(2));
    			
    		}
    			
    			
    		var calculatethird = function(){
    			var index = $('#thirdindex').val();
    			var income = $('#thirdincome'+index).val()*1;
    			var click = $('#thirdclick'+index).val()*1; 
    			var selfclick = $('#thirdselfclick'+index).html()*1;
    			var selfpv = $('#thirdselfpv'+index).html()*1;
    			
    			var cpc =0;
    			if(click>0){
    				cpc = income/click;
    			}
    			var selfcpc=0;
    			var selfcpm = 0;
    			if(selfclick>0){
    				selfcpc = income/selfclick;
    			}
    			 if(selfpv>0){
    				 selfcpm = income*1000/selfpv;
    				 selfclickrate = selfclick/selfpv*100;
    			 }
    			 
    			 $('button[type="submit"]').removeAttr("disabled");
    			$('#thirdcpc'+index).html(cpc.toFixed(2));
    			$('#thirdselfcpc'+index).html(selfcpc.toFixed(2));
    			$('#thirdselfcpm'+index).html(selfcpm.toFixed(2));
    			$('#thirdselfclickrate'+index).html(selfclickrate.toFixed(2)+'%');
    			
    		}	
    		
   		var calculateClickRate_wh = function(){
    	    	
    			var index = $('#thirdindex_wh').val();
    			var pv = $('#thirdpv_wh'+index).val()*1;
    			var click = $('#thirdclick_wh'+index).val()*1; 
    			var selfclick = $('#thirdselfclick_wh'+index).html()*1;

    			var income = $('#thirdincome_wh'+index).val()*1;
    			var clickrate=0;
    			var cpc =0;
    			var selfcpc = 0;
    			if(pv>0){
    				clickrate = click/pv*100;
    			}
    			if(click>0){
        			 cpc = income/click;
        			 
    			}
    			if(selfclick>0){
      				 selfcpc = income/selfclick;
      			}
    			$('button[type="submit"]').removeAttr("disabled");
    			$('#thirdclickrate_wh'+index).html(clickrate.toFixed(2)+'%');
    			$('#thirdcpc_wh'+index).html(cpc.toFixed(2));
    			$('#thirdselfcpc_wh'+index).html(selfcpc.toFixed(2));
    			
    		}
    			
    			
    		var calculatethird_wh = function(){
    			var index = $('#thirdindex_wh').val();
    			var income = $('#thirdincome_wh'+index).val()*1;
    			var click = $('#thirdclick_wh'+index).val()*1; 
    			var selfclick = $('#thirdselfclick_wh'+index).html()*1;
    			var selfpv = $('#thirdselfpv_wh'+index).html()*1;
    			
    			var cpc =0;
    			if(click>0){
    				cpc = income/click;
    			}
    			var selfcpc=0;
    			var selfcpm = 0;
    			if(selfclick>0){
    				selfcpc = income/selfclick;
    			}
    			 if(selfpv>0){
    				 selfcpm = income*1000/selfpv;
    				 selfclickrate = selfclick/selfpv*100;
    			 }
    			 
    			 $('button[type="submit"]').removeAttr("disabled");
    			$('#thirdcpc_wh'+index).html(cpc.toFixed(2));
    			$('#thirdselfcpc_wh'+index).html(selfcpc.toFixed(2));
    			$('#thirdselfcpm_wh'+index).html(selfcpm.toFixed(2));
    			$('#thirdselfclickrate_wh'+index).html(selfclickrate.toFixed(2)+'%');
    			
    		}	
   
    </script>
