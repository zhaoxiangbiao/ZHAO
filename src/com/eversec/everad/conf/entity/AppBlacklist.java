package com.eversec.everad.conf.entity;
import javax.persistence.*;
import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import java.util.Date;

@Entity
@Table(name="ea_app_blacklist")
@ClassConfig(title="APP黑名单表",tableName="ea_app_blacklist" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class AppBlacklist extends BaseEntity{
	   
		@FieldConfig(title="app")
	    private String name;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	    
}
