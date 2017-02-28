<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_ssp_config_adPub_1" ></c:set>
  <form id="${formId }" method="post" action="${ctx}/ssp/config/adPub/save" class="form-horizontal bv-form" >
    <div class="form-body">
      <input type="hidden" name="id" value="${adPub.id}" /> 
      <div class="col-lg-12 col-sm-12 col-xs-12">
        <div class="well with-header  clearfix">
          <div class="header bordered-palegreen">账户信息</div>
          <div class="col-lg-6">
            <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">媒体id</label>
              <div class="col-xs-10 ">
                <input class="form-control " name="pub_id" type="text" value="${pubId}" readonly="true"/> 
              </div>
            </div>

            <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">媒体名称</label>
              <div class="col-xs-10 ">
                <input class="form-control " name="pub_name" type="text" value="${adPub.pub_name}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" />  
              </div>
            </div>

            <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">媒体描述</label>
              <div class="col-xs-10 ">
                <input class="form-control " name="pub_desc" type="text" value="${adPub.pub_desc}"/>  
              </div>
            </div>

<%--             <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">PC原始广告位</label>
              <div class="col-xs-10">
                <input class=" select2"  style="width:100%" name="source_slot_id_pc.source_slot_id" type="hidden"   value="${adPub.source_slot_id_pc.source_slot_id}" display-value="${adPub.source_slot_id_pc.source_slot_name}" result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_number" />  
              </div>
            </div>

            <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">移动原始广告位</label>
              <div class="col-xs-10">
                <input class=" select2"  style="width:100%" name="source_slot_id_mobile.source_slot_id" type="hidden"   value="${adPub.source_slot_id_mobile.source_slot_id}" display-value="${adPub.source_slot_id_mobile.source_slot_name}" result-field="source_slot_name"  value-field="source_slot_id" lookup-url="${ctx}/ssp/config/adSourceSlot/listJSON" filter="filter_LIKES_source_slot_number" />  
              </div>
            </div> --%>

            <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">联系人</label>
              <div class="col-xs-10 ">
                <input class="form-control " name="pub_linkman" type="text" value="${adPub.pub_linkman}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" /> 
              </div>
            </div>

            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="id-date-picker-1" class="col-sm-4 control-label no-padding-right">联系方式</label>
                  <div class="col-xs-8">
                    <input class="form-control " name="pub_tel" type="text" value="${adPub.pub_tel}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$" data-bv-regexp-message="电话号码只能为数字！"/>  
                  </div>
                </div>
              </div>

              <div class="col-sm-6">
                <div class="form-group">
                  <label for="id-date-picker-1" class="col-sm-4 control-label no-padding-right">邮箱</label>
                  <div class="col-xs-8">
                    <input class="form-control " name="email" type="text" value="${adPub.email}"/>  
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
      <div class="col-lg-12 col-sm-12 col-xs-12">
        <div class="well with-header clearfix">
          <div class="header bordered-palegreen">收款信息</div>
          <div class="col-lg-6">
            <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">公司名称</label>
              <div class="col-xs-10">
                <input class="form-control " name="company_name" type="text" value="${adPub.company_name}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"/> 
              </div>
            </div>

            <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">银行账号</label>
              <div class="col-xs-10">
                <input class="form-control " name="bank_account" type="text" value="${adPub.bank_account}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$" data-bv-regexp-message="银行账号只能包含数字！"/> 
              </div>
            </div>

            <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">开户行</label>
              <div class="col-xs-10">
                <input class="form-control " name="opening_bank" type="text" value="${adPub.opening_bank}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"/> 
              </div>
            </div>

            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="id-date-picker-1" class="col-sm-4 control-label no-padding-right">收款人</label>
                  <div class="col-xs-8">
                    <input class="form-control " name="payee" type="text" value="${adPub.payee}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"/> 
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="id-date-picker-1" class="col-sm-4 control-label no-padding-right">联系电话</label>
                  <div class="col-xs-8">
                    <input class="form-control " name="payee_tel" type="text" value="${adPub.payee_tel}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$" data-bv-regexp-message="电话号码只能为数字！"/>  
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>

      <div class="col-lg-12 col-sm-12 col-xs-12">
        <div class="well with-header clearfix">
          
          <div class="header bordered-palegreen">收入配置</div>
          <div class="col-lg-6">
            <div class="form-group">
              <label for="id-date-picker-1" class="col-sm-2 control-label no-padding-right">媒体分成比例(%)</label>
              <div class="col-xs-10 form-inline ">
                <input class="form-control " name="profit_ratio" type="text" value="${current_ratio}" data-bv-notempty="true" data-bv-notempty-message="此处不能为空！" data-bv-regexp="true" data-bv-regexp-regexp="^([0-9][0-9]?(\.[0-9]{1,2})?|100)$" data-bv-regexp-message="格式有误！"/>  
                
              </div>
            </div>
          </div>
          
          <div class="col-lg-6">
            <div class="form-group">              
                <label for="" class="col-sm-2 control-label no-padding-right">生效时间</label>
            <div class="col-xs-10 form-inline ">
            <tag:enum id="effect_time" cssClass="select2me" name="effect_time" attrs="" cssStyle="width:50%" enumName="pub_income_effect_time" inputType="select" enumKey="${effect_time}"/>
            </div>
            </div>
          </div>
          
          
                                  

        </div>
        
                                

                            	 
      </div>

    </div>
    <div class="  form-group ">
      <div class="pull-right form-btn">
        <button class="btn btn-warning" type="reset"> <i class="ace-icon fa fa-undo bigger-110"></i>
          重置
        </button>
        <button type="submit" class="btn btn-info"> <i class="ace-icon fa fa-check bigger-110"></i>
          确认
        </button>
      </div>
    </div>
  </form>
		
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>