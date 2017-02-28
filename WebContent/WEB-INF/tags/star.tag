<%@tag import="org.ever4j.system.entity.SysOperLog"%>
<%@tag pageEncoding="UTF-8"%>

<%@ attribute name="value" type="java.lang.Float" required="true" %>
<%@ attribute name="color" type="java.lang.String" required="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	StringBuffer resultArray = new StringBuffer();
	// 1分=1星  可以有半星 最高6星
// 	if(value !=null){
// 		Double fullNum = Math.floor(value);
		
// 		boolean isHalf = false;
// 		if((value-fullNum)>=0.5){
// 			isHalf = true;
// 		}
// 		resultArray.append("<span style='color:#35aa47;'>");
// 		int i=0;
// 		for(;i<fullNum;i++){
// 			resultArray.append("<i class='fa fa-star'></i>");
// 		}
// 		if(isHalf){
// 			resultArray.append("<i class='fa fa-star-half-o'></i>");
// 			i++;
// 		}
// 		for(;i<6;i++){
// 			resultArray.append("<i class='fa fa-star-o'></i>");
// 		}
// 		resultArray.append("</span>");
// 	}
	// 1分=1星  没有半星 最高5星
// 	if(value !=null){
// 		Double fullNum = Math.floor(value);
		
// 		boolean isHalf = false;
// 		if((value-fullNum)>=0.5){
// 			isHalf = true;
// 		}
// 		resultArray.append("<span style='color:#35aa47;'>");
// 		int i=0;
// 		for(;i<fullNum;i++){
// 			resultArray.append("<i class='fa fa-star'></i>");
// 		}
// 		if(isHalf){
// 			resultArray.append("<i class='fa fa-star-half-o'></i>");
// 			i++;
// 		}
// 		for(;i<6;i++){
// 			resultArray.append("<i class='fa fa-star-o'></i>");
// 		}
// 		resultArray.append("</span>");
// 	}
	
	if(color==null||color.length()<=0){
		color = "info";
	}
	// 2分=1星  可以有半星 最高5星
	if(value !=null){
		Float v = value/2; 
		Double fullNum = Math.floor(v);
		
		boolean isHalf = false;
		if((v-fullNum)>=0.5){
			isHalf = true;
		}
		resultArray.append("<span>");
		int i=0;
		for(;i<fullNum;i++){
			resultArray.append("<i class='fa fa-star "+color+"'></i>");
		}
		if(isHalf){
			resultArray.append("<i class='fa fa-star-half-o "+color+"'></i>");
			i++;
		}
		for(;i<5;i++){
			resultArray.append("<i class='fa fa-star-o "+color+"'></i>");
		}
		resultArray.append("</span>");
	}


%>
<%=resultArray%>