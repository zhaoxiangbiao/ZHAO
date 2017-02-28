package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.AppGroups;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AppGroupsService extends BaseService<AppGroups> {
	@Override
	@Resource(name="appGroupsDao")
	public void setBaseDao(BaseDao<AppGroups> baseDao){
		this.baseDao = baseDao;
	}
}
