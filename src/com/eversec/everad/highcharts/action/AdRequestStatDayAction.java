package com.eversec.everad.highcharts.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseAction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eversec.everad.logs.entity.LcAll;
import com.eversec.everad.logs.service.LcAllService;



@Controller
@RequestMapping("/ssp/logs/adRequestStatDay")
public class AdRequestStatDayAction extends BaseAction{
	
	@Resource
	private LcAllService lcAllService;
	/**
	 * to 通过ajax把highCharts的数据异步传给页面
	 * return model
	 */
	@RequestMapping(value="/ajaxRequestChart")
	@ResponseBody
	public Model requestChart(Model model){
		List<Integer> yCharts = requestYChart();
		String[] xCharts = requestXChart();
		model.addAttribute("tname","PV");
		model.addAttribute("xCharts", xCharts);
		model.addAttribute("yCharts", yCharts);
		return model;
	}
	
	/**
	 * to 通过ajax把highCharts的数据异步传给页面
	 * return model
	 */
	@RequestMapping(value="/ajaxRequestChart2")
	@ResponseBody
	public Model requestChart2(Model model){
		Map<String, Object> yCharts = requestYChart2();
		String[] xCharts = requestXChart2();
		model.addAttribute("xCharts", xCharts);
		model.addAttribute("yCharts", yCharts);
		return model;
	}
	
	
	/**
	 * to 获取highCharts纵坐标数据，总请求数request
	 * @param type 
	 * @return String[]
	 */
	public List<Integer> requestYChart(){
		Date as1 = new Date(new Date().getTime()-24*60*60*1000*6);
		java.sql.Date dateStart = new java.sql.Date(as1.getTime());
		Date as2 = new Date(new Date().getTime());
		java.sql.Date dateEnd = new java.sql.Date(as2.getTime()); 
		
		List<Integer> requestList =  lcAllService.findBySql("select pv from ea_lc_all where counttime between ? and ? ORDER BY counttime ASC",dateStart,dateEnd);
//		String[] requests = new String[requestList.size()];
//		for(int i=0;i<requests.length;i++){
//			requests[i] = String.valueOf(requestList.get(i));
//		}
		//System.out.println(Arrays.toString(requests));
		return requestList;
	}
	
	/**
	 * to 获取highCharts纵坐标数据，总请求数request近两天的各种访问数据
	 * @param type 
	 * @return String[]
	 */
	public Map<String, Object> requestYChart2(){
		Date as1 = new Date(new Date().getTime()-24*60*60*1000*1);
		java.sql.Date dateStart = new java.sql.Date(as1.getTime());
		Date as2 = new Date(new Date().getTime());
		java.sql.Date dateEnd = new java.sql.Date(as2.getTime()); 
		
		List<LcAll> list = new ArrayList<LcAll>();
		List requestList =  lcAllService.findBySql("select rs,pv,uv,cli,clo from ea_lc_all where counttime between ? and ? ORDER BY counttime ASC",dateStart,dateEnd);
		
		String[] rs = new String[requestList.size()];
		String[] pv = new String[requestList.size()];
		String[] uv = new String[requestList.size()];
		String[] cli = new String[requestList.size()];
		String[] clo = new String[requestList.size()];
		
		for (int i = 0; i < requestList.size(); i++) {
		Object[] object = (Object[]) requestList.get(i);
			if(object.length>=4 && object != null){
				rs[i] = object[0].toString();
				pv[i] = object[1].toString();
				uv[i] = object[2].toString();
				cli[i] = object[3].toString();
				clo[i] = object[4].toString();
			}
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("rsname", "请求数");
		map.put("rs", rs);
		map.put("uvname", "单用户数");
		map.put("uv", uv);
		map.put("pvname", "展示数");
		map.put("pv", pv);
		map.put("cliname", "点击数");
		map.put("cli", cli);
		map.put("cloname", "关闭数");
		map.put("clo", clo);
		return map;
	}
	/**
	 *to 获取highCharts横坐标数据，最近七天的日期 
	 * @param length 
	 * @return StringBuffer
	 */
	public String[] requestXChart(){
//		Date date = new Date();
//		String dateEnd = new SimpleDateFormat("yyyy-MM-dd").format(date);
//		String[] dates = AdDateUtil.getDaysByNum(length, dateEnd);
//		StringBuffer bufferCount = new StringBuffer();
//		bufferCount.append("["); 
//		String pj = "";
//		for(String time : dates){
//			pj = "'"+time+"'";
//			bufferCount.append(pj+",");
//		}
//		bufferCount.append("]");
//		//System.out.println(bufferCount);
//		return bufferCount;
		Date as1 = new Date(new Date().getTime()-24*60*60*1000*6);
		java.sql.Date dateStart = new java.sql.Date(as1.getTime());
		Date as2 = new Date(new Date().getTime());
		java.sql.Date dateEnd = new java.sql.Date(as2.getTime()); 
		
		List<Date> requestList =  lcAllService.findBySql("select counttime from ea_lc_all where counttime between ? and ? ORDER BY counttime ASC",dateStart,dateEnd);
		String[] requests = new String[requestList.size()];
		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日(E)",Locale.CHINA);
		for(int i=0;i<requests.length;i++){
			requests[i] = sdf.format(requestList.get(i)).replace("星期", "周");
		}
		return requests;
	}
	
	/**
	 * 近两天的各种访问
	 * @return
	 */
	public String[] requestXChart2(){
		Date as1 = new Date(new Date().getTime()-24*60*60*1000*1);
		java.sql.Date dateStart = new java.sql.Date(as1.getTime());
		Date as2 = new Date(new Date().getTime());
		java.sql.Date dateEnd = new java.sql.Date(as2.getTime()); 
		
		List<Date> requestList =  lcAllService.findBySql("select counttime from ea_lc_all where counttime between ? and ? ORDER BY counttime ASC",dateStart,dateEnd);
		String[] requests = new String[requestList.size()];
		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日(E)",Locale.CHINA);
		for(int i=0;i<requestList.size();i++){
			requests[i] = sdf.format(requestList.get(i)).replace("星期", "周");
		}
		return requests;
	}
	
	
}
