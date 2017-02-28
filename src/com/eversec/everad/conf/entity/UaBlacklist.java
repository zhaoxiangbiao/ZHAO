package com.eversec.everad.conf.entity;
import javax.persistence.*;
import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import java.util.Date;

@Entity
@Table(name="ea_ua_blacklist")
@ClassConfig(title="UA黑名单",tableName="ea_ua_blacklist" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class UaBlacklist extends BaseEntity{
	   
		@FieldConfig(title="UA")
	    private String name;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	    
}
