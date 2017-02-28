package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.DomainBlacklist;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DomainBlacklistService extends BaseService<DomainBlacklist> {
	@Override
	@Resource(name="domainBlacklistDao")
	public void setBaseDao(BaseDao<DomainBlacklist> baseDao){
		this.baseDao = baseDao;
	}
}
