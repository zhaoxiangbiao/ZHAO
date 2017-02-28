package org.ever4j.system.action;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.syservice.server.manager.Factory4Manager;
import org.ever4j.syservice.server.manager.IKeywordsManager;
import org.ever4j.syservice.server.manager.pojo.Keyword;
import org.ever4j.system.entity.SysKeyword;
import org.ever4j.system.service.SysKeywordService;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/system/sysKeyword")
public class SysKeywordAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	
	@Resource
	private SysKeywordService sysKeywordService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/system/sysKeyword/listPage");
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
		
		PageData<SysKeyword> pageData = new PageData<SysKeyword>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysKeywordService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	/**
	 * 同步数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/sync2Service")
	public String sync2Service(HttpServletRequest request,Model model){
		
		returnCommand(model, request);
		List<SysKeyword> list = sysKeywordService.findAll();
		Map<String,Keyword> map = new HashMap<String, Keyword>();
		SysKeyword skw;
		Keyword kw;
		for (int i = 0; i < list.size(); i++) {
			skw = list.get(i);
			kw = new Keyword(skw.getKeyword(),skw.getLevel(),skw.getType());
			map.put(kw.getKeyword(), kw);
		}
		IKeywordsManager km = Factory4Manager.getKeywordsManager();
		try {
			km.initKeywordLib(map);
			model.addAttribute("message", "同步成功");
		} catch (RemoteException e) {
			model.addAttribute("message", "同步失败");
			e.printStackTrace();
		}
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/system/sysKeyword/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysKeyword sysKeyword = sysKeywordService.find(Long.parseLong(id));
		model.addAttribute(sysKeyword);
		return SessionUtil.getViewPath("/system/sysKeyword/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysKeyword sysKeyword = sysKeywordService.find(Long.parseLong(id));
		model.addAttribute(sysKeyword);
		return SessionUtil.getViewPath("/system/sysKeyword/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysKeyword
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysKeyword sysKeyword){
		// 初始化
		returnCommand(model, request);
		if (sysKeyword.isNew()){
//			IKeywordsManager km = Factory4Manager.getKeywordsManager();
//			try {
//				Keyword kw = new Keyword(sysKeyword.getKeyword(), sysKeyword.getLevel(), sysKeyword.getType());
//				km.addKeyword(kw);
//			} catch (RemoteException e) {
//				e.printStackTrace();
//			}
			sysKeywordService.save(sysKeyword);
		} else{
			sysKeywordService.update(sysKeyword);
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
		delete(sysKeywordService, "SysKeyword", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * 快速设置level
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setLevel")
	public String setLevel(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		SysKeyword sysKeyword = sysKeywordService.find(Long.parseLong(id));
		sysKeyword.setLevel(Integer.parseInt(value));
		sysKeywordService.update(sysKeyword);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	/**
	 * 快速设置type
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setType")
	public String setType(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		SysKeyword sysKeyword = sysKeywordService.find(Long.parseLong(id));
		sysKeyword.setType(value);
		sysKeywordService.update(sysKeyword);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/system/sysKeyword/importExcel");
		request.setAttribute("navTabId", "system_sysKeyword_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, sysKeywordService, new SysKeyword());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(sysKeywordService, request, response, excelName, sheetName, title);
	}
	
}
