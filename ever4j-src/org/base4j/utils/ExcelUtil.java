package org.base4j.utils;

import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.base4j.orm.hibernate.BaseEntity;
import org.base4j.orm.hibernate.BaseService;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class ExcelUtil<T extends BaseEntity> {

	private static Map<Integer, String> fieldMap = new HashMap<Integer, String>();
 	
	
	public static void main(String[] args) throws Exception {
	}
	
    public static <T> List<T> createEntity4ReadExcel(InputStream is, T entity,BaseService service) throws Exception{
    	List<T> entityList = null;
    	
    	try {
			Workbook wb = WorkbookFactory.create(is);
			Sheet sheet = wb.getSheetAt(0);
			entityList = createEntity4readSheet(sheet, entity,service);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("处理异常!");
		} 
		
		return entityList;
	}
    
    @SuppressWarnings("unchecked")
	private static <T> List<T> createEntity4readSheet(Sheet sheet, T entity,BaseService service) throws Exception{
    	List<T> entityList = new ArrayList<T>();

    	int rowNum = sheet.getLastRowNum();	// 得到总行数
    	
    	if(rowNum<2){
    		return entityList;
    	}
    	int s = 2; // 数据开始的行数
    	int t = 1; // 字段名称的行数
    	int d = 1;//数据开始列 （第1列为序号）
    	// 创建位置与字段名称对应关系
//    	System.out.println(sheet.getRow(0).getCell(0));
//    	System.out.println(sheet.getRow(0).getCell(1));
//    	int firstCellNum = sheet.getRow(0).getLastCellNum();
//    	int secondCellNum = sheet.getRow(1).getLastCellNum();
//    	// 如果第一行和第二行的列数不一致，则认为第一行为标题，第二行是字段名称，第三行是数据起始行
//    	if(firstCellNum!=secondCellNum){
//    		s = 2;
//    		t = 1;
//    	}
    	Row filedTitleRow = sheet.getRow(t);
    	for(int j = d; j < filedTitleRow.getPhysicalNumberOfCells(); j++){
    		String fieldDesc = getStringCellValue(filedTitleRow.getCell((short) j));
    		if(StringUtils.isNotEmpty(fieldDesc)){
    			String fieldName = ReflectionUtils.getDeclaredFieldName(entity, fieldDesc);
    			fieldMap.put(Integer.valueOf(j), fieldName);
    		}else{
    			continue;
    		}
    	}
    	
        for (int i = s; i <= rowNum; i++) { // 
            Row row = sheet.getRow(i);
            int colNum = row.getLastCellNum();//row.getPhysicalNumberOfCells();
        	T curEntity = (T) entity.getClass().newInstance();
        	
        	for(int j = d; j < colNum; j++){
        		String fieldName = fieldMap.get(Integer.valueOf(j));
        		if(fieldName!=null){
        			
        			String fieldValue = getStringCellValue(row.getCell((short) j));
        			try{
        				ReflectionUtils.setFieldValueByType(curEntity,fieldName , fieldValue,service);
        			}catch (Exception e) {
        				e.printStackTrace();
        			}
        		}
        	}
        	entityList.add(curEntity);
            
        }
        
        return entityList;
    }
    
    public static String getStringCellValue(Cell cell) {
    	if (cell == null) {
            return "";
        }
    	
        String strCell = "";
        switch (cell.getCellType()) {
        case Cell.CELL_TYPE_STRING:	 // 字符串 
            strCell = cell.getStringCellValue();
            break;
        case Cell.CELL_TYPE_NUMERIC: // 数字  
        	// 时间列改为文本,按文本读取
            if (HSSFDateUtil.isCellDateFormatted(cell)) {
            	double d = cell.getNumericCellValue();
            	Date date = HSSFDateUtil.getJavaDate(d);
            	if(date != null){
            		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            		strCell = sFormat.format(date);
            	}else{
            		strCell = "";
            	}
            }else{
            	DecimalFormat df = new DecimalFormat("0");  
            	  
            	strCell = df.format(cell.getNumericCellValue());  
//            	strCell =  cell.getNumericCellValue() + "";
//            	if(StringUtils.isNotBlank(strCell) && strCell.endsWith(".0")){
//            		strCell = strCell.substring(0,strCell.indexOf(".0"));
//            	}
            }
            
            break;
        case Cell.CELL_TYPE_BOOLEAN: // Boolean 
            strCell = String.valueOf(cell.getBooleanCellValue());
            break;
        case Cell.CELL_TYPE_FORMULA: // 公式  
        	strCell = cell.getCellFormula();
            break; 
        case Cell.CELL_TYPE_BLANK:   // 空值 
            strCell = "";
            break;
        case Cell.CELL_TYPE_ERROR:   // 故障 
        	strCell = "";
            break;  
        default:
            strCell = "";
            break;
        }
        if (strCell == null) {
            return "";
        }
        return strCell;
    }
    
    public static <T> XSSFWorkbook createWorkbook(List<T> entitys, String sheetName, String title){
    	try{
    		int defaultColumnWidth = 20;//默认宽度
    		
    		short titleFontSize = 16;	//表头字体大小
    		short fontSize = 12;		//其他字体大小
    		
    		int titleHeightSize = 410;	//表头行高
    		int heightSize = 290;		//其他行高
    		
    		XSSFWorkbook wb = new XSSFWorkbook();
    		XSSFSheet sheet = createSheet(wb, sheetName, defaultColumnWidth);
    		
    		Font titleFont = createFont(wb, Font.BOLDWEIGHT_BOLD, titleFontSize);
    		CellStyle titleStyle = createBorderCellStyle(wb, titleFont,CellStyle.ALIGN_CENTER);
    		
    		Font font = createFont(wb, Font.DEFAULT_CHARSET, fontSize);
    		CellStyle style = createBorderCellStyle(wb, font,CellStyle.ALIGN_LEFT);
    		CellStyle styleNum = createBorderCellStyle(wb, font,CellStyle.ALIGN_RIGHT);
    		
    		Font rowTitleFont = createFont(wb, Font.BOLDWEIGHT_BOLD, fontSize);
    		CellStyle rowTitleStyle = createBorderCellStyle(wb, rowTitleFont,CellStyle.ALIGN_CENTER);
//    		rowTitleStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
//    		rowTitleStyle.setFillForegroundColor(XSSFColor.);
    		if(entitys != null && entitys.size() > 0){
    			T curEntity = entitys.get(0);
    			int lastRowNum = entitys.size();
    			List<FieldObj> showFields = ReflectionUtils.getShowFields(curEntity);
    			int lastCellNum = showFields == null ? 1 : showFields.size()+1;
    			//创建表头
    			XSSFRow row = createRow(sheet, 0, titleHeightSize);
    			XSSFCell cell = createCell(row, 0, titleStyle);
    			cell.setCellValue(title);
    			
    			CellRangeAddress ca = mergeCell(sheet, 0, 0, 0, lastCellNum-1);
    			setRegionStyle(sheet, ca, titleStyle);
    			
    			//标题
    			XSSFRow titleRow = createRow(sheet, 1, heightSize);
    			for(int cellNum = 0; cellNum < lastCellNum; cellNum ++){
    				XSSFCell titleCell = createCell(titleRow, cellNum, rowTitleStyle);
    				
    				if(cellNum == 0){//序号
    					titleCell.setCellValue("序号");
    				}else {
    					titleCell.setCellValue(showFields.get(cellNum-1).getFieldTitle());
    				}
    			}
    			
    			// 填充数据
    			for(int rowNum = 0; rowNum < lastRowNum; rowNum ++){
        			
        			
        			T entity = entitys.get(rowNum);
        			row = createRow(sheet, rowNum+2, heightSize);//创建内容
        			for(int cellNum = 0; cellNum < lastCellNum; cellNum ++){
        				cell = createCell(row, cellNum, styleNum);
        				if(cellNum == 0){//序号
        					cell.setCellValue(rowNum+1);
        				}else
        				{
        					FieldObj fieldObj = showFields.get(cellNum-1);
        					String fieldType = fieldObj.getFieldType();
        					Object fieldValueObj = ReflectionUtils.getFieldValue(entity, fieldObj.getFieldName());//获得值
        					if(fieldValueObj != null){
        						if(fieldType.endsWith("String")){
        							cell.setCellStyle(style);
        							String enumTypeName = fieldObj.getFieldEnumType();
        							//判断枚举
        							if(StringUtils.isNotEmpty(enumTypeName)){
        								HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        								ServletContext application = request.getSession().getServletContext();
        								Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>) application.getAttribute(Constant.ENUM);
        								
        								
        								List<EnumValuePojo> EnumValuePojos = enumMap.get(enumTypeName);
        								if(EnumValuePojos != null && EnumValuePojos.size() > 0){
        									for (EnumValuePojo enumValuePojo : EnumValuePojos) {
        										if(enumValuePojo != null && (fieldValueObj.toString()).equals(enumValuePojo.getEnumKey())){
        											cell.setCellValue(clearEnumText(enumValuePojo.getEnumVal()));
        										}
        									}
        								}
        							}
        							// 普通字符串
        							else{
        								String s = (String)fieldValueObj;
        									
        									cell.setCellValue(s);
        							}
            					}else if(fieldType.equals("short") || fieldType.endsWith("Short")){
            						cell.setCellStyle(styleNum);
            						cell.setCellValue((Short)fieldValueObj);
            					}else if(fieldType.equals("int") || fieldType.endsWith("Integer")){
            						
            						cell.setCellStyle(styleNum);
            						
            						String enumTypeName = fieldObj.getFieldEnumType();
        							//判断枚举
        							if(StringUtils.isNotEmpty(enumTypeName)){
        								HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        								ServletContext application = request.getSession().getServletContext();
        								Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>) application.getAttribute(Constant.ENUM);
        								
        								
        								List<EnumValuePojo> EnumValuePojos = enumMap.get(enumTypeName);
        								if(EnumValuePojos != null && EnumValuePojos.size() > 0){
        									for (EnumValuePojo enumValuePojo : EnumValuePojos) {
        										if(enumValuePojo != null && (fieldValueObj.toString()).equals(enumValuePojo.getEnumKey())){
        											cell.setCellValue(clearEnumText(enumValuePojo.getEnumVal()));
        										}
        									}
        								}
        							}
        							else {        								
        								cell.setCellValue((Integer)fieldValueObj);
        							}
            					}else if(fieldType.equals("long") || fieldType.endsWith("Long")){
            						cell.setCellStyle(styleNum);
            						cell.setCellValue((Long)fieldValueObj);
            					}
            					else if(fieldType.equals("float") || fieldType.endsWith("Float") ){
            						cell.setCellStyle(styleNum);
            						BigDecimal bd = new BigDecimal(((Float)fieldValueObj).toString());
            						double d = bd.doubleValue();
            						cell.setCellValue(d);
            					}
            					else if(fieldType.endsWith("BigDecimal")){
            						cell.setCellStyle(styleNum);
            						BigDecimal bd = (BigDecimal) fieldValueObj;
            						double d = bd.doubleValue();
            						cell.setCellValue(d);
            					}
            					
            					else if(fieldType.equals("double") || fieldType.endsWith("Double")){
            						cell.setCellStyle(styleNum);
            						cell.setCellValue((Double)fieldValueObj);
            					}else if(fieldType.equals("char") || fieldType.endsWith("Character")){
            						cell.setCellStyle(style);
            						cell.setCellValue(((Character)fieldValueObj).toString());
            					}else if(fieldType.equals("boolean") || fieldType.endsWith("Boolean")){
            						cell.setCellStyle(style);
            						cell.setCellValue((Boolean)fieldValueObj);
            					}else if(fieldType.endsWith("Date")){
            						cell.setCellStyle(style);
            						cell.setCellValue(new SimpleDateFormat(fieldObj.getDateFormat()).format((Date)fieldValueObj));
            					}
        						// 多对一 对象
            					else if(StringUtils.isNotBlank(fieldObj.getValueField())){
            						cell.setCellStyle(style);
            						cell.setCellValue(BeanUtils.getProperty(fieldValueObj,fieldObj.getValueField()));
            					}
        					}
        				}
        			}
        		}
    			for (int i = 0; i < lastCellNum; i++) {
    				sheet.autoSizeColumn(i);
    			}
    		}
    		
    		return wb;
    	}catch (Exception e) {
    		e.printStackTrace();
    		return null;
    	}
    }
    
    private static String clearEnumText(String enumVal) {
		if(StringUtils.isBlank(enumVal) || enumVal.indexOf("</")==-1)
		return enumVal;
		
		try {
			Document doc =  DocumentHelper.parseText(enumVal);
			return doc.getRootElement().getText().trim();
		} catch (DocumentException e) {
			e.printStackTrace();
			return enumVal;
		}
		
	}

	/**
	 * 功能：创建XSSFSheet工作簿
	 * @param 	wb	XSSFWorkbook
	 * @param 	sheetName	String
	 * @return	XSSFSheet
	 */
	public static XSSFSheet createSheet(XSSFWorkbook wb,String sheetName, int defaultColumnWidth){
		XSSFSheet sheet=wb.createSheet(sheetName);
//		sheet.setDefaultColumnWidth(defaultColumnWidth);
		return sheet;
	}
	
	/**
	 * 功能：创建XSSFRow
	 * @param 	sheet	XSSFSheet
	 * @param 	rowNum	int
	 * @param 	height	int
	 * @return	XSSFRow
	 */
	public static XSSFRow createRow(XSSFSheet sheet,int rowNum,int height){
		XSSFRow row=sheet.createRow(rowNum);
		row.setHeight((short)height);
		return row;
	}
	
	/**
	 * 功能：创建CELL
	 * @param 	row		XSSFRow	
	 * @param 	cellNum	int
	 * @param 	style	XSSFStyle
	 * @return	XSSFCell
	 */
	public static XSSFCell createCell(XSSFRow row,int cellNum,CellStyle style){
		XSSFCell cell=row.createCell(cellNum);
		cell.setCellStyle(style);
		return cell;
	}
	
	/**
	 * 功能：创建带边框的CellStyle样式
	 * @param 	wb				XSSFWorkbook	
	 * @param 	backgroundColor	背景色	
	 * @param 	foregroundColor	前置色
	 * @param	font			字体
	 * @param alignRight 
	 * @return	CellStyle
	 */
	public static CellStyle createBorderCellStyle(XSSFWorkbook wb,Font font, short align){
		CellStyle cs=wb.createCellStyle();
		cs.setAlignment(align);
		cs.setWrapText(true);
		cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		
		cs.setFont(font);
		return cs;
	}
	
	/**
	 * 功能：合并单元格
	 * @param 	sheet		XSSFSheet
	 * @param 	firstRow	int
	 * @param 	lastRow		int
	 * @param 	firstColumn	int
	 * @param 	lastColumn	int
	 * @return	int			合并区域号码
	 */
	public static CellRangeAddress mergeCell(XSSFSheet sheet,int firstRow,int lastRow,int firstColumn,int lastColumn){
		CellRangeAddress ca = new CellRangeAddress(firstRow,lastRow,firstColumn,lastColumn);
		sheet.addMergedRegion(ca);
		return ca;
	}
	
	/**
	 * 设置合并单元格的边框样式
	 * @param	sheet	XSSFSheet	
	 * @param 	ca		CellRangAddress
	 * @param 	style	CellStyle
	 */
	public static void setRegionStyle(XSSFSheet sheet, CellRangeAddress ca,CellStyle style) {  
//	    for (int i = ca.getFirstRow(); i <= ca.getLastRow(); i++) {  
//	        XSSFRow row = XSSFCellUtil.getRow(i, sheet);  
//	        for (int j = ca.getFirstColumn(); j <= ca.getLastColumn(); j++) {  
//	            XSSFCell cell = XSSFCellUtil.getCell(row, j);  
//	            cell.setCellStyle(style);  
//	        }  
//	    }  
	}  
	
	/**
	 * 功能：创建字体
	 * @param 	wb			XSSFWorkbook	
	 * @param 	boldweight	short
	 * @param 	color		short
	 * @return	Font	
	 */
	public static Font createFont(XSSFWorkbook wb,short boldweight,short size){
		Font font=wb.createFont();
		font.setFontName("微软雅黑");
		font.setBoldweight(boldweight);
		font.setFontHeightInPoints(size);
		return font;
	}
}
