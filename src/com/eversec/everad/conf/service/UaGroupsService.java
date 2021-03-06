package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.UaGroups;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UaGroupsService extends BaseService<UaGroups> {
	@Override
	@Resource(name="uaGroupsDao")
	public void setBaseDao(BaseDao<UaGroups> baseDao){
		this.baseDao = baseDao;
	}
}
