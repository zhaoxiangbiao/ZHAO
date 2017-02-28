package org.ever4j.system.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysOperLog;
import org.ever4j.system.entity.SysUser;
import org.ever4j.system.service.SysOperLogService;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/system/sysOperLog")
public class SysOperLogAction extends BaseAction{
	
	@Resource
	private SysOperLogService sysOperLogService;;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysOperLog> pageData = new PageData<SysOperLog>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysOperLogService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		return SessionUtil.getViewPath("/system/sysOperLog/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model){
		// 用户只能看到自己创建的和自己所属的(非审计员)
		SysUser user = SessionUtil.getCurrentUser();
		if(!"2".equals(user.getUserType()) && !"3".equals(user.getUserType())){
			request.setAttribute("filter_EQL_operUser.id", user.getId().toString());
		}else{
			request.setAttribute("filter_NOTEQS_operUser.userType","0");
		}
		PageData<SysOperLog> pageData = new PageData<SysOperLog>();
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysOperLogService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysOperLog> pageData = new PageData<SysOperLog>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysOperLogService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysOperLog> lookupJson(HttpServletRequest request){
		PageData<SysOperLog> pageData = new PageData<SysOperLog>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysOperLogService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/system/sysOperLog/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/system/sysOperLog/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysOperLog sysOperLog = sysOperLogService.find(Long.parseLong(id));
		model.addAttribute(sysOperLog);
		return "/system/sysOperLog/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysOperLog sysOperLog = sysOperLogService.find(Long.parseLong(id));
		model.addAttribute(sysOperLog);
		return SessionUtil.getViewPath("/system/sysOperLog/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysOperLog viewJson(Model model, String id) {
		SysOperLog sysOperLog = sysOperLogService.find(Long.parseLong(id));
		model.addAttribute(sysOperLog);
		return sysOperLog;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysOperLog
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysOperLog sysOperLog){
		// 初始化
		returnCommand(model, request);
		if (sysOperLog.isNew()){
			sysOperLogService.save(sysOperLog);
		} else{
			sysOperLogService.update(sysOperLog);
		}
		
		model.addAttribute("message", "保存成功");
		return "/commons/ajaxDone";
	}

	/**
	 * 删除单条记录
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String id){
		// 初始化
		returnCommand(model, request);
		sysOperLogService.delete(Long.parseLong(id));
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 批量删除记录
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delAll")
	public String delAll(HttpServletRequest request, Model model,String ids){
		// 初始化
		returnCommand(model, request);
		for(String id : ids.split(",")){
			sysOperLogService.delete(Long.parseLong(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
}
