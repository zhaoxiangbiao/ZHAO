package org.ever4j.main.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.base4j.orm.hibernate.BaseAction;
import org.ever4j.main.constant.Constant;
import org.ever4j.main.service.MainService;
import org.ever4j.system.entity.SysUser;
import org.ever4j.system.pojo.MainMenuPojo;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/sys/main")
public class MainAction extends BaseAction{
	
	@Resource
	private MainService mainService;
	
	@RequestMapping(value = "/index")
	public String index(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		Object userObj = session.getAttribute("curUser");
		
		if(userObj != null){
			SysUser curUser = (SysUser)userObj;
			Map<Long, MainMenuPojo> menuMap = new HashMap<Long, MainMenuPojo>();
			List<MainMenuPojo> userOwnMenuList = mainService.findMenuInfo(curUser,menuMap);
			session.setAttribute("menus", userOwnMenuList);
			
			List<MainMenuPojo> navMenus = mainService.findNavMenu(userOwnMenuList,menuMap);
			session.setAttribute("navMenus", navMenus);
			
		}
		SessionUtil.setViewResolverPrefix("");
		return SessionUtil.getViewPath("/index");
	}
	@RequestMapping(value = "/index4m")
	public String index4m(Model model, HttpServletRequest request,HttpServletResponse response){
		
		HttpSession session = request.getSession();
		SysUser curUser = SessionUtil.getCurrentUser();
		if(curUser!=null && curUser.getUserRole()!=null){
			Map<Long, MainMenuPojo> menuMap = new HashMap<Long, MainMenuPojo>();
			List<MainMenuPojo> userOwnMenuList = mainService.findMenuInfo(curUser,menuMap);
			session.setAttribute("menus", userOwnMenuList);
			
			
			List<MainMenuPojo> navMenus = mainService.findNavMenu(userOwnMenuList,menuMap);
			session.setAttribute("navMenus", navMenus);
			
			
			// 初始化通用权限项
			List<String> objs = mainService.findBySql("SELECT m.grant_name FROM sys_grant m ,sys_grant_role mr where m.id=mr.grant_id and mr.role_id = ?",curUser.getUserRole().getId());
			session.setAttribute("GRANT_LIST", objs);
		}
		session.getServletContext().setAttribute("system_status", Constant.getSystemStatus());
		SessionUtil.setViewResolverPrefix("../jsp4m");
		return SessionUtil.getViewPath("/index");
	}
	
	@RequestMapping(value = "/getNav")
	public String getNav(Model model,HttpServletRequest request){
		
		return SessionUtil.getViewPath("/nav");
	}
	
	@RequestMapping(value = "/status")
	public String status(HttpServletRequest request, Model model, String value){
		// 初始化
		HttpSession session = request.getSession();
		returnCommand(model, request);
		Constant.setSystemStatus(value);
		session.getServletContext().setAttribute("system_status", Constant.getSystemStatus());
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	@RequestMapping(value = "/welcome")
	public String welcome(HttpServletRequest request, Model model){
		return SessionUtil.getViewPath("/commons/chinaMap");
	}
}
