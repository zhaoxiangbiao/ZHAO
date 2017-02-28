package org.ever4j.system.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="sys_user_group")
@ClassConfig(title="用户组",tableName="sys_user_group" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class SysUserGroup extends BaseEntity{
	   
		/**
		 * 角色名称
		 */
		@FieldConfig(title="用户组名称", validate="required", maxlength=32)
		@Column(unique = true, nullable = false, length = 32)
		private String group_name;
		/**
		 * 角色描述
		 */
		@FieldConfig(title="用户组描述", maxlength=64)
		@Column(unique = true, length = 64)
	    private String group_desc;
	    
		@FieldConfig(title="用户组id")
		private Long group_id;
		
		@FieldConfig(title="")
		@Column(updatable=false)
	    private Long insert_user;
	    
		@FieldConfig(title="")
	    private Long last_update_user;
	    
		@FieldConfig(title="")
		@Column(updatable=false)
		@Temporal(TemporalType.TIMESTAMP)
	    private Date create_time;
	    
		@FieldConfig(title="")
	    private String group_type = "0";
	    
		@FieldConfig(title="")
	    private Integer is_del;
	    
		@FieldConfig(title="")
		@Temporal(TemporalType.TIMESTAMP)
	    private Date update_time;
	    
		@FieldConfig(title="0为启用，1为停用")
	    private Integer status;
		
		public Long getGroup_id() {
			return group_id;
		}

		public void setGroup_id(Long group_id) {
			this.group_id = group_id;
		}

		public String getGroup_desc() {
			return group_desc;
		}

		public void setGroup_desc(String group_desc) {
			this.group_desc = group_desc;
		}

		public String getGroup_name() {
			return group_name;
		}

		public void setGroup_name(String group_name) {
			this.group_name = group_name;
		}

		public Long getInsert_user() {
			return insert_user;
		}

		public void setInsert_user(Long insert_user) {
			this.insert_user = insert_user;
		}

		public Long getLast_update_user() {
			return last_update_user;
		}

		public void setLast_update_user(Long last_update_user) {
			this.last_update_user = last_update_user;
		}

		public Date getCreate_time() {
			return create_time;
		}

		public void setCreate_time(Date create_time) {
			this.create_time = create_time;
		}

		public String getGroup_type() {
			return group_type;
		}

		public void setGroup_type(String group_type) {
			this.group_type = group_type;
		}

		public Integer getIs_del() {
			return is_del;
		}

		public void setIs_del(Integer is_del) {
			this.is_del = is_del;
		}

		public Date getUpdate_time() {
			return update_time;
		}

		public void setUpdate_time(Date update_time) {
			this.update_time = update_time;
		}

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
		}
		
		
	    
}
