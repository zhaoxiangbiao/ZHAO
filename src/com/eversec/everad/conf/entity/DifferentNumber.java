package com.eversec.everad.conf.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="ea_different_number")
@ClassConfig(title="异网号码表",tableName="ea_different_number" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class DifferentNumber extends BaseEntity{
	   
		@FieldConfig(title="手机号码")
	    private String phone_number;
	    
		@FieldConfig(title="异网手机号码")
	    private String phone_different_number;
	    
		@FieldConfig(title="异网运营商",enumType="ea_operator")
	    private String operator;
		
		@FieldConfig(title="用户对应标签权重")
	    private Long weight;
		
		public Long getWeight() {
			return weight;
		}

		public void setWeight(Long weight) {
			this.weight = weight;
		}

		public String getPhone_number() {
			return phone_number;
		}

		public void setPhone_number(String phone_number) {
			this.phone_number = phone_number;
		}

		public String getPhone_different_number() {
			return phone_different_number;
		}

		public void setPhone_different_number(String phone_different_number) {
			this.phone_different_number = phone_different_number;
		}

		public String getOperator() {
			return operator;
		}

		public void setOperator(String operator) {
			this.operator = operator;
		}
	    
}
