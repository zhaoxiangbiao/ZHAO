package com.eversec.everad.conf.entity;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="ea_content")
@ClassConfig(title="推送内容",tableName="ea_content" ,isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Content extends BaseEntity{
	    @FieldConfig(title="内容名称")
		private String content_name;
	    /*
	     * 标签
	     */
	/*	@FieldConfig(title="标签",valueField="label")
		@ManyToOne
		@Fetch(FetchMode.JOIN)
		@JoinColumn(name = "label",referencedColumnName="id")
		private Labels label;*/

		@FieldConfig(title="是否删除")
	    private int is_del;
	   /**
	   	 *内容类型    1图片2flash
	   	 */
		@FieldConfig(title="内容类型",enumType="ea_content_type")
	    private Integer content_type;
		
		
	    /**
	   	 *形式   1 普通 2对联
	   	 */
		@FieldConfig(title="形式",enumType="ea_content_shape")
	    private Integer content_shape;
	    
		@FieldConfig(title="尺寸",enumType="ea_size")
	    private String content_size;
	    
		@FieldConfig(title="资源地址")
	    private String content_sourceurl;
	    
		@FieldConfig(title="跳转地址")
	    private String content_jumpurl;
	    
		@FieldConfig(title="资源地址")
	    private String content_sourceurl2;
	    
		@FieldConfig(title="跳转地址")
	    private String content_jumpurl2;
	    
		
		@FieldConfig(title="文字标题")
	    private String content_texttitel;
	    
		@FieldConfig(title="文字内容")
	    private String content_textcontent;

		public Integer getContent_type() {
			return content_type;
		}

		public void setContent_type(Integer content_type) {
			this.content_type = content_type;
		}

		public Integer getContent_shape() {
			return content_shape;
		}

		public void setContent_shape(Integer content_shape) {
			this.content_shape = content_shape;
		}

		public String getContent_size() {
			return content_size;
		}

		public void setContent_size(String content_size) {
			this.content_size = content_size;
		}

		public String getContent_sourceurl() {
			return content_sourceurl;
		}

		public void setContent_sourceurl(String content_sourceurl) {
			this.content_sourceurl = content_sourceurl;
		}

		public String getContent_jumpurl() {
			return content_jumpurl;
		}

		public void setContent_jumpurl(String content_jumpurl) {
			this.content_jumpurl = content_jumpurl;
		}

		public String getContent_texttitel() {
			return content_texttitel;
		}

		public void setContent_texttitel(String content_texttitel) {
			this.content_texttitel = content_texttitel;
		}

		public String getContent_textcontent() {
			return content_textcontent;
		}

		public void setContent_textcontent(String content_textcontent) {
			this.content_textcontent = content_textcontent;
		}

		public String getContent_name() {
			return content_name;
		}

		public void setContent_name(String content_name) {
			this.content_name = content_name;
		}

		/*public Labels getLabel() {
			return label;
		}

		public void setLabel(Labels label) {
			this.label = label;
		}*/

		public String getContent_sourceurl2() {
			return content_sourceurl2;
		}

		public void setContent_sourceurl2(String content_sourceurl2) {
			this.content_sourceurl2 = content_sourceurl2;
		}

		public String getContent_jumpurl2() {
			return content_jumpurl2;
		}

		public void setContent_jumpurl2(String content_jumpurl2) {
			this.content_jumpurl2 = content_jumpurl2;
		}

		public int getIs_del() {
			return is_del;
		}

		public void setIs_del(int is_del) {
			this.is_del = is_del;
		}

}
