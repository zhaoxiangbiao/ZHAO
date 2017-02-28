package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.DetectUser;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DetectUserService extends BaseService<DetectUser> {
	@Override
	@Resource(name="detectUserDao")
	public void setBaseDao(BaseDao<DetectUser> baseDao){
		this.baseDao = baseDao;
	}
}
