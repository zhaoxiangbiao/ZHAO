package com.eversec.everad.conf.action;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Types;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.ConfigUtil;
import org.base4j.utils.WebUtils;
import org.ever4j.main.constant.Constant;
import org.ever4j.utils.FileUtils;
import org.ever4j.utils.SessionUtil;
import org.joda.time.DateTimeUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;

import com.eversec.everad.conf.entity.Task;
import com.eversec.everad.conf.service.TaskService;

import httl.util.DateUtils;

@Controller
@RequestMapping("/everad/conf/task")
public class TaskAction extends BaseAction {

	// 是否逻辑删除
	private boolean logicDelete = true;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_task";
	private String sortField = "sort";

	@Resource
	private TaskService taskService;

	@Resource
	private JdbcTemplate jdbcTemplate;

	/**
	 * to 查询列表页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request, Model model, Task task) {
		return SessionUtil.getViewPath("/everad/conf/task/listPage");
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

		PageData<Task> pageData = new PageData<Task>();
		// 给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);

		// 设置排序
		setSort4query(pageData, this.sort);

		pageData = taskService.find(pageData);

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
		return SessionUtil.getViewPath("/everad/conf/task/input");
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
		Task task = taskService.find(Long.parseLong(id));
		model.addAttribute(task);
		return SessionUtil.getViewPath("/everad/conf/task/input");
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
		Task task = taskService.find(Long.parseLong(id));
		model.addAttribute(task);
		return SessionUtil.getViewPath("/everad/conf/task/view");
	}

	/**
	 * 保存记录
	 * 
	 * @param request
	 * @param model
	 * @param Task
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Task task) {
		// 初始化
		returnCommand(model, request);
		Date date = new Date();
		if (task.isNew()) {

			task.setCreate_time(date);
			task.setUpdate_time(date);
			taskService.save(task);
			// 排序
			setSort4insert(this.sort, taskService, this.tableName, this.sortField, task.getId());
		} else {
			task.setUpdate_time(date);
			taskService.update(task);
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
		if (ids != null && ids.length() > 0) {
			String[] idArray = ids.split(",");
			for (String idStr : idArray) {
				if (logicDelete) {
					// 逻辑删除
					taskService.batchExecute(
							"update Task set " + Constant.LOGIC_DELETE_FIELD + " = 1 ,is_active = 0  where id = ?",
							Long.parseLong(idStr));
				} else {
					// 真删除
					taskService.batchExecute("delete from Task  where id = ?", Long.parseLong(idStr));
				}
			}
		}
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 批量停止
	 * 
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/batchStop")
	public String batchStop(HttpServletRequest request, Model model, String ids) {
		// 初始化
		returnCommand(model, request);
		// batchStop(taskService, "Task", ids,logicDelete);
		taskService.batchStop(ids);
		model.addAttribute("message", "批量停止成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 批量启用
	 * 
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/batchStart")
	public String batchStart(HttpServletRequest request, Model model, String ids) {
		// 初始化
		returnCommand(model, request);
		taskService.batchStart(ids);
		model.addAttribute("message", "批量启用成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 全部停止
	 * 
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/allStop")
	public String allStop(HttpServletRequest request, Model model) {
		// 初始化
		returnCommand(model, request);
		int allStop = taskService.allStop();
		if (allStop > 0) {
			model.addAttribute("message", "全部停止");
		}
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 全部启用
	 * 
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/allStart")
	public String allStart(HttpServletRequest request, Model model, String ids) {
		// 初始化
		returnCommand(model, request);
		int allStart = taskService.allStart();
		if (allStart > 0) {
			model.addAttribute("message", "全部启用");
		}
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 快速设置target_platform
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setTarget_platform")
	public String setTarget_platform(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Task task = taskService.find(Long.parseLong(id));
		task.setTarget_platform(value);
		taskService.update(task);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 快速设置task_priority
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setTask_priority")
	public String setTask_priority(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Task task = taskService.find(Long.parseLong(id));
		task.setTask_priority(Integer.parseInt(value));
		taskService.update(task);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 快速设置task_priority
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setIs_active")
	public String setIs_active(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Task task = taskService.find(Long.parseLong(id));
		task.setIs_active(Integer.parseInt(value));
		taskService.update(task);
		model.addAttribute("message", "设置成功");
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

		taskService.sort(tableName, id, sort, afterSort, beforeSort, p, sortField);

		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 弹出导入页面(号码白名单)
	 */
	@RequestMapping(value = "/importView1")
	public String importView1(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/task/importExcel1");
		request.setAttribute("navTabId", "everad/conf_task_list");
		request.setAttribute("formId", "everad1");
		request.setAttribute("importElement", "#task_whitephone_import");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 弹出导入页面(号码黑名单)
	 */
	@RequestMapping(value = "/importView2")
	public String importView2(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/task/importExcel1");
		request.setAttribute("navTabId", "everad/conf_task_list");
		request.setAttribute("formId", "everad2");

		request.setAttribute("importElement", "#task_blackphone_import");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 弹出导入页面(号码段白名单)
	 */
	@RequestMapping(value = "/importView3")
	public String importView3(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/task/importExcel1");
		request.setAttribute("navTabId", "everad/conf_task_list");
		request.setAttribute("formId", "everad3");
		request.setAttribute("importElement", "#task_phonesegment_import");
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
		// this.importExcel(model, request, file, taskService, new Task());
		// return SessionUtil.getViewPath("/commons/ajaxDone");
		return returnStrings;
	}

	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/task/importExcel");
		request.setAttribute("navTabId", "everad/conf_task_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, taskService, new Task());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	@RequestMapping(value = "/sync")
	public String sync(HttpServletRequest request, Model model) {
		returnCommand(model, request);
		String message = ConfigUtil.reloadConfig();
		model.addAttribute("message", "成功");
		if (message.contains("失败"))
			model.addAttribute("type", "warning");

		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 复杂查询事例
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totalQuery")
	public String dailyJson(HttpServletRequest request, Model model, String id) {
		String date = DateUtils.format(new Date(), "yyyyMMdd");
		NumberFormat numberFormat = NumberFormat.getInstance();
		numberFormat.setMaximumFractionDigits(2);
		String reqSql = "SELECT  COUNT(id)  id FROM ea_log_request_" + date + " WHERE  taskid =?";
		String showSql = "SELECT  COUNT(id) id FROM ea_log_show_" + date + " WHERE  taskid =?";
		String cliSql = "SELECT  COUNT(id) id FROM ea_log_click_" + date + " WHERE  taskid =?";
		String cloSql = "SELECT  COUNT(id)  id FROM   ea_log_close_" + date + " WHERE  taskid =?";
		String userSql = "select count(distinct phone_number) ruser from  ea_log_request_" + date + " WHERE  taskid =?";
		String showUserSql = "select count(distinct phone_number) suser from  ea_log_show_" + date + " WHERE  taskid =?";
		String ipSql = "select count(distinct ip)  ip from  ea_log_request_" + date + " WHERE  taskid =?";
		Map<String, Object> cliMap = jdbcTemplate.queryForMap(cliSql, id);
		Map<String, Object> cloMap = jdbcTemplate.queryForMap(cloSql, id);
		Map<String, Object> resMap = jdbcTemplate.queryForMap(reqSql, id);
		Map<String, Object> showMap = jdbcTemplate.queryForMap(showSql, id);
		Map<String, Object> userMap = jdbcTemplate.queryForMap(userSql, id);
		Map<String, Object> ipMap = jdbcTemplate.queryForMap(ipSql, id);
		Map<String, Object> showUserMap = jdbcTemplate.queryForMap(showUserSql, id);
		Long resCount = (Long) resMap.get("id");
		Long showCount = (Long) showMap.get("id");
		String showResult = "";
		String cliResult = "";
		String showUserPir = "";
		// 展示成功率
		if (resCount != 0) {
			showResult = numberFormat.format(Float.valueOf(showMap.get("id").toString()) / (float) resCount * 100);
		}
		// 点击率
		if (showCount != 0) {
			cliResult = numberFormat.format(Float.valueOf(cliMap.get("id").toString()) / (float) showCount * 100);
		}
		Long ruserCount = (Long) userMap.get("ruser");
		if (ruserCount != 0) {
			// 用户到达率
			showUserPir = numberFormat.format(Float.valueOf(showUserMap.get("suser").toString())
					/ Float.valueOf(userMap.get("ruser").toString()) * 100);
		}
		request.setAttribute("rescount", resMap.get("id"));
		request.setAttribute("showcount", showMap.get("id"));
		request.setAttribute("clicount", cliMap.get("id"));
		request.setAttribute("clocount", cloMap.get("id"));
		request.setAttribute("ruser", userMap.get("ruser"));
		request.setAttribute("ip", ipMap.get("ip"));
		request.setAttribute("suser", showUserMap.get("suser"));
		request.setAttribute("showper", StringUtils.isBlank(showResult) ? 0 : showResult);
		request.setAttribute("showUserPir", StringUtils.isBlank(showUserPir) ? 0 : showResult);
		request.setAttribute("cliper", StringUtils.isBlank(cliResult) ? 0 : cliResult);
		return SessionUtil.getViewPath("/everad/conf/task/total");
	}

}
