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

import com.eversec.everad.conf.entity.DetectUrl;
import  com.eversec.everad.conf.service.DetectUrlService;

@Controller
@RequestMapping("/everad/conf/detectUrl")
public class DetectUrlAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_detect_url";
	private String sortField = "sort";
	
	@Resource
	private DetectUrlService detectUrlService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/everad/conf/detectUrl/listPage");
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
		
		PageData<DetectUrl> pageData = new PageData<DetectUrl>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		// 设置排序
		setSort4query(pageData,this.sort);
		
		pageData = detectUrlService.find(pageData);
		
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
		return SessionUtil.getViewPath("/everad/conf/detectUrl/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		DetectUrl detectUrl = detectUrlService.find(Long.parseLong(id));
		model.addAttribute(detectUrl);
		return SessionUtil.getViewPath("/everad/conf/detectUrl/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		DetectUrl detectUrl = detectUrlService.find(Long.parseLong(id));
		model.addAttribute(detectUrl);
		return SessionUtil.getViewPath("/everad/conf/detectUrl/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param DetectUrl
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, DetectUrl detectUrl){
		// 初始化
		returnCommand(model, request);
		if (detectUrl.isNew()){
			detectUrlService.save(detectUrl);
			//排序
			setSort4insert(this.sort,detectUrlService,this.tableName,this.sortField,detectUrl.getId());
		} else{
			detectUrlService.update(detectUrl);
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
		delete(detectUrlService, "DetectUrl", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * 快速设置match_type
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setMatch_type")
	public String setMatch_type(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		DetectUrl detectUrl = detectUrlService.find(Long.parseLong(id));
		detectUrl.setMatch_type(new Integer(value));
		detectUrlService.update(detectUrl);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	/**
	 * 快速设置fetch_aim
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setFetch_aim")
	public String setFetch_aim(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		DetectUrl detectUrl = detectUrlService.find(Long.parseLong(id));
		detectUrl.setFetch_aim(new Integer(value));
		detectUrlService.update(detectUrl);
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
		
		detectUrlService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/detectUrl/importExcel");
		request.setAttribute("navTabId", "everad/conf_detectUrl_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, detectUrlService, new DetectUrl());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(detectUrlService, request, response, excelName, sheetName, title);
	}
	
}
