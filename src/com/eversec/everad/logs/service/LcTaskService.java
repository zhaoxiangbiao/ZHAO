package com.eversec.everad.logs.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import redis.clients.jedis.Response;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPipeline;
import redis.clients.jedis.ShardedJedisPool;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.utils.SpringBeanUtils;
import org.ever4j.utils.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eversec.everad.conf.entity.Task;
import com.eversec.everad.logs.entity.LcTask;

@Service
@Transactional
public class LcTaskService extends BaseService<LcTask> {
	public static final Logger logger = LoggerFactory.getLogger(LcAllService.class);

	@Override
	@Resource(name = "lcTaskDao")
	public void setBaseDao(BaseDao<LcTask> baseDao) {
		this.baseDao = baseDao;
	}

	/**
	 * 从redis 中取出数据放入mysql数据库中
	 * 
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public boolean saveTaskResultByDate(String date) {
		ShardedJedis resource = null;
		try {
			ShardedJedisPool shardedJedisPool = (ShardedJedisPool) SpringBeanUtils.getRedisBean("shardedJedisPool");
			resource = shardedJedisPool.getResource();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			date = Utils.stringToDate(date);
			Map<String, String> pvMap = resource.hgetAll("H_" + date + "_PV");
			Map<String, String> cliMap = resource.hgetAll("H_" + date + "_CLI");
			Map<String, String> cloMap = resource.hgetAll("H_" + date + "_CLO");
			Map<String, String> rsMap = resource.hgetAll("H_" + date + "_RS");
			// 获取所有的任务ID数组
			String[] taskIdSet = Utils.convert2Array(pvMap.keySet());
			// com.eversec.everad.conf.entity.Task
			Map<String, Long> uvMap = pfcountMap(resource.pipelined(), "S_" + date + "_", taskIdSet);
			baseDao.executeBySql("delete from  ea_lc_task where counttime=?", date);
			for (int i = 0; i < taskIdSet.length; i++) {
				LcTask lctask = new LcTask();
				Task task = new Task();
				task.setId(Long.parseLong(taskIdSet[i]));

				lctask.setCounttime(sdf.parse(date));

				lctask.setTask(task);
				String cliValue = cliMap.get(taskIdSet[i].toString()) == null ? "0"
						: cliMap.get(taskIdSet[i].toString());
				String cloValue = cloMap.get(taskIdSet[i].toString()) == null ? "0"
						: cloMap.get(taskIdSet[i].toString());
				String pvValue = pvMap.get(taskIdSet[i].toString()) == null ? "0" : pvMap.get(taskIdSet[i].toString());
				String rsValue = rsMap.get(taskIdSet[i].toString()) == null ? "0" : rsMap.get(taskIdSet[i].toString());
				Long uvValue = uvMap.get(taskIdSet[i].toString()) == null ? 0 : uvMap.get(taskIdSet[i].toString());
				lctask.setCli(Long.parseLong(cliValue));
				lctask.setClo(Long.parseLong(cloValue));
				lctask.setPv(Long.parseLong(pvValue));
				lctask.setRs(Long.parseLong(rsValue));
				lctask.setUv(uvValue);
				baseDao.save(lctask);
			}
			return true;
		} catch (ParseException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (resource != null) {
				resource.close();
			}

		}

	}

	/**
	 * 获取uv数量
	 * 
	 * @param pl
	 * @param i
	 * @param uvKey
	 * @param keys
	 * @return
	 */
	@Transactional(readOnly = true)
	private Map<String, Long> pfcountMap(ShardedJedisPipeline pl, String uvKey, String[] keys) {
		List<Response<Long>> response = new ArrayList<Response<Long>>();
		for (int j = 0; j < keys.length; j++) {
			response.add(pl.scard(uvKey + keys[j]));
		}
		pl.sync();
		Map<String, Long> map = new HashMap<String, Long>();
		for (int j = 0; j < response.size(); j++) {
			map.put(keys[j], response.get(j).get());
		}
		return map;
	}

}
