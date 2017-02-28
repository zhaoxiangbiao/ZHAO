package com.eversec.everad.conf.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.eversec.everad.conf.entity.Content;
import com.eversec.everad.conf.service.ContentService;

@Controller
@RequestMapping("/everad/conf/content")
public class ContentAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = true;
	// 是否排序
	private boolean sort = false;
	private String tableName = "null_content";
	private String sortField = "sort";
	
	@Resource
	private ContentService contentService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/everad/conf/content/listPage");
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
		
		PageData<Content> pageData = new PageData<Content>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		
		// 设置排序
		setSort4query(pageData,this.sort);
		
		pageData = contentService.find(pageData);
		
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
		return SessionUtil.getViewPath("/everad/conf/content/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Content content = contentService.find(Long.parseLong(id));
		model.addAttribute(content);
		return SessionUtil.getViewPath("/everad/conf/content/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		Content content = contentService.find(Long.parseLong(id));
		model.addAttribute(content);
		return SessionUtil.getViewPath("/everad/conf/content/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Content
	 * @return  @RequestParam("facePictureFile") MultipartFile facePictureFile
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Content content, @RequestParam("facePictureFile") MultipartFile facePictureFile, @RequestParam("facePicture2File") MultipartFile facePicture2File){
		// 初始化
		returnCommand(model, request);
		if (content.isNew()){
			
			//图片附件
			if(facePictureFile!=null && !facePictureFile.isEmpty()){
				content.setContent_sourceurl(this.handleAttachment(facePictureFile).getAttachNameNew());
			}
			if(facePicture2File!=null && !facePicture2File.isEmpty()){
				content.setContent_sourceurl2(this.handleAttachment(facePicture2File).getAttachNameNew());
			}
//			MultipartFile imgFile = content.getImgFile();
//			MultipartFile imgFile2 = content.getImgFile2();
//			if(imgFile!=null && !imgFile.isEmpty()){
//				content.setContent_sourceurl(this.handleAttachment(imgFile).getAttachNameNew());
//			}
//			if(imgFile2!=null && !imgFile2.isEmpty()){
//				content.setContent_sourceurl2(this.handleAttachment(imgFile2).getAttachNameNew());
//			}
			contentService.save(content);
			//排序
			setSort4insert(this.sort,contentService,this.tableName,this.sortField,content.getId());
		} else{
			//图片附件
			if(facePictureFile!=null && !facePictureFile.isEmpty()){
				content.setContent_sourceurl(this.handleAttachment(facePictureFile).getAttachNameNew());
			}
			if(facePicture2File!=null && !facePicture2File.isEmpty()){
				content.setContent_sourceurl2(this.handleAttachment(facePicture2File).getAttachNameNew());
			}
			contentService.update(content);
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
		delete(contentService, "Content", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * 快速设置content_type
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setContent_type")
	public String setContent_type(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Content content = contentService.find(Long.parseLong(id));
		content.setContent_type(new Integer(value));
		contentService.update(content);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	/**
	 * 快速设置content_shape
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setContent_shape")
	public String setContent_shape(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Content content = contentService.find(Long.parseLong(id));
		content.setContent_shape(new Integer(value));
		contentService.update(content);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	/**
	 * 快速设置content_size
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setContent_size")
	public String setContent_size(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Content content = contentService.find(Long.parseLong(id));
		content.setContent_size(value);
		contentService.update(content);
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
		
		contentService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/everad/conf/content/importExcel");
		request.setAttribute("navTabId", "everad/conf_content_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, contentService, new Content());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(contentService, request, response, excelName, sheetName, title);
	}
	
}
