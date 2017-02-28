package com.eversec.everad.conf.entity;
import javax.persistence.*;
import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import java.util.Date;

@Entity
@Table(name="ea_conf")
@ClassConfig(title="全局配置表",tableName="ea_conf" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Conf extends BaseEntity{
	   
		@FieldConfig(title="配置项key")
	    private String conf_key;
	    
		@FieldConfig(title="配置项名称name")
	    private String name;
	    
		@FieldConfig(title="配置项值")
	    private String conf_value;


		public String getConf_key() {
			return conf_key;
		}

		public void setConf_key(String conf_key) {
			this.conf_key = conf_key;
		}

		public String getConf_value() {
			return conf_value;
		}

		public void setConf_value(String conf_value) {
			this.conf_value = conf_value;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

	    
}
