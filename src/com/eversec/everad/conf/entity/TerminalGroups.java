package com.eversec.everad.conf.entity;
import javax.persistence.*;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.hibernate.annotations.Type;

import java.util.Date;

@Entity
@Table(name="ea_terminal_groups")
@ClassConfig(title="智能终端白名单组",tableName="ea_terminal_groups" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class TerminalGroups extends BaseEntity{
	   
		@FieldConfig(title="智能终端组名称")
	    private String name;
		
		@Lob()
		@Type(type="text")
		@FieldConfig(title="项目列表（智能终端明细）")
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
