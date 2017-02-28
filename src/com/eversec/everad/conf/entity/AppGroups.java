package com.eversec.everad.conf.entity;
import javax.persistence.*;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.hibernate.annotations.Type;

import java.util.Date;

@Entity
@Table(name="ea_app_groups")
@ClassConfig(title="APP白名单组",tableName="ea_app_groups" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class AppGroups extends BaseEntity{
	   
		@FieldConfig(title="APP组名称")
	    private String name;
		@Lob()
		@Type(type="text")
		@FieldConfig(title="项目列表（app明细）")
	    private String items;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getItems() {
			return items;
		}

		public void setItems(String items) {
			this.items = items;
		}
	    
}
