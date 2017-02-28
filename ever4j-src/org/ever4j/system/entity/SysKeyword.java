package org.ever4j.system.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="SysKeyword")
@ClassConfig(title="内容审计词库", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class SysKeyword extends BaseEntity{
	
	@FieldConfig(title="关键词")
    private String keyword;
    

    
	/**
	 * 
	 */
	@FieldConfig(title="违规类型")
    private String type;

	
	
	/**
	 * 1 自动过滤 、2=告警
	 */
	@FieldConfig(title="违规等级",enumType="sys_keyword_leval")
    private int level;
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
    
}
