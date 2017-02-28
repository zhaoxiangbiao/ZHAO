package com.eversec.everad.conf.entity;
import javax.persistence.*;
import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import java.util.Date;

@Entity
@Table(name="ea_black_user_seg")
@ClassConfig(title="全局号码段黑名单",tableName="ea_black_user_seg" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class BlackUserSeg extends BaseEntity{
	   
		@FieldConfig(title="黑名单号码")
	    private String phone_number;
	    
		@FieldConfig(title="是够生效")
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
