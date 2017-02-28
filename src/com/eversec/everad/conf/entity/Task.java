package com.eversec.everad.conf.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Type;

@Entity
@Table(name="ea_task")
@ClassConfig(title="推送任务",tableName="ea_task" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Task extends BaseEntity{
		
	
		
		@FieldConfig(title="任务描述")
	    private String task_des;
		
		@FieldConfig(title="任务展示时长")
	    private String show_time;
		
		@FieldConfig(title="是否删除")
	    private int is_del;
		
		@FieldConfig(title="模板",valueField="name")
		@ManyToOne
		@Fetch(FetchMode.JOIN)
		@JoinColumn(name = "template",referencedColumnName="id")
		private Template template;
		
		@FieldConfig(title="内容",valueField="content_name")
		@ManyToOne
		@Fetch(FetchMode.JOIN)
		@JoinColumn(name = "content",referencedColumnName="id")
		private Content content;
		
		 /*
	     * 标签
	     */
		@FieldConfig(title="标签群组",valueField="label")
		@ManyToOne
		@Fetch(FetchMode.JOIN)
		@JoinColumn(name = "label",referencedColumnName="id")
		private Labels label;
		
		@FieldConfig(title="标签")
	    private String label_text;
		
		@FieldConfig(title="生效状态",enumType="t_ad_status")
	    private Integer is_active;
		
		
		@FieldConfig(title="目标平台类型",enumType="ea_target_platform")
	    private String target_platform;
	

		@FieldConfig(title="推送优先级",enumType="ea_task_priority")
	    private Integer task_priority;

	    
		@Lob()
		@Type(type="text")
		@FieldConfig(title="单任务号码段白名单")
	    private String task_phonesegment;
	    
		@Lob()
		@Type(type="text")
		@FieldConfig(title="单任务号码黑名单")
	    private String task_blackphone;
	    
		@Lob()
		@Type(type="text")
		@FieldConfig(title="单任务号码白名单")
	    private String task_whitephone;
		
		
		@FieldConfig(title="域名白名单组",valueField="name")
		@ManyToOne
		@Fetch(FetchMode.JOIN)
		@JoinColumn(name = "task_domain_group",referencedColumnName="id")
		private DomainGruops task_domain_group;
		
		@FieldConfig(title="ua白名单组",valueField="name")
		@ManyToOne
		@Fetch(FetchMode.JOIN)
		@JoinColumn(name = "task_ua_group",referencedColumnName="id")
		private UaGroups task_ua_group;
		
		@FieldConfig(title="app白名单组",valueField="name")
		@ManyToOne
		@Fetch(FetchMode.JOIN)
		@JoinColumn(name = "task_app_group",referencedColumnName="id")
		private AppGroups task_app_group;
		
		
		@FieldConfig(title="智能终端白名单组",valueField="name")
		@ManyToOne
		@Fetch(FetchMode.JOIN)
		@JoinColumn(name = "task_terminal_group",referencedColumnName="id")
		private TerminalGroups task_terminal_group;
		
		
//		@Lob()
//		@Type(type="text")
//		@FieldConfig(title="域名黑名单")
//	    private String task_blackurl;
	    
//		@Lob()
//		@Type(type="text")
//		@FieldConfig(title="域名白名单")
//	    private String task_whiteurl;
	    
//		@Lob()
//		@Type(type="text")
//		@FieldConfig(title="浏览器标示黑名单")
//	    private String task_blackua;
//	    
//		@Lob()
//		@Type(type="text")
//		@FieldConfig(title="浏览器标示白名单")
//	    private String task_whiteua;
//	    
//		@Lob()
//		@Type(type="text")
//		@FieldConfig(title="app黑名单")
//	    private String task_blackapp;
//	    
//		@Lob()
//		@Type(type="text")
//		@FieldConfig(title="app白名单")
//	    private String task_whiteapp;
	    
		@FieldConfig(title="小时段")
	    private String task_hour;
	    
		@FieldConfig(title="星期")
	    private String task_week;
	    
		@FieldConfig(title="任务推送总量")
	    private Integer task_taskpushtotal;
	    
		@FieldConfig(title="用户推送间隔")
	    private Integer task_interval;
	    
		@FieldConfig(title="每日推送总量")
	    private Integer task_daypushtotal;
	    
		@FieldConfig(title="单用户推送总次数")
	    private Integer task_userpushtotal;
	    
		@FieldConfig(title="用户单日推送总次数")
	    private Integer task_userdaypushtotal;

		//插入时间
		@Temporal(TemporalType.TIMESTAMP )
		@Column(updatable=false,columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
		protected Date create_time;
		
		//最后一次修改时间
		@Temporal(TemporalType.TIMESTAMP)
		@Column()
		protected Date update_time;


		public String getShow_time() {
			return show_time;
		}

		public void setShow_time(String show_time) {
			this.show_time = show_time;
		}

		public int getIs_del() {
			return is_del;
		}

		public void setIs_del(int is_del) {
			this.is_del = is_del;
		}


		public String getTask_des() {
			return task_des;
		}

		public void setTask_des(String task_des) {
			this.task_des = task_des;
		}

		public Integer getTask_priority() {
			return task_priority;
		}

		public void setTask_priority(Integer task_priority) {
			this.task_priority = task_priority;
		}


		public String getTask_phonesegment() {
			return task_phonesegment;
		}

		public void setTask_phonesegment(String task_phonesegment) {
			this.task_phonesegment = task_phonesegment;
		}

		public String getTask_blackphone() {
			return task_blackphone;
		}

		public void setTask_blackphone(String task_blackphone) {
			this.task_blackphone = task_blackphone;
		}

		public String getTask_whitephone() {
			return task_whitephone;
		}

		public void setTask_whitephone(String task_whitephone) {
			this.task_whitephone = task_whitephone;
		}


		public String getTask_hour() {
			return task_hour;
		}

		public void setTask_hour(String task_hour) {
			this.task_hour = task_hour;
		}

		public String getTask_week() {
			return task_week;
		}

		public void setTask_week(String task_week) {
			this.task_week = task_week;
		}

		public Integer getTask_taskpushtotal() {
			return task_taskpushtotal;
		}

		public void setTask_taskpushtotal(Integer task_taskpushtotal) {
			this.task_taskpushtotal = task_taskpushtotal;
		}

		public Integer getTask_interval() {
			return task_interval;
		}

		public void setTask_interval(Integer task_interval) {
			this.task_interval = task_interval;
		}

		public Integer getTask_daypushtotal() {
			return task_daypushtotal;
		}

		public void setTask_daypushtotal(Integer task_daypushtotal) {
			this.task_daypushtotal = task_daypushtotal;
		}

		public Integer getTask_userpushtotal() {
			return task_userpushtotal;
		}

		public void setTask_userpushtotal(Integer task_userpushtotal) {
			this.task_userpushtotal = task_userpushtotal;
		}

		public Integer getTask_userdaypushtotal() {
			return task_userdaypushtotal;
		}

		public void setTask_userdaypushtotal(Integer task_userdaypushtotal) {
			this.task_userdaypushtotal = task_userdaypushtotal;
		}

		public Template getTemplate() {
			return template;
		}

		public void setTemplate(Template template) {
			this.template = template;
		}

		public Content getContent() {
			return content;
		}

		public void setContent(Content content) {
			this.content = content;
		}
		public String getTarget_platform() {
			return target_platform;
		}

		public void setTarget_platform(String target_platform) {
			this.target_platform = target_platform;
		}

		public DomainGruops getTask_domain_group() {
			return task_domain_group;
		}

		public void setTask_domain_group(DomainGruops task_domain_group) {
			this.task_domain_group = task_domain_group;
		}

		public UaGroups getTask_ua_group() {
			return task_ua_group;
		}

		public void setTask_ua_group(UaGroups task_ua_group) {
			this.task_ua_group = task_ua_group;
		}

		public AppGroups getTask_app_group() {
			return task_app_group;
		}

		public void setTask_app_group(AppGroups task_app_group) {
			this.task_app_group = task_app_group;
		}

		public TerminalGroups getTask_terminal_group() {
			return task_terminal_group;
		}

		public void setTask_terminal_group(TerminalGroups task_terminal_group) {
			this.task_terminal_group = task_terminal_group;
		}

		public Integer getIs_active() {
			return is_active;
		}

		public void setIs_active(Integer is_active) {
			this.is_active = is_active;
		}

		public Labels getLabel() {
			return label;
		}

		public void setLabel(Labels label) {
			this.label = label;
		}

		public Date getCreate_time() {
			return create_time;
		}

		public void setCreate_time(Date create_time) {
			this.create_time = create_time;
		}

		public Date getUpdate_time() {
			return update_time;
		}

		public void setUpdate_time(Date update_time) {
			this.update_time = update_time;
		}

		public String getLabel_text() {
			return label_text;
		}

		public void setLabel_text(String label_text) {
			this.label_text = label_text;
		}
		
}
