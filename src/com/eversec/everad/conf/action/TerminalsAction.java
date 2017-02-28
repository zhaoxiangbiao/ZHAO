package com.eversec.everad.conf.action;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
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

import com.eversec.everad.conf.entity.Terminals;
import com.eversec.everad.conf.service.TerminalsService;

@Controller
@RequestMapping("/everad/conf/terminals")
public class TerminalsAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_terminals";
	private String sortField = "sort";
	
	@Resource
	private TerminalsService terminalsService;
	
	@Resource
	JdbcTemplate jdbcTemplate;
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/everad/conf/terminals/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	/*@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
				
		// 设置逻辑删除条件
		setLogicDelete(request,logicDelete);
		
		PageData<Terminals> pageData = new PageData<Terminals>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		// 设置排序
		setSort4query(pageData,this.sort);
		
		pageData = terminalsService.find(pageData);
		
		return this.toPageModel(model, pageData);
	}*/
	
	

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/everad/conf/terminals/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Terminals terminals = terminalsService.find(Long.parseLong(id));
		model.addAttribute(terminals);
		return SessionUtil.getViewPath("/everad/conf/terminals/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String terminal_name) {
		HashMap<String, String> phoneNumbersDetail =  terminalsService.listPhoneNumbersDetail(terminal_name);
		model.addAttribute("phoneNumbersDetail", phoneNumbersDetail);
		return SessionUtil.getViewPath("/everad/conf/terminals/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Terminals
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Terminals terminals){
		// 初始化
		returnCommand(model, request);
		if (terminals.isNew()){
			terminalsService.save(terminals);
			//排序
			setSort4insert(this.sort,terminalsService,this.tableName,this.sortField,terminals.getId());
		} else{
			terminalsService.update(terminals);
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
		delete(terminalsService, "Terminals", ids,logicDelete);
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
		
		terminalsService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/terminals/importExcel");
		request.setAttribute("navTabId", "everad/conf_terminals_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, terminalsService, new Terminals());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(terminalsService, request, response, excelName, sheetName, title);
	}
	/**
	 * 复杂查询事例
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Model dailyJson(HttpServletRequest request,Model model,String terminal_name){
		PageData<JSONObject> pageData = new PageData<JSONObject>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		int pageNo = pageData.getPagination().getPageNo();
		int pageSize = pageData.getPagination().getPageSize();
		String order = pageData.getCompositor().getFieldName();
		String orderType = pageData.getCompositor().getCompositorType().toString();
		
		
		String selectSql="select terminal_name, count(1) count ";
		List argList = new ArrayList();
		List<Integer> argTypeList = new ArrayList<Integer>();
		String sql = " from ea_terminal " ;
		if(StringUtils.isNotBlank(terminal_name)){
			
			argList.add(terminal_name);
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
		List listCharts = jdbcTemplate.queryForList(selectSql+sql+" group by terminal_name "+orderSql+limitSql,argList.toArray(),argTypes);
		Map map = jdbcTemplate.queryForMap("select count(distinct terminal_name ) count  "+sql,argList.toArray(),argTypes);
		pageData.setPageNo(pageNo);
		pageData.setPageSize(pageSize);
		pageData.getPagination().setTotalCount(Long.parseLong(map.get("count").toString()));
		pageData.setResult(listCharts);
		return this.toPageModel(model, pageData);
	}
}
