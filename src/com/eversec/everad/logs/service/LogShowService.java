package com.eversec.everad.logs.service;

import javax.annotation.Resource;

import com.eversec.everad.logs.entity.LogShow;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LogShowService extends BaseService<LogShow> {
	@Override
	@Resource(name="logShowDao")
	public void setBaseDao(BaseDao<LogShow> baseDao){
		this.baseDao = baseDao;
	}
}
