package com.eversec.everad.conf.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.eversec.everad.conf.entity.BlackUser;
import  com.eversec.everad.conf.service.BlackUserService;

@Controller
@RequestMapping("/everad/conf/blackUser")
public class BlackUserAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_black_user";
	private String sortField = "sort";
	
	@Resource
	private BlackUserService blackUserService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/everad/conf/blackUser/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
				
		// 设置逻辑删除条件
		setLogicDelete(request,logicDelete);
		
		PageData<BlackUser> pageData = new PageData<BlackUser>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		// 设置排序
		setSort4query(pageData,this.sort);
		
		pageData = blackUserService.find(pageData);
		
		return this.toPageModel(model, pageData);
	}
	
	

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/everad/conf/blackUser/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		BlackUser blackUser = blackUserService.find(Long.parseLong(id));
		model.addAttribute(blackUser);
		return SessionUtil.getViewPath("/everad/conf/blackUser/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		BlackUser blackUser = blackUserService.find(Long.parseLong(id));
		model.addAttribute(blackUser);
		return SessionUtil.getViewPath("/everad/conf/blackUser/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param BlackUser
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, BlackUser blackUser){
		// 初始化
		returnCommand(model, request);
		if (blackUser.isNew()){
			blackUserService.save(blackUser);
			//排序
			setSort4insert(this.sort,blackUserService,this.tableName,this.sortField,blackUser.getId());
		} else{
			blackUserService.update(blackUser);
		}
		
		model.addAttribute("message", "保存成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 删除记录
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String ids){
		// 初始化
		returnCommand(model, request);
		delete(blackUserService, "BlackUser", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * 快速设置is_effect
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setIs_effect")
	public String setIs_effect(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		BlackUser blackUser = blackUserService.find(Long.parseLong(id));
		blackUser.setIs_effect(Integer.parseInt(value));
		blackUserService.update(blackUser);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	
	
	/**
	 * 排序
	 * @param request
	 * @param model
	 * @param sort
	 * @return
	 */
	@RequestMapping(value = "sort")
	public String sort(HttpServletRequest request, Model model,Integer id, Integer sort,Integer afterSort,Integer beforeSort,Integer p){
		// 初始化
		returnCommand(model, request);
		
		blackUserService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/blackUser/importExcel");
		request.setAttribute("navTabId", "everad/conf_blackUser_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, blackUserService, new BlackUser());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(blackUserService, request, response, excelName, sheetName, title);
	}
	
}
