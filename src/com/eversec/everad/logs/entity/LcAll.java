package com.eversec.everad.logs.entity;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="ea_lc_all")
@ClassConfig(title="全量任务统计结果表",tableName="ea_lc_all" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class LcAll extends BaseEntity{
	   
	 
		@FieldConfig(title="日期")
		@Temporal(TemporalType.TIMESTAMP)
	    private Date counttime;
	    
		@FieldConfig(title="推送总数量")
	    private Long rs;
	    
		@FieldConfig(title="展示总数量")
	    private Long pv;
	    
		@FieldConfig(title="用户数")
	    private Long uv;
	    
		@FieldConfig(title="总点击量")
	    private Long cli;
	    
		@FieldConfig(title="总关闭数量")
	    private Long clo;

		public Date getCounttime() {
			return counttime;
		}

		public void setCounttime(Date counttime) {
			this.counttime = counttime;
		}

		public Long getRs() {
			return rs;
		}

		public void setRs(Long rs) {
			this.rs = rs;
		}

		public Long getPv() {
			return pv;
		}

		public void setPv(Long pv) {
			this.pv = pv;
		}

		public Long getUv() {
			return uv;
		}

		public void setUv(Long uv) {
			this.uv = uv;
		}

		public Long getCli() {
			return cli;
		}

		public void setCli(Long cli) {
			this.cli = cli;
		}

		public Long getClo() {
			return clo;
		}

		public void setClo(Long clo) {
			this.clo = clo;
		}
	    
}
