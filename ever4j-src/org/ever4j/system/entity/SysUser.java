package org.ever4j.system.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * 系统用户
 * 
 * @author 潘保涛
 */
@Entity
@Table(name = "SYS_USER")
@ClassConfig(title="用户")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","insertUser"})
//@JsonIgnoreType(value=true)
public class SysUser extends BaseEntity implements UserDetails ,Cloneable {

	@FieldConfig(title="序列化", isShowList=false, isShowSearch=false, isShowInput=false)
	private static final long serialVersionUID = 1L;

	/**
	 * 账号
	 */
	@FieldConfig(title="账号", validate="required", maxlength=32)
	@Column(name = "user_name", nullable = false, length = 32,updatable=false)// unique = true,
	private String username;

	@FieldConfig(title="密码",isShowSearch=false,isShowList=false, validate="required", maxlength=32)
	@Column(name = "password", nullable = false, length = 32)
	@JsonIgnore
	private String password;

	
	/**
	 * 创建用户
	 */
	@Column(updatable=false)
	private Long insertUser;
	
	/**
	 * 权限
	 */
	@Transient
	@FieldConfig(title="权限", isShowList=false, isShowSearch=false, isShowInput=false)
	@JsonIgnore
	private Collection<GrantedAuthority> authorities;
	
	/**
	 * 账号未过期
	 */
	@Transient
	@FieldConfig(title="账号过期", isShowList=false, isShowSearch=false, isShowInput=false)
	@JsonIgnore
	private boolean accountNonExpired = true;
	
	/**
	 * 账号未锁定
	 */
	@Transient
	@FieldConfig(title="锁定账号", isShowList=false, isShowSearch=false, isShowInput=false)
	@JsonIgnore
	private boolean accountNonLocked = true;
	
	/**
	 * 证书未过期
	 */
	@Transient
	@FieldConfig(title="证书是否过期", isShowList=false, isShowSearch=false, isShowInput=false)
	@JsonIgnore
	private boolean credentialsNonExpired = true;
	
	/**
	 * 是否启用
	 */
	@Transient
	@FieldConfig(title="是否启用", isShowList=false, isShowSearch=false, isShowInput=false)
	@JsonIgnore
	private boolean enabled = true;
	
	
	
	@FieldConfig(title="昵称", validate="required", maxlength=32)
	@Column(name = "name", nullable = true, length = 32)
	private String name;
	
	/**
	 * 用户类型：1：普通用户 2：审计用户
	 */
	@FieldConfig(title="用户类型")
	@Column(name = "user_type", updatable = false)
	private String userType = "1";

	/**
	 * 用户描述
	 */
	@FieldConfig(title="用户描述",isShowList=false,isShowSearch=false, maxlength=256)
	@Column(name = "user_desc", length = 256)
	private String userDesc;
	
	/**
	 * 是否逻辑删除
	 */
	@Column(updatable=false)
	private Integer is_del;
	

	/**
	 * 所在部门
	 */
	@FieldConfig(title="所属部门",valueField="deptName")
	@ManyToOne
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "user_dept")
	private SysDept userDept;


	
	
	/**
	 * 所属角色
	 */
	@FieldConfig(title="所属角色",valueField="roleName")
	@ManyToOne
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "user_role")
	private SysRole userRole;
	
	/**
	 * 所属用户组
	 */
	@FieldConfig(title="所属用户组",valueField="group_name")
	@ManyToOne
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "user_group",referencedColumnName="group_id")
	private SysUserGroup userGroup;
	
	private Date create_time;
	public SysUser() {
		super();
	}

	public SysUser(String username, String password, Collection<GrantedAuthority> authorities, boolean accountNonExpired, boolean accountNonLocked,
			boolean credentialsNonExpired, boolean enabled, String name, String userType, String userDesc, SysDept userDept, SysRole userRole,Integer is_del) {
		super();
		this.username = username;
		this.password = password;
		this.authorities = authorities;
		this.accountNonExpired = accountNonExpired;
		this.accountNonLocked = accountNonLocked;
		this.credentialsNonExpired = credentialsNonExpired;
		this.enabled = enabled;
		this.is_del = is_del;
		this.name = name;
		this.userType = userType;
		this.userDesc = userDesc;
//		this.userDept = userDept;
		this.userRole = userRole;
	}



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public Collection<GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Collection<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserDesc() {
		return userDesc;
	}

	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}

	public SysDept getUserDept() {
		return userDept;
	}

	public void setUserDept(SysDept userDept) {
		this.userDept = userDept;
	}

	public SysRole getUserRole() {
		return userRole;
	}

	public void setUserRole(SysRole userRole) {
		this.userRole = userRole;
	}
	
	
	public SysUserGroup getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(SysUserGroup userGroup) {
		this.userGroup = userGroup;
	}

	public Object cloneMe(){
		try {
			return this.clone();
		} catch (CloneNotSupportedException e) {
			
			e.printStackTrace();
		}
		return  null;
	}

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


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
	
	
}
