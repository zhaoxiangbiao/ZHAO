package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.AppBlacklist;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AppBlacklistService extends BaseService<AppBlacklist> {
	@Override
	@Resource(name="appBlacklistDao")
	public void setBaseDao(BaseDao<AppBlacklist> baseDao){
		this.baseDao = baseDao;
	}
}
