package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.BlackUserSeg;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BlackUserSegService extends BaseService<BlackUserSeg> {
	@Override
	@Resource(name="blackUserSegDao")
	public void setBaseDao(BaseDao<BlackUserSeg> baseDao){
		this.baseDao = baseDao;
	}
}
