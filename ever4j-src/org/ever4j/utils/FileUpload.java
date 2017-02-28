package org.ever4j.utils;

import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStream;  
import java.io.PrintWriter;  
import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.List;  
import java.util.UUID;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.FileUploadException;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  
import org.apache.commons.io.IOUtils;  
public class FileUpload extends HttpServlet{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException {  
	          
	        request.setCharacterEncoding("UTF-8");  
	        response.setContentType("text/html;charset=utf-8");  
	        PrintWriter out=response.getWriter();  
	        //指定文件存放目录  
	        String storePath=getServletContext().getRealPath("WEB-INF/files");  
	        File file=new File(storePath);  
	        //如果目录不存在，需要创建  
	        if(!file.exists()){  
	            file.mkdirs();  
	        }  
	        //要检查是不是enctype=multipart/form-data提交过来的数据  
	        boolean isMultipart=ServletFileUpload.isMultipartContent(request);  
	        //如果不是，需要处理  
	        if(!isMultipart){  
	            out.write("请将enctype设置成multipart/form-data类型");  
	            response.setHeader("Refresh", "1;URL="+request.getContextPath());  
	            return;  
	        }  
	        //去生成一个文件上传的FileUpload对象  
	        DiskFileItemFactory factory=new DiskFileItemFactory();  
	        //设置一个临时目录  
	        //factory.setRepository(new File("E:/temp"));temp文件需要临时创建，我已经删掉了  
	          
	        ServletFileUpload upload=new ServletFileUpload(factory);  
	        //将用户的请求转化为List  
	        try {  
	            List<FileItem> items=upload.parseRequest(request);  
	            //遍历List中的数据  
	            for (FileItem item : items) {   
	                //如果部分文件没有上传  
	                if("".equals(item.getName())){  
	                    continue;  
	                }  
	                //判断是普通字段  
	                if(item.isFormField()){  
	                    String fieldName=item.getFieldName();  
	                    String fieldValue=item.getString("UTF-8");  
	                    System.out.println(fieldName+":"+fieldValue);  
	                }else{  
	                    //是上传的文件  
	                    //需要获取文件名,有可能是路径  
	                    String fileName=item.getName();  
	                    fileName=fileName.substring(fileName.lastIndexOf(File.separator)+1);  
	                    //文件名同名问题  
	                    fileName=UUID.randomUUID().toString()+"_"+fileName;  
	                    //解决一个文件夹下的文件过多的问题  
	                    //用时间来生成子目录  
	                    //String childPath=generateDir(storePath);  
	                    //用hashcode来生成子目录  
	                    String childPath=generateDir(storePath,fileName);  
	                    //获取上传文件的数据  
	                    InputStream is=item.getInputStream();  
	                    OutputStream os=new FileOutputStream(storePath+File.separator+childPath+File.separator+fileName);  
	                    IOUtils.copy(is, os);  
	                    os.close();  
	                    is.close();  
	                    //item.delete();//清空临时文件  
	                }  
	            }  
	            out.write("文件上传成功继续上传");  
	        } catch (FileUploadException e) {  
	            e.printStackTrace();  
	        }  
	    }  
	  
	  
	    private String generateDir(String storePath, String fileName) {  
	        int hashcode=fileName.hashCode();  
	        int dir1=hashcode &  0xf;  
	        int dir2=(hashcode & 0xf0)>>4;  
	        String childPath=dir1+File.separator+dir2;  
	        File file=new File(storePath,childPath);  
	        if(!file.exists()){  
	            file.mkdirs();  
	        }  
	        return childPath;  
	    }  
	  
	  
	    private String generateDir(String storePath) {  
	        DateFormat df=new SimpleDateFormat("yyyyMMddhhmmss");  
	        String childPath=df.format(new Date());  
	        File file=new File(storePath, childPath);  
	        if(!file.exists()){  
	            file.mkdirs();  
	        }  
	        return childPath;  
	    }  
	  
	  
	    public void doPost(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException {  
	        this.doGet(request, response);  
	  
	    }  
	  
	}  