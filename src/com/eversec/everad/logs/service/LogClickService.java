package com.eversec.everad.logs.service;

import javax.annotation.Resource;

import com.eversec.everad.logs.entity.LogClick;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LogClickService extends BaseService<LogClick> {
	@Override
	@Resource(name="logClickDao")
	public void setBaseDao(BaseDao<LogClick> baseDao){
		this.baseDao = baseDao;
	}
}
