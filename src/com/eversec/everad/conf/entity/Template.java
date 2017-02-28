package com.eversec.everad.conf.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="ea_template")
@ClassConfig(title="模板表",tableName="ea_task" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Template extends BaseEntity{
	   
		@FieldConfig(title="模板名称")
	    private String name;

		@FieldConfig(title="是否删除")
	    private int is_del;
		
		@FieldConfig(title="尺寸",enumType="ea_size")
	    private String size;
	    
		@FieldConfig(title="位置" ,enumType="ea_location")
	    private String location;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getSize() {
			return size;
		}

		public void setSize(String size) {
			this.size = size;
		}

		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}

		public int getIs_del() {
			return is_del;
		}

		public void setIs_del(int is_del) {
			this.is_del = is_del;
		}
		
	    
}
