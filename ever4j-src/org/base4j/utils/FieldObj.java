package org.base4j.utils;

public class FieldObj {

	private String fieldTitle;

	private String fieldName;

	private String fieldType;
	
	private String fieldEnumType;
	private String dateFormat;
	private String valueField;
	
	

	public FieldObj(String fieldTitle, String fieldName, String fieldType,
			String fieldEnumType, String dateFormat, String valueField) {
		super();
		this.fieldTitle = fieldTitle;
		this.fieldName = fieldName;
		this.fieldType = fieldType;
		this.fieldEnumType = fieldEnumType;
		this.dateFormat = dateFormat;
		this.valueField = valueField;
	}



	public FieldObj() {
		super();
	}
	
	

	public String getFieldTitle() {
		return fieldTitle;
	}

	public void setFieldTitle(String fieldTitle) {
		this.fieldTitle = fieldTitle;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getFieldEnumType() {
		return fieldEnumType;
	}

	public void setFieldEnumType(String fieldEnumType) {
		this.fieldEnumType = fieldEnumType;
	}

	public String getDateFormat() {
		return dateFormat;
	}

	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}

	public String getValueField() {
		return valueField;
	}

	public void setValueField(String valueField) {
		this.valueField = valueField;
	}
}
