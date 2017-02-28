package com.eversec.everad.conf.entity;
import javax.persistence.*;
import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import java.util.Date;

@Entity
@Table(name="ea_app_ua")
@ClassConfig(title=" APP-UA对应关系表",tableName="ea_app_ua" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class AppUa extends BaseEntity{
	   
		@FieldConfig(title="app标识")
	    private String app_id;
	    
		@FieldConfig(title="app名称")
	    private String app_name;
	    
		@FieldConfig(title="ua识别正则")
	    private String ua_reg;

		public String getApp_id() {
			return app_id;
		}

		public void setApp_id(String app_id) {
			this.app_id = app_id;
		}

		public String getApp_name() {
			return app_name;
		}

		public void setApp_name(String app_name) {
			this.app_name = app_name;
		}

		public String getUa_reg() {
			return ua_reg;
		}

		public void setUa_reg(String ua_reg) {
			this.ua_reg = ua_reg;
		}
	    
}
