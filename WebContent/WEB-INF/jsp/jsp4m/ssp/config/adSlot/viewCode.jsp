<%@page import="org.ever4j.system.entity.SysOperLog"%>
<%@page import="com.junfu360.ssp.config.entity.AdSlot"%>
<%@page import="org.apache.commons.net.util.Base64"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set var="host" value="${empty msg?'api.dreamfull.cn':msg}" scope="page"></c:set>
<c:set var="slot_id" value="${adSlot.slot_id}" scope="page"></c:set>
<c:set var="pub_id" value="${adSlot.pub_id.pub_id}" scope="page"></c:set>
<%
String host = (String)pageContext.getAttribute("host");
int slot_id = (Integer)pageContext.getAttribute("slot_id");
int pub_id = (Integer)pageContext.getAttribute("pub_id");
Integer primarySite = (Integer)request.getAttribute("primarySite");
Integer iframeCount = (Integer)request.getAttribute("iframeCount");
if(primarySite==null){
	primarySite = 99;
}
pageContext.setAttribute("primarySite", primarySite);
if(iframeCount==null){
	iframeCount = 0;
}

AdSlot adSlot = (AdSlot)request.getAttribute("adSlot");
// 如果是固定广告位 则iframeCount=9
if((adSlot.getSlot_target_floor()==1 && adSlot.getSlot_type_pc()==1)||(adSlot.getSlot_target_floor()==2 && adSlot.getSlot_type_mobile()==1)||(adSlot.getSlot_target_floor()==3 && adSlot.getSlot_type_mobile()==1&& adSlot.getSlot_type_pc()==1)){
	iframeCount =9;
}
pageContext.setAttribute("iframeCount", iframeCount);
String jsSrc = "http://"+host+"/s/js/jquery.js?_qwert_sid="+slot_id+"&_zxcvb_pid="+primarySite+iframeCount+pub_id+"&rnd=1210"; 
String jsSrc2 = "http://192.168.254.245/s/js/jquery.js?_qwert_sid="+slot_id+"&_zxcvb_pid="+primarySite+iframeCount+pub_id+"&_host=api.dreamfull.cn:7777"; 
String jsCode = "<script  src=\""+jsSrc+"\" type=\"text/javascript\" charset=\"utf-8\"></script>"; 
String jsCodeBase = Base64.encodeBase64String(jsCode.getBytes("utf-8"));

pageContext.setAttribute("jsSrc2", jsSrc2);
pageContext.setAttribute("jsSrc", jsSrc);
pageContext.setAttribute("jsCode", jsCode);
pageContext.setAttribute("jsCodeBase", jsCodeBase);
%>
<form target="_blank" method="post" action="http://preview.ad2bus.com/xx/test.php"  class="form-horizontal bv-form" >
<div class="form-body">
		
<div class="page-body" style="background: white;">
        <h4 class="block">【${adSlot.slot_name}】</h4>
        <h4 class="block">方式一 : HTML BODY 内部插入代码</h4>
		<input type="hidden" name="name" value="${adSlot.slot_name}">
		<input type="hidden"  name="code" value="${jsSrc }">
		<input type="hidden"  name="code2" value="${jsSrc2 }">
        <textarea  class="form-control form-group" rows="2" id="jsCode_id" style="background-color:white;">${jsCode }</textarea>
        <h4 class="block">方式二 : javascript 代码</h4>
<textarea  class="form-control form-group" rows="7" id="jsCode2_id" style="background-color:white;">
(function() {
    if (!document.body) return setTimeout(arguments.callee, 50);
    var e = document.createElement("script");
    e.src = "${jsSrc }",
    e.type = "text/javascript",
    document.body.insertBefore(e, document.body.children.item(0))
})();
</textarea>
        <h4 class="block">方式三 : IFRAME SRC 替换URL</h4>
        <textarea  class="form-control form-group" rows="2" id="srcCode_id" style="background-color:white;">http://${empty msg?'api.dreamfull.cn':msg}/s/go20150729.html?_qwert_sid=${slot_id }&_zxcvb_pid=${primarySite}${iframeCount}${pub_id}&rnd=1210</textarea>
</div>

<div class="  form-group ">
		<div class="pull-right form-btn">
		
	<label style="padding-top:5px;">调试模式:</label> 
	 <label>
         <input name="debug" class="checkbox-slider toggle colored-blue" type="checkbox" checked="checked" value="&_d=1">
         <span class="text" style="margin-top: 15px;"></span>
     </label>
	<label style="padding-top:5px;">使用备用服务器:</label> 
	 <label>
         <input name="backupServer" class="checkbox-slider toggle " type="checkbox"  value="1">
         <span class="text" style="margin-top: 15px;"></span>
     </label>
     		<button class="btn btn-primary" type="button" id="jsCode_btn" data-clipboard-target="jsCode_id"><i class="ace-icon fa fa-undo bigger-110"></i> 复制方式一代码</button>
     		<button class="btn btn-primary" type="button" id="jsCode2_btn" data-clipboard-target="jsCode2_id"><i class="ace-icon fa fa-undo bigger-110"></i> 复制方式二代码</button>
     		<button class="btn btn-warning" type="button" id="srcCode_btn" data-clipboard-target="srcCode_id"><i class="ace-icon fa fa-undo bigger-110"></i> 复制方式三代码</button>
			<button type="submit" class="btn btn-info"><i class="ace-icon fa fa-check bigger-110"></i>预览效果</button>
		</div>
	</div>
</div>

</form>
    <script type="text/javascript">
    
    var client = new ZeroClipboard( document.getElementById("jsCode_btn") );

    client.on( "ready", function( readyEvent ) {
      // alert( "ZeroClipboard SWF is ready!" );

      client.on( "aftercopy", function( event ) {
    	  Notify('复制成功', 'top-right', '100', 'success', 'fa-check', true);
      } );
    } );
    var client2 = new ZeroClipboard( document.getElementById("jsCode2_btn") );

    client2.on( "ready", function( readyEvent ) {
      // alert( "ZeroClipboard SWF is ready!" );

      client2.on( "aftercopy", function( event ) {
    	  Notify('复制成功', 'top-right', '100', 'success', 'fa-check', true);
      } );
    } );
    
    var client3 = new ZeroClipboard( document.getElementById("srcCode_btn") );

    client3.on( "ready", function( readyEvent ) {
      // alert( "ZeroClipboard SWF is ready!" );

      client3.on( "aftercopy", function( event ) {
        // `this` === `client`
        // `event.target` === the element that was clicked
    	  Notify('复制成功', 'top-right', '100', 'success', 'fa-check', true);
        
      } );
    } );
    
    </script>
