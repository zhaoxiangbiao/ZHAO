package org.ever4j.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

/**
 * 角色权限表
 * 
 * @author 潘保涛
 * 
 */
@Entity
@Table(name = "SYS_MENU_ROLE")
@ClassConfig(title="角色权限", isShowMenu=false)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler"})
public class SysMenuRole extends BaseEntity {

	@FieldConfig(title="角色ID")
	@Column(name="role_id", nullable = false, length = 11)
	private Long roleId;

	@FieldConfig(title="菜单ID", enumType="")
	@Column(name="menu_id", nullable = false, length = 11)
	private Long menuId;

	

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}
}
