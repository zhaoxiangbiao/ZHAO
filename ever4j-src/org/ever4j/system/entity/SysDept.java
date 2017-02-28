package org.ever4j.system.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

/**
 * 部门
 * 
 */
@Entity
@Table(name = "SYS_DEPT")
@ClassConfig(title="部门")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler"})
public class SysDept extends BaseEntity {

	/**
	 * 创建用户
	 */
	@JoinColumn(updatable=false)
	private Long insertUser;
	/**
	 * 部门名称
	 */
	@FieldConfig(title="部门名称", validate="required", maxlength=32)
	private String deptName;

	/**
	 * 部门编号
	 */
	@FieldConfig(title="部门编号", validate="required")
	private String deptNum;

	/**
	 * 部门地址
	 */
	@FieldConfig(title="部门地址",isShowSearch=false,maxlength=64)
	private String deptAddr;

	/**
	 * 部门描述
	 */
	@FieldConfig(title="部门描述",isShowSearch=false,isShowList=false)
	private String deptDesc;

	/**
	 * 父ID
	 */
	@FieldConfig(title="上级部门",valueField="deptName")
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	private SysDept parentId;
	
	public SysDept getParentId() {
		return parentId;
	}

	public void setParentId(SysDept parentId) {
		this.parentId = parentId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptNum() {
		return deptNum;
	}

	public void setDeptNum(String deptNum) {
		this.deptNum = deptNum;
	}

	public String getDeptAddr() {
		return deptAddr;
	}

	public void setDeptAddr(String deptAddr) {
		this.deptAddr = deptAddr;
	}

	public String getDeptDesc() {
		return deptDesc;
	}

	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}

	public Long getInsertUser() {
		return insertUser;
	}

	public void setInsertUser(Long insertUser) {
		this.insertUser = insertUser;
	}
}
