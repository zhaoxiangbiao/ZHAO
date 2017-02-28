package com.eversec.everad.conf.entity;
import javax.persistence.*;
import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import java.util.Date;

@Entity
@Table(name="detect_user")
@ClassConfig(title="流量抓取用户",tableName="detect_user" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class DetectUser extends BaseEntity{
	   
		@FieldConfig(title="号码|号段")
	    private String phone_number;
	    
		@FieldConfig(title="类型（1：号码 2：号段）",enumType="ea_number_type")
	    private String number_type;

		public String getPhone_number() {
			return phone_number;
		}

		public void setPhone_number(String phone_number) {
			this.phone_number = phone_number;
		}

		public String getNumber_type() {
			return number_type;
		}

		public void setNumber_type(String number_type) {
			this.number_type = number_type;
		}
	    
}
