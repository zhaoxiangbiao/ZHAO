package org.ever4j.system.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.main.constant.Constant;
import org.ever4j.system.entity.SysMenu;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.RoleUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysMenuService extends BaseService<SysMenu> {
	@Override
	@Resource(name="sysMenuDao")
	public void setBaseDao(BaseDao<SysMenu> baseDao){
		this.baseDao = baseDao;
	}
	
	/**
	 * 给菜单添加权限标示符
	 * @param sysMenu
	 * @return
	 */
	public void grantedAuthority(SysMenu sysMenu){
		if(!"1".equals(sysMenu.getMenuType())){//菜单链接
			String menuName = sysMenu.getMenuName();
			if(menuName != null && !menuName.trim().equals("")){
				String curMenuName = menuName;
				if(menuName.startsWith("/") && menuName.length() > 1){
					curMenuName =  menuName.substring(1);
				}
				if(menuName.indexOf("?") != -1){
					curMenuName =  menuName.substring(0,menuName.indexOf("?"));
				}
				sysMenu.setAuthorityName(Constant.AUTH_PREFIX+curMenuName.replaceAll("/", "_").toUpperCase());
			}
		}
	}
	
	
	/**
	 * 复制一个菜单（同时复制其直接子节点）
	 * @param id
	 */
	public void copyMenu(Long id){
		SysMenu sm = this.find(id);
		// 只能复制菜单
		if("2".equals(sm.getMenuType())){
			
			String copySelfSql = "insert into sys_menu (visible,authority_name,enabled,menu_desc,menu_name,menu_type,external,icon,summary,parent_id) select visible,authority_name,enabled,menu_desc,menu_name,menu_type,external,icon,summary,parent_id from sys_menu where id=?";
			this.executeBySql(copySelfSql,id);
			BigInteger ido = (BigInteger) this.uniqueResult("SELECT LAST_INSERT_ID()");
			String copyChildrenSql = "insert into sys_menu (visible,authority_name,enabled,menu_desc,menu_name,menu_type,external,icon,summary,parent_id) select visible,authority_name,enabled,menu_desc,menu_name,menu_type,external,icon,summary, ? from sys_menu where parent_id=?";
			this.executeBySql(copyChildrenSql, ido,id);
		}
	}
	/**
	 * 复制菜单下的按钮到目标菜单
	 * @param id
	 */
	public void copyMenuTo(Long id,String targetId){
		SysMenu sm = this.find(id);
		// 只能复制菜单
		if("2".equals(sm.getMenuType())){
			Long ido = Long.parseLong(targetId);
			String copyChildrenSql = "insert into sys_menu (visible,authority_name,enabled,menu_desc,menu_name,menu_type,external,icon,summary,parent_id) select visible,authority_name,enabled,menu_desc,menu_name,menu_type,external,icon,summary, ? from sys_menu where parent_id=?";
			this.executeBySql(copyChildrenSql, ido,id);
		}
	}
	/**
	 * 复制一个菜单（同时复制其直接子节点）
	 * @param id
	 */
	public void copyMenus(String ids){
		if(StringUtils.isNotBlank(ids)){
			String[] idsArray = ids.split(",");
			
			for (int i = 0; i < idsArray.length; i++) {
				copyMenu(new Long(idsArray[i]));
			}
		}
	}
	/**
	 * 复制菜单下的按钮到目标菜单
	 * @param id
	 */
	public void copyMenusTo(String ids,String targetId){
		if(StringUtils.isNotBlank(ids)){
			String[] idsArray = ids.split(",");
			
			for (int i = 0; i < idsArray.length; i++) {
				copyMenuTo(new Long(idsArray[i]),targetId);
			}
		}
	}
	
	/**
	 * 根据seq获得菜单集合
	 * @param type "":所有菜单,1:不是目录，2:不是链接，3：不是按钮
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SysMenu> menuListOrderSeq(String type,SysUser user){
		StringBuilder sql = null;
		if(RoleUtil.isAllGrant(user)){
			
			sql = new StringBuilder("SELECT m.id, m.menu_desc, m.menu_name, m.menu_type,m.parent_id,m.menu_seq,m.icon FROM sys_menu m  where 1=1 ");
		}else{
			sql = new StringBuilder("SELECT m.id, m.menu_desc, m.menu_name, m.menu_type,m.parent_id,m.menu_seq ,m.icon FROM sys_menu m ,sys_menu_role mr where m.id=mr.menu_id and m.visible=1 and mr.role_id ="+user.getUserRole().getId().toString()+" ");
			
		}
		if(type !=null && !type.equals("")){
			sql.append(" and m.menu_type !='"+type+"'");
		}
		sql.append(" order by  m.menu_seq");
		
		List<Object> objs = this.findBySql(sql.toString());
		List<SysMenu> menuLists = new ArrayList<SysMenu>();
		if(objs != null && objs.size() > 0){
			
			for (Object obj : objs) {
				if(obj != null){
					Object[] strs = (Object[])obj;
					BigInteger id = (BigInteger)strs[0];
					String menuDesc = (String)strs[1];
					String menuName = (String)strs[2];
					String menuType = (String)strs[3];
					BigInteger parentId = strs[4] == null ? null : (BigInteger)strs[4];
					Integer menuSeq = strs[5] == null ? 0 : (Integer)strs[5];
					
					SysMenu curSysMenu = null;
					if(parentId == null){
						curSysMenu = new SysMenu(id.longValue(), menuDesc, menuType, menuName, menuSeq, "", "1", null);
					}else{
						SysMenu parentMenu = new SysMenu();
						parentMenu.setId(parentId==null?null:parentId.longValue());
						curSysMenu = new SysMenu(id.longValue(), menuDesc, menuType, menuName, menuSeq, "", "1", parentMenu);
					}
					curSysMenu.setIcon((String) strs[6]);
					menuLists.add(curSysMenu);
				}
			}
		}
		return menuLists;
	}
}
