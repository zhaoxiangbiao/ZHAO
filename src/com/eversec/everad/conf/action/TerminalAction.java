package com.eversec.everad.conf.action;

import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.utils.SessionUtil;
import org.json.simple.JSONObject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eversec.everad.conf.entity.Terminal;
import com.eversec.everad.conf.service.TerminalService;

@Controller
@RequestMapping("/everad/conf/terminal")
public class TerminalAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_terminal";
	private String sortField = "sort";
	
	@Resource
	private TerminalService terminalService;
	
	@Resource
	JdbcTemplate jdbcTemplate;
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/everad/conf/terminal/listPage");
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
		
		PageData<Terminal> pageData = new PageData<Terminal>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		// 设置排序
		setSort4query(pageData,this.sort);
		
		pageData = terminalService.find(pageData);
		
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
		return SessionUtil.getViewPath("/everad/conf/terminal/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Terminal terminal = terminalService.find(Long.parseLong(id));
		model.addAttribute(terminal);
		return SessionUtil.getViewPath("/everad/conf/terminal/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		Terminal terminal = terminalService.find(Long.parseLong(id));
		model.addAttribute(terminal);
		return SessionUtil.getViewPath("/everad/conf/terminal/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Terminal
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Terminal terminal){
		// 初始化
		returnCommand(model, request);
		if (terminal.isNew()){
			terminalService.save(terminal);
			//排序
			setSort4insert(this.sort,terminalService,this.tableName,this.sortField,terminal.getId());
		} else{
			terminalService.update(terminal);
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
		delete(terminalService, "Terminal", ids,logicDelete);
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
		
		terminalService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/terminal/importExcel");
		request.setAttribute("navTabId", "everad/conf_terminal_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, terminalService, new Terminal());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(terminalService, request, response, excelName, sheetName, title);
	}
	/**
	 * 复杂查询事例
	 * @param request
	 * @return
	 */
	@RequestMapping("/dailyJson")
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Model dailyJson(HttpServletRequest request,Model model,String itemName){
		PageData<JSONObject> pageData = new PageData<JSONObject>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		int pageNo = pageData.getPagination().getPageNo();
		int pageSize = pageData.getPagination().getPageSize();
		String order = pageData.getCompositor().getFieldName();
		String orderType = pageData.getCompositor().getCompositorType().toString();
		
		
		String selectSql="select terminal_name, count(phone_number) count ";
		List argList = new ArrayList();
		List<Integer> argTypeList = new ArrayList<Integer>();
		String sql = " from ea_terminal " ;
		if(StringUtils.isNotBlank(itemName)){
			
			argList.add(itemName);
			argTypeList.add(Types.VARCHAR);
			sql +=" where terminal_name = ? ";
		}
		
		int[] argTypes=new int[argTypeList.size()];
		for (int i = 0; i < argTypeList.size(); i++) {
			argTypes[i]=argTypeList.get(i);
		}
		String orderSql = " order by "+order+" "+orderType;
		if(order.contains("name")){
			
			orderSql= " order by convert("+order+" USING gbk) "+orderType;
		}
		String limitSql = " limit "+(pageNo-1)*pageSize+","+pageSize;
		List listCharts = jdbcTemplate.queryForList(selectSql+sql+orderSql+limitSql,argList.toArray(),argTypes);
		Map map = jdbcTemplate.queryForMap("select count(1) count  "+sql,argList.toArray(),argTypes);
		pageData.setPageNo(pageNo);
		pageData.setPageSize(pageSize);
		pageData.getPagination().setTotalCount(Long.parseLong(map.get("count").toString()));
		pageData.setResult(listCharts);
		return this.toPageModel(model, pageData);
	}
}
