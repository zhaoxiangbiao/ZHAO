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
@Table(name="sys_user_group_authority")
@ClassConfig(title="用户组权限",tableName="sys_user_group_authority" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class SysUserGroupAuthority extends BaseEntity{
	   
		@FieldConfig(title="")
	    private Long group_id;
	    
		@FieldConfig(title="")
	    private Integer pub_id;
	    
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
	    private Integer is_del;
	    
		@FieldConfig(title="")
		@Temporal(TemporalType.TIMESTAMP)
	    private Date update_time;

		public Long getGroup_id() {
			return group_id;
		}

		public void setGroup_id(Long group_id) {
			this.group_id = group_id;
		}

		public Integer getPub_id() {
			return pub_id;
		}

		public void setPub_id(Integer pub_id) {
			this.pub_id = pub_id;
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
	    
		
}
