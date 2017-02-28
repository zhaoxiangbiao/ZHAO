package com.eversec.everad.conf.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="ea_labels")
@ClassConfig(title="群组表（标签库）",tableName="ea_labels" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Labels extends BaseEntity{

		@FieldConfig(title="标签名")
	    private String label;
	    
		@FieldConfig(title="标签下对应的人数")
	    private Long user_count;

		public String getLabel() {
			return label;
		}

		public void setLabel(String label) {
			this.label = label;
		}

		public Long getUser_count() {
			return user_count;
		}

		public void setUser_count(Long user_count) {
			this.user_count = user_count;
		}
	    
}
