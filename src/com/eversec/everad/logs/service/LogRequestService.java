package com.eversec.everad.logs.service;

import javax.annotation.Resource;

import com.eversec.everad.logs.entity.LogRequest;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LogRequestService extends BaseService<LogRequest> {
	@Override
	@Resource(name="logRequestDao")
	public void setBaseDao(BaseDao<LogRequest> baseDao){
		this.baseDao = baseDao;
	}
}
