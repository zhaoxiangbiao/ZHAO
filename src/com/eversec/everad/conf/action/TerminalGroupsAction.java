package com.eversec.everad.conf.action;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.utils.FileUtils;
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

import com.eversec.everad.conf.entity.TerminalGroups;
import  com.eversec.everad.conf.service.TerminalGroupsService;

@Controller
@RequestMapping("/everad/conf/terminalGroups")
public class TerminalGroupsAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_terminal_groups";
	private String sortField = "sort";
	
	@Resource
	private TerminalGroupsService terminalGroupsService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/everad/conf/terminalGroups/listPage");
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
		
		PageData<TerminalGroups> pageData = new PageData<TerminalGroups>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		// 设置排序
		setSort4query(pageData,this.sort);
		
		pageData = terminalGroupsService.find(pageData);
		
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
		return SessionUtil.getViewPath("/everad/conf/terminalGroups/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		TerminalGroups terminalGroups = terminalGroupsService.find(Long.parseLong(id));
		model.addAttribute(terminalGroups);
		return SessionUtil.getViewPath("/everad/conf/terminalGroups/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		TerminalGroups terminalGroups = terminalGroupsService.find(Long.parseLong(id));
		model.addAttribute(terminalGroups);
		return SessionUtil.getViewPath("/everad/conf/terminalGroups/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param TerminalGroups
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, TerminalGroups terminalGroups){
		// 初始化
		returnCommand(model, request);
		if (terminalGroups.isNew()){
			terminalGroupsService.save(terminalGroups);
			//排序
			setSort4insert(this.sort,terminalGroupsService,this.tableName,this.sortField,terminalGroups.getId());
		} else{
			terminalGroupsService.update(terminalGroups);
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
		delete(terminalGroupsService, "TerminalGroups", ids,logicDelete);
		model.addAttribute("message", "删除成功");
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
		
		terminalGroupsService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	/**
	 * 弹出导入页面(项目列表（域名明细）)
	 */
	@RequestMapping(value = "/importView1")
	public String importView1(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/terminalGroups/importExcel1");
		request.setAttribute("navTabId", "everad/conf_terminalGroups_list");
		request.setAttribute("formId", "everad1");
		request.setAttribute("importElement", "#form_everad_conf_terminalGroups_1_import");
		return SessionUtil.getViewPath("/import/import");
	}
	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel1", method = RequestMethod.POST)
	@ResponseBody
	public String importExcel1(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		String returnStrings = FileUtils.parseCsvXls(file, ",");
		return returnStrings;
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/terminalGroups/importExcel");
		request.setAttribute("navTabId", "everad/conf_terminalGroups_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, terminalGroupsService, new TerminalGroups());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(terminalGroupsService, request, response, excelName, sheetName, title);
	}
	
}
