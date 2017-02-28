package com.eversec.everad.conf.entity;

import org.base4j.orm.hibernate.BaseEntity;
import org.ever4j.annotation.ClassConfig;
@ClassConfig(title="智能终端",tableName="ea_terminals" ,isShowMenu=true)
public class Terminals extends BaseEntity{
	
		private String terminal_type;
	  	private Long phone_numbers;
		public String getTerminal_type() {
			return terminal_type;
		}
		public void setTerminal_type(String terminal_type) {
			this.terminal_type = terminal_type;
		}
		public Long getPhone_numbers() {
			return phone_numbers;
		}
		public void setPhone_numbers(Long phone_numbers) {
			this.phone_numbers = phone_numbers;
		}  
	  
}
