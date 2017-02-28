package org.ever4j.system.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.main.constant.Constant;
import org.ever4j.system.entity.SysDept;
import org.ever4j.system.entity.SysUser;
import org.ever4j.system.service.SysDeptService;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/system/sysDept")
public class SysDeptAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	
	@Resource
	private SysDeptService sysDeptService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/system/sysDept/listPage");
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
		// 用户只能看到自己创建的和自己所属的
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserDept()!=null){
			
			request.setAttribute("filter_LIKES_deptNum_OR_EQI_insertUser", user.getUserDept().getDeptNum()+"_OR_"+user.getId().toString());
		}else{
			this.toPageModel(model, new PageData<SysDept>());
		}
		
		PageData<SysDept> pageData = new PageData<SysDept>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysDeptService.find(pageData);

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
		return SessionUtil.getViewPath("/system/sysDept/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysDept sysDept = sysDeptService.find(Long.parseLong(id));
		model.addAttribute(sysDept);
		return SessionUtil.getViewPath("/system/sysDept/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysDept sysDept = sysDeptService.find(Long.parseLong(id));
		model.addAttribute(sysDept);
		return SessionUtil.getViewPath("/system/sysDept/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysDept
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysDept sysDept){
		// 初始化
		returnCommand(model, request);
		if (sysDept.isNew()){
			
			// 创建者
			SysUser user = SessionUtil.getCurrentUser();
			sysDept.setInsertUser(user.getId());
			sysDeptService.save(sysDept);
		} else{
			sysDeptService.update(sysDept);
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
		if(ids != null && ids.length() > 0){
			String[] idArray = ids.split(",");
			for (String idStr : idArray) {
				if(logicDelete){
					// 逻辑删除
					sysDeptService.batchExecute("update SysDept set "+Constant.LOGIC_DELETE_FIELD+" = 1 where id = ? and id > 1", Long.parseLong(idStr));
				}else{
					// 真删除
					sysDeptService.batchExecute("delete from SysDept  where id = ? and id > 1", Long.parseLong(idStr));
				}
			}
		}
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
		
		
		String tableName = "com_..._class";
		String sortField = "sort";
		sysDeptService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/system/sysDept/importExcel");
		request.setAttribute("navTabId", "system_sysDept_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, sysDeptService, new SysDept());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(sysDeptService, request, response, excelName, sheetName, title);
	}
	
}
