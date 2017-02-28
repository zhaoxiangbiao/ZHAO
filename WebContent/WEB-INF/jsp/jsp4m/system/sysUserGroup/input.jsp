<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_system_sysUserGroup_1" ></c:set>
    <style type="text/css">
    .buttons-preview a{
        width: 90px;
    }


    </style>
    <form id="${formId }" method="post" action="${ctx}/system/sysUserGroup/save" class="form-horizontal bv-form" >
        <div class="form-body">
            <input type="hidden" name="id" value="${sysUserGroup.id}" />   
            <input type="hidden" id="groupId" name="group_id" value="${sysUserGroup.group_id}"> 
            <form:field name="group_name" attrs='data-bv-notempty="true" data-bv-notempty-message="此处不能为空！"' label="用户组名称"  value="${sysUserGroup.group_name}"></form:field>
            <form:field name="group_desc" attrs=""  label="用户组说明"  value="${sysUserGroup.group_desc}" ></form:field>
			<input name="pub_name" id="pubName" type="hidden"/>
			<input name="status" type="hidden" value="${sysUserGroup.status}"/> 
            <h5 class="row-title"> <i class="fa fa-tags blue"></i>
                管理媒体
            </h5>
            <div class="clearfix form-group">

                <div class="pull-left col-sm-5">
                    <select  multiple id="select1" style="width:100%;height:250px;">
                        <c:forEach items="${pubList}" var="item" >
                            <option style="width:600px" value="${item.pub_id}">${item.pub_name}(${item.pub_id})</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="buttons-preview col-sm-2" >
                    <a href="javascript:void(0);" id="remove" class="btn btn-palegreen"> <i class="fa fa-angle-left"></i>
                        &nbsp;左移
                    </a>
                    <a href="javascript:void(0);" id="add" class="btn btn-blue">
                        右移&nbsp;
                        <i class="fa fa-angle-right"></i>
                    </a>

                    <br>    
                    <a href="javascript:void(0);" id="removeAll" class="btn btn-palegreen">
                        <i class="fa fa-angle-left"></i>
                        &nbsp;全部左移
                    </a>
                    <a href="javascript:void(0);" id="addAll" class="btn btn-blue">
                        全部右移&nbsp;
                        <i class="fa fa-angle-right"></i>
                    </a>

                </div>

                <div class=" pull-right col-sm-5">

                    <select multiple id="select2" style="width:100%;height:250px;" >
                        <c:forEach items="${pubList2}" var="item" >
                            <option style="width:600px" value="${item.pub_id}">${item.pub_name}(${item.pub_id})</option>
                        </c:forEach>
                    </select>
                </div>

            </div>
        </div>
        <div class="  form-group ">
            <div class="pull-right form-btn">
                <button class="btn btn-warning" type="reset">
                    <i class="ace-icon fa fa-undo bigger-110"></i>
                    重置
                </button>
                <button  id="commit" type="submit" class="btn btn-info">
                    <i class="ace-icon fa fa-check bigger-110"></i>
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

$(document).ready(function(){  
	
	
	
    $('#add').click(function(){  
        var $options = $('#select1 option:selected');//获取当前选中的项  
        var $remove = $options.remove();//删除下拉列表中选中的项  
        $remove.appendTo('#select2');//追加给对方  
    });  
      
    $('#remove').click(function(){  
        var $removeOptions = $('#select2 option:selected');  
        $removeOptions.appendTo('#select1');//删除和追加可以用appendTo()直接完成  
    });  
      
    $('#addAll').click(function(){  
        var $options = $('#select1 option');  
        $options.appendTo('#select2');  
    });  
      
    $('#removeAll').click(function(){  
        var $options = $('#select2 option');  
        $options.appendTo('#select1');  
    });  
      
    //双击事件  
    $('#select1').dblclick(function(){  
        //var $options = $('#select1 option:selected');  
        var $options = $('option:selected', this);//注意此处“option”与“:”之间的空格，有空格是不可以的  
        $options.appendTo('#select2');  
    });  
      
    $('#select2').dblclick(function(){  
        $('#select2 option:selected').appendTo('#select1');  
    }); 
    
      
});  

//在提交的时候获取select的全部value
$("#commit").click(function(){
	var pubName = "";
	$("#select2 option").each(function(){ //遍历全部option
	    var txt = $(this).val(); //获取option的内容
		pubName+=txt+",";
	});

	$("#pubName").val(pubName);
	
	
});


</script>