package com.eversec.everad.conf.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eversec.everad.conf.entity.User;
import com.eversec.everad.conf.service.UserService;

@Controller
@RequestMapping("/everad/conf/user")
public class UserAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_user";
	private String sortField = "sort";
	
	@Resource
	private UserService userService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/everad/conf/user/listPage");
	}
	/**
	 * to 查看用户对应标签数量对应的标签的明细
	 * @param request
	 * @return
	 */
	@RequestMapping("/listLabelsDetail")
	public String listLabelsDetail(HttpServletRequest request,Model model,User user){
		
		HashMap<String, String> labelsDetail =  userService.listLabelsDetail(user);
		model.addAttribute("labelsDetail", labelsDetail);
		return SessionUtil.getViewPath("/everad/conf/user/listLabelsDetail");
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
		
		PageData<User> pageData = new PageData<User>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		// 设置排序
		setSort4query(pageData,this.sort);
		
		pageData = userService.find(pageData);
		
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
		return SessionUtil.getViewPath("/everad/conf/user/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		User user = userService.find(Long.parseLong(id));
		model.addAttribute(user);
		return SessionUtil.getViewPath("/everad/conf/user/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		User user = userService.find(Long.parseLong(id));
		
		List<JSONObject>  listJson = new ArrayList<JSONObject>();
		model.addAttribute(user);
		HashMap<String, String> labelsDetail =  userService.listLabelsDetail(user);
		if(labelsDetail != null){
			for (String key : labelsDetail.keySet()) {
				System.out.println("key= "+ key + " and value= " + labelsDetail.get(key));
				JSONObject labelDetailJson = new JSONObject(); 
				labelDetailJson.put("x", Integer.parseInt(labelsDetail.get(key)));
				labelDetailJson.put("y", Integer.parseInt(labelsDetail.get(key)));
				labelDetailJson.put("z", Integer.parseInt(labelsDetail.get(key)));
				labelDetailJson.put("name", key);
				labelDetailJson.put("country", key);
				listJson.add(labelDetailJson);
			}
		}
		
	    String labelDetailJsonString = listJson.toString();
		System.out.println("--------------"+labelDetailJsonString);
		model.addAttribute("labelsDetail", labelsDetail);
		model.addAttribute("labelDetailJsonString", labelDetailJsonString);
		return SessionUtil.getViewPath("/everad/conf/user/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param User
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, User user){
		// 初始化
		returnCommand(model, request);
		if (user.isNew()){
			userService.save(user);
			//排序
			setSort4insert(this.sort,userService,this.tableName,this.sortField,user.getId());
		} else{
			userService.update(user);
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
		delete(userService, "User", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * 快速设置del_flag
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setDel_flag")
	public String setDel_flag(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		User user = userService.find(Long.parseLong(id));
//		user.setDel_flag(Integer.parseInt(value));
		userService.update(user);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	/**
	 * 快速设置operator
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setOperator")
	public String setOperator(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		User user = userService.find(Long.parseLong(id));
//		user.setOperator(value);
		userService.update(user);
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
		
		userService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/user/importExcel");
		request.setAttribute("navTabId", "everad/conf_user_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, userService, new User());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(userService, request, response, excelName, sheetName, title);
	}
	
}
