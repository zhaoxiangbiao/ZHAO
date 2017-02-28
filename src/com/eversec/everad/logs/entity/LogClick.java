package com.eversec.everad.logs.entity;
import javax.persistence.*;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.hibernate.annotations.Type;

import java.util.Date;

@Entity
@Table(name="ea_log_click")
@ClassConfig(title="点击日志表",tableName="ea_log_click" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class LogClick extends BaseEntity{
	   
		@FieldConfig(title="手机号")
	    private Long phone_number;
	    
		@FieldConfig(title="请求时间")
		@Temporal(TemporalType.TIMESTAMP)
	    private Date action_time;
	    
		@FieldConfig(title="终端类型")
	    private String terminal;
		
		@FieldConfig(title="ip")
	    private String ip;
		
		@FieldConfig(title="终端类型")
	    private String ct;
	    
		@FieldConfig(title="域名")
	    private String domain;
		
		@Lob()
		@Type(type="text")
		@FieldConfig(title="url地址")
	    private String url;
	    
		@FieldConfig(title="推送状态 ")
	    private Integer status;
	    
		@FieldConfig(title="任务id")
	    private Long taskid;
		@Lob()
		@Type(type="text")
		@FieldConfig(title="UA")
	    private String ua;
	    
		@FieldConfig(title="序列号")
	    private Long sn;

		public Long getPhone_number() {
			return phone_number;
		}

		public void setPhone_number(Long phone_number) {
			this.phone_number = phone_number;
		}

		public Date getAction_time() {
			return action_time;
		}

		public void setAction_time(Date action_time) {
			this.action_time = action_time;
		}

		public String getTerminal() {
			return terminal;
		}

		public void setTerminal(String terminal) {
			this.terminal = terminal;
		}

		public String getDomain() {
			return domain;
		}

		public void setDomain(String domain) {
			this.domain = domain;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
		}

		public Long getTaskid() {
			return taskid;
		}

		public void setTaskid(Long taskid) {
			this.taskid = taskid;
		}

		public String getUa() {
			return ua;
		}

		public void setUa(String ua) {
			this.ua = ua;
		}

		public Long getSn() {
			return sn;
		}

		public void setSn(Long sn) {
			this.sn = sn;
		}

		public String getCt() {
			return ct;
		}

		public void setCt(String ct) {
			this.ct = ct;
		}

		public String getIp() {
			return ip;
		}

		public void setIp(String ip) {
			this.ip = ip;
		}
	    
}
