package com.eversec.everad.logs.service;

import javax.annotation.Resource;

import com.eversec.everad.logs.entity.LogClose;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LogCloseService extends BaseService<LogClose> {
	@Override
	@Resource(name="logCloseDao")
	public void setBaseDao(BaseDao<LogClose> baseDao){
		this.baseDao = baseDao;
	}
}
