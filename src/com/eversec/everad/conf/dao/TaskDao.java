package com.eversec.everad.conf.dao;

import org.base4j.orm.hibernate.BaseDao;
import org.ever4j.utils.SpringBeanUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.eversec.everad.conf.entity.Task;

@Repository
public class TaskDao extends BaseDao<Task>{
	public void batchUpdate(String sql){
		JdbcTemplate jdbcTemplate = (JdbcTemplate) SpringBeanUtils.getDataSourceBean("jdbcTemplate");
		jdbcTemplate.execute(sql);
	}
}
