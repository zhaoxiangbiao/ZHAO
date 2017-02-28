package com.eversec.everad.logs.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSONObject;
import com.eversec.everad.logs.entity.LcAll;
import java.util.List;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.utils.SpringBeanUtils;
import org.ever4j.utils.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LcAllService extends BaseService<LcAll> {
	public static final Logger logger = LoggerFactory.getLogger(LcAllService.class);
	@Resource
	private LcTaskService lcTaskService;

	@Override
	@Resource(name = "lcAllDao")
	public void setBaseDao(BaseDao<LcAll> baseDao) {
		this.baseDao = baseDao;
	}

	/**
	 * 根据日期从redis中查找日志总数记录到mysql数据库中
	 * 
	 * @param date
	 */
	public boolean saveAllLogByDate(String date) {
		ShardedJedis resource = null;
		try {
			ShardedJedisPool shardedJedisPool = (ShardedJedisPool) SpringBeanUtils.getRedisBean("shardedJedisPool");
			resource = shardedJedisPool.getResource();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dates = Utils.stringToDate(date);
			LcAll all = baseDao.find("counttime", sdf.parse(date));
			all = getAllInfo(date, resource, sdf, dates, all);
			baseDao.update(all);
			lcTaskService.saveTaskResultByDate(date);
			return true;
		} catch (ParseException e) {
			e.printStackTrace();
			logger.error("失败");
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("失败");
			return false;
		} finally {
			if (resource != null)
				resource.close();

		}

	}

	@Transactional(readOnly = true)
	private LcAll getAllInfo(String date, ShardedJedis resource, SimpleDateFormat sdf, String dates, LcAll all)
			throws ParseException {
		if (all == null)
			all = new LcAll();
		all.setCounttime(sdf.parse(date));
		String cliValue = resource.hget("D_" + dates, "CLI") == null ? "0"
				: resource.hget("D_" + dates, "CLI").toString();
		String cloValue = resource.hget("D_" + dates, "CLO") == null ? "0"
				: resource.hget("D_" + dates, "CLO").toString();
		String pvValue = resource.hget("D_" + dates, "PV") == null ? "0" : resource.hget("D_" + dates, "PV").toString();
		String rsValue = resource.hget("H_" + dates, "RS") == null ? "0" : resource.hget("H_" + dates, "RS").toString();
		String uvValue = resource.scard("S_USERS_" + dates) == null ? "0"
				: resource.scard("S_USERS_" + dates).toString();
		all.setRs(Long.parseLong(rsValue));
		all.setCli(Long.parseLong(cliValue));
		all.setClo(Long.parseLong(cloValue));
		all.setPv(Long.parseLong(pvValue));
		all.setUv(Long.parseLong(uvValue));
		return all;
	}

	@Transactional(readOnly = true)
	public String getRqSum() {
		JSONObject jso = new JSONObject();
		ShardedJedisPool shardedJedisPool = (ShardedJedisPool) SpringBeanUtils.getRedisBean("shardedJedisPool");
		ShardedJedis resource = null;
		try {
			resource = shardedJedisPool.getResource();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dates = Utils.stringToDate(sdf.format(new Date()));
			List historyrq = baseDao.findBySql("select sum(rs) from ea_lc_all where counttime<?",
					sdf.format(new Date()));
			LcAll tasklog = getAllInfo(sdf.format(new Date()), resource, sdf, dates, null);
			long historyCount = Long.parseLong(historyrq.get(0).toString()) + tasklog.getRs();
			jso.put("requestCountHistoryAll", historyCount);
			jso.put("rsCountToday", tasklog.getRs());
			jso.put("showRate", tasklog.getPv());
			jso.put("clickRate", tasklog.getCli());
			jso.put("closeRate", tasklog.getClo());
			jso.put("uvSumToday", tasklog.getUv());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (resource != null) {
				resource.close();
			}
		}

		return jso.toJSONString();
	}

}
