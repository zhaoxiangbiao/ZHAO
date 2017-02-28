package com.eversec.everad.conf.entity;
import javax.persistence.*;
import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import java.util.Date;

@Entity
@Table(name="ea_user_label")
@ClassConfig(title="用户-标签对应关系表",tableName="ea_user_label" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class UserLabel extends BaseEntity{
	   
		@FieldConfig(title="用户手机号码")
	    private String phone_number;
	    
		@FieldConfig(title="用户标签")
	    private String label;
		
		@FieldConfig(title="用户对应标签权重")
	    private Long weight;
		
		public String getPhone_number() {
			return phone_number;
		}

		public void setPhone_number(String phone_number) {
			this.phone_number = phone_number;
		}

		public String getLabel() {
			return label;
		}

		public void setLabel(String label) {
			this.label = label;
		}

		public Long getWeight() {
			return weight;
		}

		public void setWeight(Long weight) {
			this.weight = weight;
		}
	    
}
