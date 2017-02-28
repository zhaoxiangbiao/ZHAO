<%@page import="org.ever4j.system.entity.SysOperLog"%>
<%@page import="java.util.Map"%>
<%@page import="org.ever4j.system.service.SysMenuService"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.ever4j.system.pojo.MainMenuPojo"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<%
		
// 一级导航目录
List navs = (List)session.getAttribute("navMenus");
// 非一级导航目录
List li = (List)session.getAttribute("menus");

List cmenus = new ArrayList();
for(int j=0;j<navs.size();j++){
	MainMenuPojo mii = (MainMenuPojo)navs.get(j);
	MainMenuPojo mi = (MainMenuPojo)mii.cloneMe();
	mi.getMenus().clear();
	// 设置子项菜单
	if(mi.getMenuName()!=null && mi.getMenuName().length()>0){
		String[] mdls = mi.getMenuName().split("\\|");
		if(mdls.length==2){
			String hql = mdls[1];
			String url = mdls[0];
			ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
			SysMenuService sms = ctx.getBean(SysMenuService.class);
			List menuList = sms.findHqlList(hql);
			if(menuList!=null && menuList.size()>0){
				for(int i=0;i<menuList.size();i++){
					Map<String,Object> map = (Map<String,Object>)menuList.get(i);
					MainMenuPojo mmp= new MainMenuPojo();
					mmp.setExternal(0);
					mmp.setMenuType("2");
					mmp.setEnabled("1");
					mmp.setIcon("fa fa-pencil-square");
//	 				mmp.setTarget("navTab");
					mmp.setMenuName(url+map.get("key"));
					mmp.setMenuDesc(map.get("name").toString());
					mi.getMenus().add(mmp);
				}
			}
		}
		
	}
	
	// 查找该目录下的菜单
	for(int i=0;i<li.size();i++){
		
		MainMenuPojo m = (MainMenuPojo)li.get(i);
		if(m.getPid() != null && m.getPid().intValue()==mi.getId().intValue()){
			MainMenuPojo mm = (MainMenuPojo)m.cloneMe(); 
			mm.setMenus(new ArrayList<MainMenuPojo>());
			mi.getMenus().add(mm);
// 			System.out.println(mi.getMenus().size());
		}
	}
// 	System.out.println(mi.getMenuDesc()+":"+mi.getMenus().size());
	cmenus.add(mi);
}
request.setAttribute("cmenus", cmenus);

%>

<c:if test="${not empty cmenus}">

		<c:forEach var="m" items="${cmenus}">
			
	   		
	   		<li class=" <c:if test="${ m.enabled=='0'}"> disabled-link" </c:if>" >
		   				<c:if test="${ !(m.menuType eq '2')}">
						<a href="<c:if test="${ m.enabled=='1'}">javascript:;</c:if><c:if test="${ m.enabled=='0'}">###</c:if>" class="menu-dropdown <c:if test="${ m.enabled=='0'}"> tooltips</c:if>" <c:if test="${ m.enabled=='0'}">data-handler="MESSAGE"   data-title="IGOOOO" data-content="敬请期待" </c:if>  data-container="body" data-placement="right" data-original-title="${m.summary }"  >
						 <i class="menu-icon ${m.icon }"></i>
						 <span class="menu-text"> ${m.menuDesc}</span>
						 <i class="menu-expand"></i>
						 ${m.badge }
						</a>
						</c:if>
					  <c:if test="${ not empty m.menuName && m.menuType eq '2' && m.external == 1}">
		  				<a class="iframefy <c:if test="${ m.enabled=='0'}"> tooltips</c:if>" href="<c:if test="${ m.enabled=='1'}">${ctx}${m.menuName}</c:if><c:if test="${ m.enabled=='0'}">###</c:if>"  url="<c:if test="${ m.enabled=='1'}">${ctx}${m.menuName}</c:if><c:if test="${ m.enabled=='0'}">###</c:if>" <c:if test="${ m.enabled=='0'}">data-handler="MESSAGE"   data-title="IGOOOO" data-content="敬请期待" </c:if>     rel="${m.menuRel}" external="false" data-container="body" data-placement="right" data-original-title="${m.summary }">
						 <i class="menu-icon ${m.icon }"></i>
						 <span class="menu-text"> ${m.menuDesc}</span>
						 ${m.badge }
						</a>
		  			  </c:if>
		  			  <c:if test="${ not empty m.menuName && m.menuType eq '2' && m.external != 1}">
		  			 	<a class="ajaxify <c:if test="${ m.enabled=='0'}"> tooltips</c:if>" href="<c:if test="${ m.enabled=='1'}">${ctx}${m.menuName}</c:if><c:if test="${ m.enabled=='0'}">###</c:if>"  url="<c:if test="${ m.enabled=='1'}">${ctx}${m.menuName}</c:if><c:if test="${ m.enabled=='0'}">###</c:if>" <c:if test="${ m.enabled=='0'}">data-handler="MESSAGE"   data-title="IGOOOO" data-content="敬请期待" </c:if>     rel="${m.menuRel}" external="false" data-container="body" data-placement="right" data-original-title="${m.summary }">
						  <i class="menu-icon ${m.icon }"></i>
						  <span class="menu-text"> ${m.menuDesc}</span>
						  ${m.badge }
						</a>
			  		 </c:if>
	   		<c:if test="${not empty m.menus}">
	   		 <ul class="submenu">
				<c:forEach var="m2" items="${m.menus}">
					<c:remove var="menu" scope="request"/>
					<c:set var="menu" value="${m2}" scope="request"/>
					<jsp:include page="recursive.jsp"/>
				</c:forEach>
			</ul>
			</c:if>	
			</li>
		</c:forEach>
</c:if>	





