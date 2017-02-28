package com.eversec.everad.conf.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="ea_user")
@ClassConfig(title="用户画像",tableName="ea_user" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class User extends BaseEntity{
	   
		@FieldConfig(title="手机号码")
	    private String phone_number;
		
		@FieldConfig(title="用户标签数量")
	    private Long label_count;
		
//		@FieldConfig(title="用户偏好")
//	    private String preference;
//	    
//		@FieldConfig(title="是否是集团用户",enumType="isOrNot")
//	    private Integer del_flag;
//		
//		@FieldConfig(title="用户所属的运营商",enumType="ea_operator1")
//	    private String operator;
		public String getPhone_number() {
			return phone_number;
		}

		public void setPhone_number(String phone_number) {
			this.phone_number = phone_number;
		}

		public Long getLabel_count() {
			return label_count;
		}

		public void setLabel_count(Long label_count) {
			this.label_count = label_count;
		}

//		public String getPreference() {
//			return preference;
//		}
//
//		public void setPreference(String preference) {
//			this.preference = preference;
//		}
//
//		public Integer getDel_flag() {
//			return del_flag;
//		}
//
//		public void setDel_flag(Integer del_flag) {
//			this.del_flag = del_flag;
//		}
//
//		public String getOperator() {
//			return operator;
//		}
//
//		public void setOperator(String operator) {
//			this.operator = operator;
//		}

		
	    
}
