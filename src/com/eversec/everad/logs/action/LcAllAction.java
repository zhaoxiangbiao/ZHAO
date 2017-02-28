package com.eversec.everad.logs.action;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.utils.AdDateUtil;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.StringUtil;
import org.ever4j.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.eversec.everad.logs.entity.LcAll;
import com.eversec.everad.logs.service.LcAllService;

@Controller
@RequestMapping("/everad/logs/lcAll")
public class LcAllAction extends BaseAction {

	// 是否逻辑删除
	private boolean logicDelete = false;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_lc_all";
	private String sortField = "sort";

	@Resource
	private LcAllService lcAllService;

	/**
	 * to 查询列表页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request, Model model) {

		return SessionUtil.getViewPath("/everad/logs/lcAll/listPage");
	}

	/**
	 * 显示所有列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model) {

		// 设置逻辑删除条件
		setLogicDelete(request, logicDelete);

		PageData<LcAll> pageData = new PageData<LcAll>();
		// 给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);

		// 设置排序
		setSort4query(pageData, this.sort);

		pageData = lcAllService.find(pageData);

		return this.toPageModel(model, pageData);
	}

	/**
	 * 添加新记录
	 * 
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model) {
		return SessionUtil.getViewPath("/everad/logs/lcAll/input");
	}

	/**
	 * 修改记录
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		LcAll lcAll = lcAllService.find(Long.parseLong(id));
		model.addAttribute(lcAll);
		return SessionUtil.getViewPath("/everad/logs/lcAll/input");
	}

	/**
	 * 查看记录
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		LcAll lcAll = lcAllService.find(Long.parseLong(id));
		model.addAttribute(lcAll);
		return SessionUtil.getViewPath("/everad/logs/lcAll/view");
	}

	/**
	 * 保存记录
	 * 
	 * @param request
	 * @param model
	 * @param LcAll
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, LcAll lcAll) {
		// 初始化
		returnCommand(model, request);
		if (lcAll.isNew()) {
			lcAllService.save(lcAll);
			// 排序
			setSort4insert(this.sort, lcAllService, this.tableName, this.sortField, lcAll.getId());
		} else {
			lcAllService.update(lcAll);
		}

		model.addAttribute("message", "保存成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 删除记录
	 * 
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String ids) {
		// 初始化
		returnCommand(model, request);
		delete(lcAllService, "LcAll", ids, logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 排序
	 * 
	 * @param request
	 * @param model
	 * @param sort
	 * @return
	 */
	@RequestMapping(value = "sort")
	public String sort(HttpServletRequest request, Model model, Integer id, Integer sort, Integer afterSort,
			Integer beforeSort, Integer p) {
		// 初始化
		returnCommand(model, request);

		lcAllService.sort(tableName, id, sort, afterSort, beforeSort, p, sortField);

		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/logs/lcAll/importExcel");
		request.setAttribute("navTabId", "everad/logs_lcAll_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, lcAllService, new LcAll());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName,
			String sheetName, String title) {
		exportExcel(lcAllService, request, response, excelName, sheetName, title);
	}

	@RequestMapping(value = "/ajaxRequest")
	@ResponseBody
	public String requestSum() {
		return lcAllService.getRqSum();
	}

}
