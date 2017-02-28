package org.base4j.utils;

import java.io.IOException;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.ever4j.main.constant.Constant;

public class ConfigUtil {
	private static Logger logger = Logger.getLogger(ConfigUtil.class);
	/**
	 * 通知接口服务，重新加载广告配置
	 * @return
	 */
	public static String reloadConfig(){
		String updateIp = Constant.getSysConfig("sysbaseConfig_reload_ip");
		if(StringUtils.isBlank(updateIp)){
			updateIp = "127.0.0.1";
		} 
		
		logger.info("reload:"+updateIp);
		
		String[] nodes = updateIp.split(",");
//		String[] result = new String[nodes.length];
		String result = "";
		if(nodes.length>0){
			
			PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
	        cm.setMaxTotal(100);
	        CloseableHttpClient httpclient = HttpClients.custom()
	                .setConnectionManager(cm)
	                .build();
	        try {
				
			
	        RequestConfig defaultRequestConfig = RequestConfig.custom()
	                .setSocketTimeout(15000)
	                .setConnectTimeout(15000)
	                .setConnectionRequestTimeout(15000)
	                .build();
			
			GetThread[] threads = new GetThread[nodes.length];
            for (int i = 0; i < nodes.length; i++) {
                HttpGet httpget = new HttpGet("http://"+nodes[i]);
                httpget.setConfig(defaultRequestConfig);
                threads[i] = new GetThread(httpclient, httpget, i + 1);
            }

            // start the threads
            for (int j = 0; j<nodes.length; j++) {
                threads[j].start();
            }

            // join the threads
            for (int j = 0; j < nodes.length; j++) {
                try {
					threads[j].join();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
            }
            for (int i = 0; i < nodes.length; i++) {
				String re = threads[i].result;
				result += "【"+nodes[i]+"】"+re+"</br>";
			}
	        } catch (Exception e) {
	        	e.printStackTrace();
			}finally{
				try {
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}
	private static String reloadConfig4One(String updateIp) {
		
		try {
			String re = Request.Get("http://"+updateIp)
			.connectTimeout(30000)
			.socketTimeout(30000)
			.execute().returnContent().asString();
			if("success".equals(re))
			return "同步成功";
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "同步失败";
	}
	
	
	static class GetThread extends Thread {

        private final CloseableHttpClient httpClient;
        private final HttpContext context;
        private final HttpGet httpget;
        private final int id;
        
        public String result = "同步失败";

        public GetThread(CloseableHttpClient httpClient, HttpGet httpget, int id) {
            this.httpClient = httpClient;
            this.context = new BasicHttpContext();
            this.httpget = httpget;
            this.id = id;
        }

        /**
         * Executes the GetMethod and prints some status information.
         */
        @Override
        public void run() {
        	
            	try {
                    CloseableHttpResponse response = httpClient.execute(httpget, context);
                    try {
                        HttpEntity entity = response.getEntity();
                        if (entity != null) {
                            String re = EntityUtils.toString(entity);
                            if("success".equals(re)){
                            	result="同步成功";
                            }
                        }
                    } finally {
                        response.close();
                    }
                } catch (Exception e) {
                    System.out.println(id + " - error: " + e);
                }
        }

    }
}
