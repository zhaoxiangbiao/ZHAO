package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.UaBlacklist;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UaBlacklistService extends BaseService<UaBlacklist> {
	@Override
	@Resource(name="uaBlacklistDao")
	public void setBaseDao(BaseDao<UaBlacklist> baseDao){
		this.baseDao = baseDao;
	}
}
