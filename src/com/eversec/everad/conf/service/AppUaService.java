package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.AppUa;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AppUaService extends BaseService<AppUa> {
	@Override
	@Resource(name="appUaDao")
	public void setBaseDao(BaseDao<AppUa> baseDao){
		this.baseDao = baseDao;
	}
}
