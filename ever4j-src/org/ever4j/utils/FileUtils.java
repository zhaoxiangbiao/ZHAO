package org.ever4j.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.base4j.utils.ExcelUtil;
import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	public static String parseCsvXls(MultipartFile mfile, String separator) {
		StringBuffer sb = new StringBuffer();
		if (mfile != null) {
			try {
				String originName = mfile.getOriginalFilename(); // 取得原文件名
				String fileExt = originName.substring(originName
						.lastIndexOf(".") + 1); // 取得文件后缀
				// xls xlsx
				if (fileExt.equalsIgnoreCase("xls")
						|| fileExt.equalsIgnoreCase("xlsx")) {
					InputStream is = mfile.getInputStream();
					Workbook wb = WorkbookFactory.create(is);
					Sheet sheet = wb.getSheetAt(0);
					int rowNum = sheet.getLastRowNum(); // 得到总行数
					for (int i = 0; i <= rowNum; i++) { //
						Row row = sheet.getRow(i);
						int colNum = row.getLastCellNum();// row.getPhysicalNumberOfCells();
						for (int j = 0; j < colNum; j++) {

							String fieldValue =ExcelUtil.getStringCellValue(row.getCell((short) j));
							if(i>0&&j==0){
								sb.append("\n");
							}
							if(j>0){
								sb.append(separator);
							}
							sb.append(fieldValue);
						}
					}

				} else if (fileExt.equalsIgnoreCase("csv")) {
					InputStream is = mfile.getInputStream();

					BufferedReader reader = new BufferedReader(
							new InputStreamReader(is));
					String line = null;
					int c = 0;
					try {
						while ((line = reader.readLine()) != null) {
							if(c>0){
								sb.append("\n");
							}
							sb.append( line);
							c++;
						}
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						try {
							is.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return sb.toString();
	}
}
