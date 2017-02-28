package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.Domain;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DomainService extends BaseService<Domain> {
	@Override
	@Resource(name="domainDao")
	public void setBaseDao(BaseDao<Domain> baseDao){
		this.baseDao = baseDao;
	}
}
