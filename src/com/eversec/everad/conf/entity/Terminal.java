package com.eversec.everad.conf.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="ea_terminal")
@ClassConfig(title="智能终端库",tableName="ea_terminal" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Terminal extends BaseEntity{
	   
		@FieldConfig(title="手机号码")
	    private String phone_number;
	    
		@FieldConfig(title="终端类型")
	    private String terminal_type;
		
		@FieldConfig(title="终端名称")
	    private String terminal_name;

		@FieldConfig(title="用户对应标签权重")
	    private Long weight;
		
		public Long getWeight() {
			return weight;
		}

		public void setWeight(Long weight) {
			this.weight = weight;
		}

		public String getPhone_number() {
			return phone_number;
		}

		public void setPhone_number(String phone_number) {
			this.phone_number = phone_number;
		}

		public String getTerminal_type() {
			return terminal_type;
		}

		public void setTerminal_type(String terminal_type) {
			this.terminal_type = terminal_type;
		}

		public String getTerminal_name() {
			return terminal_name;
		}

		public void setTerminal_name(String terminal_name) {
			this.terminal_name = terminal_name;
		}
		
}
