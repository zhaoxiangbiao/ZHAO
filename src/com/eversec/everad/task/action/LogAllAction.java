package com.eversec.everad.task.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eversec.everad.logs.service.LcAllService;

@Controller
@RequestMapping("/everad/task")
public class LogAllAction {

	@Resource
	private LcAllService lcAllService;

	@RequestMapping(value = "/stat")
	@ResponseBody
	public String saveDbByRedis(HttpServletRequest request, String date) {
		boolean isFlag = lcAllService.saveAllLogByDate(date);
		if (!isFlag) {
			return "error";
		}
		return "success";
	}
	

	@RequestMapping(value = "/statToday")
	@ResponseBody
	public String saveDbByRedisToday(HttpServletRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date=sdf.format(new Date());
		boolean isFlag = lcAllService.saveAllLogByDate(date);
		if (!isFlag) {
			return "error";
		}
		return "success";
	}

}
