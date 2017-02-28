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

import com.eversec.everad.conf.entity.UaGroups;
import  com.eversec.everad.conf.service.UaGroupsService;

@Controller
@RequestMapping("/everad/conf/uaGroups")
public class UaGroupsAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_ua_groups";
	private String sortField = "sort";
	
	@Resource
	private UaGroupsService uaGroupsService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/everad/conf/uaGroups/listPage");
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
		
		PageData<UaGroups> pageData = new PageData<UaGroups>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		// 设置排序
		setSort4query(pageData,this.sort);
		
		pageData = uaGroupsService.find(pageData);
		
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
		return SessionUtil.getViewPath("/everad/conf/uaGroups/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		UaGroups uaGroups = uaGroupsService.find(Long.parseLong(id));
		model.addAttribute(uaGroups);
		return SessionUtil.getViewPath("/everad/conf/uaGroups/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		UaGroups uaGroups = uaGroupsService.find(Long.parseLong(id));
		model.addAttribute(uaGroups);
		return SessionUtil.getViewPath("/everad/conf/uaGroups/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param UaGroups
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, UaGroups uaGroups){
		// 初始化
		returnCommand(model, request);
		if (uaGroups.isNew()){
			uaGroupsService.save(uaGroups);
			//排序
			setSort4insert(this.sort,uaGroupsService,this.tableName,this.sortField,uaGroups.getId());
		} else{
			uaGroupsService.update(uaGroups);
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
		delete(uaGroupsService, "UaGroups", ids,logicDelete);
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
		
		uaGroupsService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 弹出导入页面(项目列表（UA明细）)
	 */
	@RequestMapping(value = "/importView1")
	public String importView1(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/uaGroups/importExcel1");
		request.setAttribute("navTabId", "everad/conf_uaGroups_list");
		request.setAttribute("formId", "everad1");
		request.setAttribute("importElement", "#form_everad_conf_uaGroups_1_import");
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
		request.setAttribute("uri", "/everad/conf/uaGroups/importExcel");
		request.setAttribute("navTabId", "everad/conf_uaGroups_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, uaGroupsService, new UaGroups());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(uaGroupsService, request, response, excelName, sheetName, title);
	}
	
}
