package org.ever4j.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ever4j.system.entity.SysUser;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler) throws Exception { 
		SysUser user = (SysUser) request.getSession().getAttribute("curUser");
		//未登录
        if (null == user && !request.getRequestURI().startsWith("/everad/task")) {
        	//如果是ajax请求响应头会有，x-requested-with  
        	if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){ 
        		System.out.println("未登录...退出..ajax");
        		//在响应头设置session状态  
	            response.setHeader("sessionstatus", "timeout");
	        }else{
	        	System.out.println("未登录...退出..page");
	        	response.sendRedirect(request.getContextPath()+"/");
	        }  
        	return false;
        }
        return super.preHandle(request, response, handler);
	}
}