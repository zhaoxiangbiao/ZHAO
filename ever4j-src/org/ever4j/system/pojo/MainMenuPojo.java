package org.ever4j.system.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 页面菜单对象
 *
 */
public class MainMenuPojo implements Cloneable , Serializable{
	
	private static final long serialVersionUID = -3094625214775326258L;

	private Long id;
	
	/**
	 * 描述
	 */
	private String menuDesc;
	
	/**
	 * 链接
	 */
	private String menuName;
	
	/**
	 * 是否可点击
	 */
	private String enabled;
	
	private String menuType;

	private Long pid;

	private Integer external;
	
	private String target;
	
	
	private String icon;
	
	private List<MainMenuPojo> menus = new ArrayList<MainMenuPojo>();

	private String summary;
	private String badge;
	
	public MainMenuPojo() {
		super();
	}

	public MainMenuPojo(Long id, String menuDesc, String menuName, String menuType, Long pid, Integer external,String target,String icon, String summary, String enabled, String badge) {
		super();
		this.id = id;
		this.menuDesc = menuDesc;
		this.menuName = menuName;
		this.menuType = menuType;
		this.pid = pid;
		this.external = external;
		this.target = target;
		this.icon = icon;
		this.summary = summary;
		this.enabled = enabled;
		this.badge = badge;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMenuDesc() {
		return menuDesc;
	}

	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuRel() {
		String rel="";
		if(menuName != null && !menuName.trim().equals("")){
			if(menuName.startsWith("/") && menuName.length() > 1){
				menuName =  menuName.substring(1);
			}
			if(menuName.indexOf("?") != -1){
				menuName =  menuName.substring(0,menuName.indexOf("?"));
			}
			rel = menuName.replaceAll("/", "_");
		}
		return rel;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public List<MainMenuPojo> getMenus() {
		return menus;
	}

	public void setMenus(List<MainMenuPojo> menus) {
		this.menus = menus;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}
	
	public Object cloneMe(){
		try {
			return this.clone();
		} catch (CloneNotSupportedException e) {
			
			e.printStackTrace();
		}
		return  null;
	}

	public Integer getExternal() {
		return external;
	}

	public void setExternal(Integer external) {
		this.external = external;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getBadge() {
		return badge;
	}

	public void setBadge(String badge) {
		this.badge = badge;
	}
}
