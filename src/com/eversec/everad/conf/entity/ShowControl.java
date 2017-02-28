package com.eversec.everad.conf.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="ea_show_control")
@ClassConfig(title="显示控制表",tableName="ea_show_control" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class ShowControl extends BaseEntity{
	   
		@FieldConfig(title="手机号码")
	    private String phone_number;
	    
		@FieldConfig(title="是否生效",enumType="isOrNot")
	    private Integer is_active;

		public String getPhone_number() {
			return phone_number;
		}

		public void setPhone_number(String phone_number) {
			this.phone_number = phone_number;
		}

		public Integer getIs_active() {
			return is_active;
		}

		public void setIs_active(Integer is_active) {
			this.is_active = is_active;
		}
	    
}
