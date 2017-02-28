package org.ever4j.utils;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.log4j.Logger;

public class AdDateUtil {
	private static Logger logger = Logger.getLogger(AdDateUtil.class);

	static public String getNowStr(String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String now = sdf.format(new Date());
		return now;
	}
	
	//该方法不能获得格式为yyyy-MM-dd的短日期类型
	static public Date getFormatDate(String date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date d = new Date();
		try {
			d = sdf.parse(date);
		} catch (ParseException e) {
			logger.error(e);
		}
		return d;
	}

	static public String getDateStr(Date date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String d = sdf.format(date);
		return d;
	}

	static public String getPadZeroString(String s, int size) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < size - s.length(); i++) {
			sb.append("0");
		}
		sb.append(s);
		return sb.toString();
	}
	
	static public String getDayofYesterday(String format, String strdate) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		String[] dates = strdate.split("-");
		Calendar now = Calendar.getInstance();
		try {
			int year = 2010;
			int month = 9;
			int date = 9;
			if (dates.length == 3) {
				year = Integer.parseInt(dates[0]);
				month = Integer.parseInt(dates[1].substring(0)) - 1;
				date = Integer.parseInt(dates[2].substring(0));
				if (month == 0 && date == 1) {
					year = Integer.parseInt(getLstYear());
				}
				now.set(year, month, date);

			}
		} catch (Exception e) {

			logger.error("日期格式化错误：" + e);
		}
		now.roll(Calendar.DAY_OF_YEAR, -1);// 昨天
		return df.format(now.getTime());
	}
	/**
	 * 得到某月的天数
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	static public int getDayCountOfMonth(String year, String month) {
		Calendar cal = Calendar.getInstance();
		// 年
		cal.set(Calendar.YEAR, Integer.parseInt(year));
		// 月，因为Calendar里的月是从0开始，所以要-1
		cal.set(Calendar.MONTH, Integer.parseInt(month) - 1);
		return cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	} 
    static public String getYear() {
        Calendar now = Calendar.getInstance();    
        return String.valueOf(now.get(Calendar.YEAR));
    }
    static public String getLstYear() {
        Calendar now = Calendar.getInstance();    
        return String.valueOf(now.get(Calendar.YEAR)-1);
    }
    static public String getLastMonth() {
        Calendar calendar = Calendar.getInstance();   
        calendar.add(Calendar.MONTH, -1);    //得到前一个月
        int month = calendar.get(Calendar.MONTH)+1;
        if(month<10){
        	return String.valueOf("0"+month);
        }
        return String.valueOf(month);
    }
    static public String getNowMonth(){
    	Calendar calendar = Calendar.getInstance();
    	calendar.add(Calendar.MONTH,0); //得到当前月
    	int month = calendar.get(Calendar.MONTH)+1;
    	if(month<10){
    		return String.valueOf("0"+month);
    	}
    	return String.valueOf(month);
    }
    static public String getYearMonth(Date date, int n) {
    	Calendar calendar = Calendar.getInstance();  
    	calendar.setTime(date);
    	calendar.add(Calendar.MONTH, n);    
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
    	
    	return format.format(calendar.getTime());
    }
    
    /**
	 * 得到最近num天的全部日期
	 * 说明:	
	 * 	1.日期是从昨天开始算的.
	 *  2.如果num=2 , 日期是2008-03-14 ,则返回的结果为 2008-03-12、2008-03-13
	 * @param num
	 * @return
	 */
    public static String[] getDaysByNum(int num,String date){
		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日(E)",Locale.CHINA);
		String[] result = {} ;
		Calendar cal = Calendar.getInstance() ;
		cal.setTime(getDateFromString(date, "yyyy-MM-dd"));
		
		//最近一周
		result = new String[num];
		result[num-1]=sdf.format(new Date()).replace("星期", "周");
		for(int i=num-1;i>0;i--){
			cal.add(Calendar.DAY_OF_YEAR, -1);
			result[i-1] = sdf.format(new Date(cal.getTimeInMillis())).replace("星期", "周");
		}
		
		return result;
	}
	
	public static Date getDateFromString(String dateStr, String format) {

		if (dateStr == null || format == null) {
			try {
				throw new Exception("数据类型异常" + dateStr + "|" + format);
			} catch (Exception e) {
				logger.error("数据类型异常:" + e);
			}
		}

		SimpleDateFormat df = new SimpleDateFormat(format);
		Date date;
		try {
			date = df.parse(dateStr);
			return date;
		} catch (Exception ex) {
			logger.error(ex);
			return new Date();
		}
	}
	 /**
	 * 格式化日期
	 * 该方法用于得到格式为yyyy-MM-dd的sql.Date的短日期类型
	 * 
	 */
	public static Date parseDate(String value) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date temp = null;
		try {
			temp = format.parse(value);
		} catch (ParseException e) {
		} 
		return temp;
	}
	
	static public String getDaybeforeyesterday(String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);

		Calendar now = Calendar.getInstance();
		if (now.get(now.DAY_OF_MONTH) == 1 && now.get(now.MONTH) == 0) {
			return getLstYear() + "-12" + "-30";
		} else {
			now.roll(Calendar.DAY_OF_YEAR, -2);// 前天
			return df.format(now.getTime());
		}

	}
	
	static public String getYesterday(String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		Calendar now = Calendar.getInstance();
		if (now.get(now.DAY_OF_MONTH) == 1 && now.get(now.MONTH) == 0) {
			return getLstYear() + "-12" + "-31";
		} else {
			now.roll(Calendar.DAY_OF_YEAR, -1);// 前天
			return df.format(now.getTime());
		}
	}
	static public String getTomorrow(String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		
		Calendar now = Calendar.getInstance();
		
		if (now.get(now.DAY_OF_MONTH) == 31 && now.get(now.MONTH) == 11) {
			return String.valueOf(now.get(Calendar.YEAR) + 1) + "-01" + "-01";
		} else {
			now.roll(Calendar.DAY_OF_YEAR, 1);// 明天
			return df.format(now.getTime());
		}
	}
	//获得当前时间上一月的时间段字符串表示
	 public static String getTimeSpan(){
		 String month=getLastMonth();
		 String year="";
		 if(month.equals("12")){
			 year=getLstYear();
		 }else{
			 year=getYear();
		 }
		 int daycount=getDayCountOfMonth(year, month);
		 
		 return year+"/"+month+"/"+"1"+"～"+year+"/"+month+"/"+daycount;
	 }
	 /**
	  * 获取指定时间段之间的月份
	  * 比如：fromYear:2010,fromMonth:5,toYear: 2010 toMonth:9
	  * 返回的数据应该为2010年5月，2010年6月，7。。8。。2010年9月
	  * @param fromYear
	  * @param fromMonth
	  * @param toYear
	  * @param toMonth
	  * 2010年年12月，2011年3月
	  * 12,1,2,3
	  * @return
	  */
	public static String[] getMonthNum(String fromYear, String fromMonth,
			String toYear, String toMonth) {
		// TODO Auto-generated method stub
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM");
		String date1 = "";
		String date2 = "";
		int flag = 0;
		int monthNum = 0;
		boolean exist = false;
		String [] result = {};
		if(fromYear != null && !fromYear.equals("") && fromMonth != null && !"".equals(fromMonth)){
			date1 = fromYear + "-" + fromMonth;
		}else{
			date1 = getYear() + "-" + getNowMonth();
		}
		if(toYear != null && !"".equals(toYear) && toMonth != null && !"".equals(toMonth)){
			date2 = toYear + "-" + toMonth;
		}else{
			date2 = getYear() + "-" + getNowMonth();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(getDateFromString(date1 , "yyyy-MM"));
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(getDateFromString(date2 , "yyyy-MM"));
		boolean ischeck = false;
		if(cal.equals(cal2)){
			monthNum = 1;
		}
		if(cal2.before(cal)){
			/*Calendar tmp = Calendar.getInstance();
			tmp = cal;
			cal = cal2;
			cal2 = tmp;*/
			ischeck = true;
		}
		if(cal2.get(Calendar.DAY_OF_MONTH) < cal.get(Calendar.DAY_OF_MONTH)){
			flag = 1;
		}
		if(ischeck){
			monthNum = 0;
		}else{
			if(cal2.get(Calendar.YEAR) > cal.get(Calendar.YEAR)){ //跨年情况
				exist = true;
				monthNum = ((cal2.get(Calendar.YEAR) - cal.get(Calendar.YEAR)) * 12 + cal2.get(Calendar.MONTH) - flag ) - cal.get(Calendar.MONTH) + 1;
			}else{
				monthNum = cal2.get(Calendar.MONTH) - cal.get(Calendar.MONTH) + 1;
			}
		}
		result = new String [monthNum];
		if(exist){ //跨年情况
			int from = Integer.valueOf(fromMonth);
			int to = Integer.valueOf(toMonth);
			int yearNum = cal2.get(Calendar.YEAR) -  cal.get(Calendar.YEAR);
			if(yearNum > 1){ //跨多年
				for( int i = 0 ; i < (12 - from + 1) ; i++){
					result[i] = fromYear + "-" + (Integer.valueOf(fromMonth) + i);
				}
				int m = 1;
				for( m = 1 ; m < yearNum; m++){
					int k =1;
					for( int i = ((12 - from + 1) + 12*(m-1)) ; i < ((12 - from + 1) + 12*(m-1) + 12) ; i++){
						result[i] = (Integer.valueOf(fromYear)+m) + "-" + k;
						if(k<12){
							k++;
						}
					}
				}
				int j =to ;
				for(int i = ((12 - from + 1) + 12*(m - 2) + 12) ; i < monthNum ; i++){
					result[i] = toYear  + "-" + (to - j + 1 );
					j--;
				}
			}else{ //跨一年
				for( int i = 0 ; i < (12 - from + 1) ; i++){
					result[i] = fromYear + "-" + (Integer.valueOf(fromMonth) + i);
				}
				int j =to ;
				for( int i = (12 - from + 1) ; i < monthNum ; i++){
					result[i] = toYear  + "-" + (to - j + 1 );
					j--;
				}
			}
		}else{ //不跨年
			for( int i = 0 ; i < monthNum ; i++){
				result[i] = fromYear + "-" + (Integer.valueOf(fromMonth) + i) ;
			}
		}
		
		return result;
	} 

	

/**
 * 获取指定日期对应的星期
 * 日~六
 * 1~7
 * 日 月 火 水 木 金 土 
 * @param string
 * @return
 */
	public static String getWeek(String day) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
		
		cal.setTime(getDateFromString(day ,"yyyy-MM-dd"));
		int week = cal.get(Calendar.DAY_OF_WEEK);
		String str = "";
		switch(week){
		case 1: str = "日";
		break;
		case 2: str = "月";
		break;
		case 3:str = "火";
		break;
		case 4: str = "水";
		break;
		case 5: str = "木";
		break;
		case 6: str = "金";
		break;
		case 7: str ="土";
		default:
		}
		return str;
	}
	/**
	 * 得到某种类型的中间的所有日期.格式为"yyyy-MM-dd"
	 *  
	 * @param type
	 * @return
	 */
	public static String[] getDaysByRang(String beginDate,String endDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//得到两个日期间相差多少天
		int num = dateDiff(beginDate,endDate);
		if(num<0){
			//颠倒一下日期
			/*String tmp = beginDate;
			beginDate = endDate;
			endDate = tmp;
			num = 0-num;*/
			//如果开始日期大于结束日期不检索
			num = -1;
		}
		
		String[] result = {} ;
		Calendar cal = Calendar.getInstance() ;
		try {
			cal.setTime(sdf.parse(beginDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		num = num + 1;	//把开始和结束日期都包含进去
		
		result = new String[num];
		for(int i=0;i<num;i++){
			if(i>0)	cal.add(Calendar.DAY_OF_YEAR, 1);
			result[i] = sdf.format(new Date(cal.getTimeInMillis()));
		}
		
		return result;
	}
	/**
	 * 得到两个日期之间相差多少天 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	public static int dateDiff(String beginDate,String endDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(endDate);
		} catch (ParseException e) {
			date = new Date();
			e.printStackTrace();
		}
		
		
		long end 	= date.getTime();
		try {
			date = sdf.parse(beginDate);
		} catch (ParseException e) {
			date = new Date();
			e.printStackTrace();
		}
		long  begin 	= date.getTime();
		
		long day = (end-begin)/(1000*3600*24);		//除1000是把毫秒变成秒
		
		return Integer.parseInt(Long.toString(day));		
	}
	public static String getFirstDayOfMonth(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");         
		//获取当前月第一天：
		Calendar c = Calendar.getInstance();    
		c.add(Calendar.MONTH, 0);
		//设置为1号,当前日期既为本月第一天 
		c.set(Calendar.DAY_OF_MONTH,1);
		String firstday = format.format(c.getTime());
		 return firstday;
	}
	public static String getLastDayOfMonth(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");         
	   
		//获取当前月最后一天
		Calendar ca = Calendar.getInstance();    
		ca.set(Calendar.DAY_OF_MONTH, 
			ca.getActualMaximum(Calendar.DAY_OF_MONTH));  
		String lastday = format.format(ca.getTime());
		 return lastday;
	}
	
	public static void main(String [] args){
		String [] result = getDaysByRang("2011-03-21" ,"2011-04-05");
//		String [] result = getMonthNum("2010" , "12" ,"2011" ,"3");
/*//		String [] result = getMonthNum("2010" , "12" ,"2010" , "12");*/
		for(int i = 0 ; i < result.length ; i++){
			System.out.println("result:" + result[i]);
		}

		 

		 
		 
	}
}
