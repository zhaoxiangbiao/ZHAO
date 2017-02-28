package com.eversec.everad.conf.entity;
import javax.persistence.*;
import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import java.util.Date;

@Entity
@Table(name="ea_terminal_ua")
@ClassConfig(title="智能终端特征库",tableName="ea_terminal_ua" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class TerminalUa extends BaseEntity{
	   
		@FieldConfig(title="智能终端名称")
	    private String terminal_name;
	    
		@FieldConfig(title="ua特征")
	    private String ua_reg;

		public String getTerminal_name() {
			return terminal_name;
		}

		public void setTerminal_name(String terminal_name) {
			this.terminal_name = terminal_name;
		}

		public String getUa_reg() {
			return ua_reg;
		}

		public void setUa_reg(String ua_reg) {
			this.ua_reg = ua_reg;
		}
	    
}
