<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/ssp/logs/adSourceData/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_SSP_LOGS_ADSOURCEDATA_" ></c:set>
<c:set scope="page" var="dataTitle" value="原始广告位数据汇总表" ></c:set>
<c:set scope="page" var="tableId" value="data_table_ssp_logs_adSourceData_1" ></c:set>
<style>
  .form-inline .form-group{
    width:auto;
  }
  input[type=checkbox].checkbox-slider~.text:before{
    content:"打开 &关闭"
  }
   .tab-content, .nav-tabs, .widget .widget-header,.ad-create-form .widget .widget-body,
         .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus
        {
            -webkit-box-shadow:none;
            box-shadow:none;
        }
         .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus{
            border-bottom: 2px solid #a0d468;
            border-top: 0px;
        }

        .nav-tabs,.tab-content{
            background-color: transparent;
        }
        .widget .widget-header{
            border: 1px solid #a0d468;
            border-bottom: 0px;
        }
        .widget .widget-body{
            border: 1px solid #a0d468;
            background-color: #f9fcff;
        }  
        .left10{
          margin-left: 10px;
        } 
        .width60{
          width:60px !important;
        }     
        .width90{
          width:90px !important;
        }
        .checkbox label span.text{
            text-indent: -110px;
        }
        div.checkbox{
          top: -7px;
        }
        label.interval{
          margin-left: 15px;
          margin-right: 5px;
        }
        label.textFixed{
          width: 20em;
          overflow: hidden;
          text-overflow:ellipsis;
          text-align: center;
        }
</style>
<div class="row">
  <div class="col-md-12">
    <form id="${formId }_1" method="post" action="/ssp/logs/adSourceData/saveData" class="bv-form" >
      <div class="form-body">
        <div class="col-lg-12 col-sm-12 col-xs-12">
          <div class="well with-header clearfix">
            <div class="header bordered-palegreen">自有物料</div>
            <div class="form-group clearfix">
              <div class=" col-sm-12">
                <c:forEach items="${selfList}" var="item" varStatus="s">
                  <div class="form-group form-inline">
                  	<c:if test="${item.advert_id.name!=null && item.wh_id.name!=null}">
                    <input type="hidden" name="selfList[${s.index }].id" type="text" value="${item.id}"/>
                    <input type="hidden" name="selfList[${s.index }].source_id.source_id" type="text" value="${item.source_id.source_id}"/>
                    <input type="hidden" name="selfList[${s.index }].source_slot_id.source_slot_id" type="text" value="${item.source_slot_id.source_slot_id}"/>
                    <input type="hidden" name="selfList[${s.index }].advert_id.advert_id" type="text" value="${item.advert_id.advert_id}"/>
                    <input type="hidden" name="selfList[${s.index }].wh_id.wh_id" type="text" value="${item.wh_id.wh_id}"/>
                    <input type="hidden" name="selfList[${s.index }].dsp_type" type="text" value="${item.dsp_type}"/>
                    <input type="hidden" name="selfList[${s.index }].clickrate" type="text" value="${item.clickrate}"/>
                    <input class="form-control" name="selfList[${s.index }].statdate" type="text" readonly="true" value="<fmt:formatDate value="${item.statdate}" pattern="yyyy-MM-dd"/>"/>
                    <label for="id-date-picker-1" class="textFixed">${item.advert_id.name}</label>
                    <label for="id-date-picker-1" class="textFixed">${item.wh_id.name}</label>                      
                    <label for="id-date-picker-1" class="interval">展示</label>
                    <input class="form-control " name="selfList[${s.index }].pv" type="text" value="${item.pv}"/>
                    <label for="id-date-picker-1" class="interval">点击</label>
                    <input class="form-control " name="selfList[${s.index }].click" type="text" value="${item.click}"/>
                    <label for="id-date-picker-1" class="interval">收入</label>
                    <input class="form-control " name="selfList[${s.index }].income" type="text" value="${item.income}"/>
                    <label for="id-date-picker-1" class="width90">元</label>
                    </c:if>
                  </div>
                </c:forEach>
                <button type="submit" class="btn btn-default pull-right">保存</button>
              </div>
            </div>

          </div>
        </div>
      </div>
    </form>

    <form id="${formId }_2" method="post" action="/ssp/logs/adSourceData/saveData" class=" bv-form" >
      <div class="form-body">
        <div class="col-lg-12 col-sm-12 col-xs-12">
          <div class="well with-header clearfix">
            <div class="header bordered-palegreen">第三方</div>
            <div class="form-group clearfix">
              <div class="col-sm-12">
                <c:forEach items="${thirdList}" var="item" varStatus="s">
                  <div class="form-group  form-inline">
                  	<c:if test="${item.source_id.source_name!=null && item.source_slot_id.source_slot_name!=null}">
                    <input type="hidden" name="thirdList[${s.index }].id" type="text" value="${item.id}"/>
                    <input type="hidden" name="thirdList[${s.index }].source_id.source_id" type="text" value="${item.source_id.source_id}"/>
                    <input type="hidden" name="thirdList[${s.index }].source_slot_id.source_slot_id" type="text" value="${item.source_slot_id.source_slot_id}"/>
                    <input type="hidden" name="thirdList[${s.index }].advert_id.advert_id" type="text" value="${item.advert_id.advert_id}"/>
                    <input type="hidden" name="thirdList[${s.index }].wh_id.wh_id" type="text" value="${item.wh_id.wh_id}"/>
                    <input type="hidden" name="thirdList[${s.index }].dsp_type" type="text" value="${item.dsp_type}"/>
                    <input type="hidden" name="thirdList[${s.index }].clickrate" type="text" value="${item.clickrate}"/>
                    <input class="form-control" name="thirdList[${s.index }].statdate" type="text" readonly="true" value="<fmt:formatDate value="${item.statdate}" pattern="yyyy-MM-dd"/>"/>
                    <label for="id-date-picker-1" class="textFixed">${item.source_id.source_name}</label>
                    <label for="id-date-picker-1" class="textFixed">${item.source_slot_id.source_slot_name}</label>
                    <label for="id-date-picker-1" class="interval">展示</label>
                    <input class="form-control " name="thirdList[${s.index }].pv" type="text" value="${item.pv}"/>
                    <label for="id-date-picker-1" class="interval">点击</label>
                    <input class="form-control " name="thirdList[${s.index }].click" type="text" value="${item.click}"/>
                    <label for="id-date-picker-1" class="interval">收入</label>
                    <input class="form-control " name="thirdList[${s.index }].income" type="text" value="${item.income}"/>
                    <label for="id-date-picker-1" class="width90">元</label>
                    </c:if>
                  </div>
                </c:forEach>
                <button type="submit" class="btn btn-default pull-right">保存</button>
              </div>
            </div>

          </div>
        </div>
      </div>
    </form>
  </div>
</div>
<script>

$("input").change(function() {
  $('button[type="submit"]').removeAttr("disabled");
})

jQuery(document).ready(function() {
  FormSamples.init({
    formId: '${formId }_1',
    success: function() {}
  });
  FormSamples.init({
    formId: '${formId }_2',
    success: function() {}
  });
});


</script>
