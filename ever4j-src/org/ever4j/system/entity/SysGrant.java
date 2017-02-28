package org.ever4j.system.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="SysGrant")
@ClassConfig(title="通用权限项", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class SysGrant extends BaseEntity{
	
	@FieldConfig(title="权限名称")
    private String grantName;
    
	@FieldConfig(title="权限描述")
	@Column(name="grant_desc")
    private String desc;
	
	@FieldConfig(title="权限分组",enumType="grant_group")
	@Column(name="grant_group")
	private String group;

	public String getGrantName() {
		return grantName;
	}

	public void setGrantName(String grantName) {
		this.grantName = grantName;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public SysGrant(Long id,String grantName, String desc) {
		super();
		this.id = id;
		this.grantName = grantName;
		this.desc = desc;
	}

	public SysGrant() {
		super();
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}
	
	
    
}
