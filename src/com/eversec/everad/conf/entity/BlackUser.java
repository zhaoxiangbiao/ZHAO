package com.eversec.everad.conf.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="ea_black_user")
@ClassConfig(title="全局黑名单",tableName="ea_black_user" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class BlackUser extends BaseEntity{
	   
		@FieldConfig(title="黑名单号码")
	    private String phone_number;
	    
		@FieldConfig(title="是够生效",enumType="isOrNot")
	    private Integer is_effect;

		public String getPhone_number() {
			return phone_number;
		}

		public void setPhone_number(String phone_number) {
			this.phone_number = phone_number;
		}

		public Integer getIs_effect() {
			return is_effect;
		}

		public void setIs_effect(Integer is_effect) {
			this.is_effect = is_effect;
		}
	    
}
