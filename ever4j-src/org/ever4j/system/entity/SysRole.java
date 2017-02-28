package org.ever4j.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

/**
 * 角色
 * 
 */

@Entity
@Table(name = "SYS_ROLE")
@ClassConfig(title="角色")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","lastUpdateUser","insertUser"})
public class SysRole extends BaseEntity {

	
	//@Column(updatable=false)
	//private Boolean isDel;
	/**
	 * 角色名称
	 */
	@FieldConfig(title="角色名称", validate="required", maxlength=32)
	@Column(unique = true, nullable = false, length = 32)
	private String roleName;

	/**
	 * 创建用户
	 */
	@Column(updatable=false)
	private Long insertUser;
	
	/**
	 * 角色描述
	 */
	@FieldConfig(title="角色描述", maxlength=64)
	@Column(unique = true, length = 64)
	private String roleDesc;

	/**
	 * 是否可用：0：否，1：是
	 */
	@FieldConfig(title="是否可用", enumType="isOrnot",isShowSearch=false,isShowInput=false,isShowList=false)
	@Column(length = 1,columnDefinition="varchar(1) default '1'")
	private String enabled;
	
	/**
	 */
	private String roleType = "3";
	/**
	 * 是否公共角色：0：否  1：是 ，没有创建者的为公共角色，如果是公共角色，则不可修改 不可删除
	 */
	@FieldConfig(title="是否公共角色", enumType="isOrnot",validate="required")
	@Column(name = "common",updatable=false)
	private String common = "0";
	
	private Integer is_del;
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	

	public String getCommon() {
		return common;
	}

	public void setCommon(String common) {
		this.common = common;
	}

//	public Boolean getIsDel() {
//		return isDel;
//	}
//
//	public void setIsDel(Boolean isDel) {
//		this.isDel = isDel;
//	}

	public Long getInsertUser() {
		return insertUser;
	}

	public void setInsertUser(Long insertUser) {
		this.insertUser = insertUser;
	}

	public Integer getIs_del() {
		return is_del;
	}

	public void setIs_del(Integer is_del) {
		this.is_del = is_del;
	}
	
	
}
