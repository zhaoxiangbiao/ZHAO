<%@tag import="org.ever4j.utils.SessionUtil"%>
<%@tag import="java.util.List"%>
<%@tag import="org.ever4j.system.entity.SysUser"%>
<%@tag import="org.apache.commons.lang.StringUtils"%>
<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="name" type="java.lang.String" required="true"%>


<%

List<String> objs = (List<String>)session.getAttribute("GRANT_LIST");
SysUser curUser = SessionUtil.getCurrentUser();
if( curUser!=null && curUser.getUserRole()!=null && "5".equals(curUser.getUserRole().getRoleType())){%>
	<jsp:doBody/>
<%}else if(name==null || name.length()==0 ||( objs!=null && objs.contains(name))) {%>
	<jsp:doBody/>
<%} %>
