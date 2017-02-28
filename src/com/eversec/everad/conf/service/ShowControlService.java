package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.ShowControl;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ShowControlService extends BaseService<ShowControl> {
	@Override
	@Resource(name="showControlDao")
	public void setBaseDao(BaseDao<ShowControl> baseDao){
		this.baseDao = baseDao;
	}
}
