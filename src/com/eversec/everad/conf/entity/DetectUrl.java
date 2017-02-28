package com.eversec.everad.conf.entity;
import javax.persistence.*;
import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import java.util.Date;

@Entity
@Table(name="detect_url")
@ClassConfig(title="流量抓取配置",tableName="detect_url" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class DetectUrl extends BaseEntity{
	   
		@FieldConfig(title="域名")
	    private String domain;
	    
		@FieldConfig(title="url")
	    private String url;
	    /**
	     * url  =1 ; cookie = 2; postdata = 3; response = 4;ua = 5
	     */
		@FieldConfig(title="匹配类型",enumType="ea_match_type")
	    private Integer match_type;
	    
		@FieldConfig(title="正则")
	    private String regex;
	    
		@FieldConfig(title="抓取正则")
	    private String fetch_regex;
	    
		@FieldConfig(title="抓取目的",enumType="ea_fetch_aim")
	    private Integer fetch_aim;
	    
		
		@FieldConfig(title="描述")
	    private String des;

		@FieldConfig(title="名称")
	    private String name;
		
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

		public Integer getMatch_type() {
			return match_type;
		}

		public void setMatch_type(Integer match_type) {
			this.match_type = match_type;
		}

		public String getRegex() {
			return regex;
		}

		public void setRegex(String regex) {
			this.regex = regex;
		}

		public String getFetch_regex() {
			return fetch_regex;
		}

		public void setFetch_regex(String fetch_regex) {
			this.fetch_regex = fetch_regex;
		}

		public String getDes() {
			return des;
		}

		public void setDes(String des) {
			this.des = des;
		}

		public Integer getFetch_aim() {
			return fetch_aim;
		}

		public void setFetch_aim(Integer fetch_aim) {
			this.fetch_aim = fetch_aim;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		
}
