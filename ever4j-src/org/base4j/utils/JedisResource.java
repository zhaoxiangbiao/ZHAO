package org.base4j.utils;

import java.io.IOException;

import org.apache.commons.lang.StringUtils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.Pipeline;


public class JedisResource {

	private static final int MAX_WAITTIME = 5000;

	private   JedisPool POOL = null;

	private  Integer maxTotal;

	private  String host;

	private  Integer port;
	
	private  String authKey;

	public synchronized  void init(){
		if(POOL!=null){
			return;
		}
		JedisPoolConfig config = new JedisPoolConfig();
		// 控制一个pool可分配多少个jedis实例，通过pool.getResource()来获取；
		// 如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
		config.setMaxTotal(maxTotal==null?100:maxTotal);
		// 控制一个pool最多有多少个状态为idle(空闲的)的jedis实例。
		config.setMaxIdle(maxTotal==null?100:maxTotal);
		config.setMinIdle(-1);
		// 表示当borrow(引入)一个jedis实例时，最大的等待时间，如果超过等待时间，则直接抛出JedisConnectionException；
		config.setMaxWaitMillis(5000);
		config.setMinEvictableIdleTimeMillis(-1);
		config.setSoftMinEvictableIdleTimeMillis(-1);
		// 在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
		config.setTestOnBorrow(false);
		config.setTestOnReturn(false);
		config.setTestWhileIdle(false);
		config.setTimeBetweenEvictionRunsMillis(60*1000*10);
		config.setNumTestsPerEvictionRun(100);
		config.setLifo(false);
		if(StringUtils.isNotBlank(this.authKey)){
			POOL = new JedisPool(config, host, port,MAX_WAITTIME,authKey);
		}else{
			POOL = new JedisPool(config, host, port,MAX_WAITTIME);
		}
		
		System.out.println("redis pool inited ...."+host+":"+port);

	}
	
	public  Jedis getJedis(){
		Jedis s = POOL.getResource();
        return s;
	}
	
	
	
	public static void main(String[] args) throws IOException, InterruptedException {
		JedisResource jr = new JedisResource();
		jr.setMaxTotal(10);
		jr.setHost("192.168.200.221");
		jr.setPort(6379);
		jr.setAuthKey("eversec123098");
		jr.init();
		Jedis jedis = jr.getJedis();
		long a = System.currentTimeMillis();
		for (int j = 0; j < 100; j++) {
			
			Pipeline pl = jedis.pipelined();
			for (int i = 0; i < 100000; i++) {
				pl.incr("xxx");
				pl.incr("xxx");
				pl.incr("xxx");
				pl.sadd("users", j+"1390001"+i);
//			pl.clear();
//			pl.close();
//			Thread.sleep(10000);
			}
			pl.sync();
			System.out.println(j);
		}
		long b = System.currentTimeMillis();
		System.out.println(b-a);
	}

	public void setHost(String host) {
		this.host = host;
	}

	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public void setMaxTotal(Integer maxTotal) {
		this.maxTotal = maxTotal;
	}

	public void setPort(Integer port) {
		this.port = port;
	}
	
}
