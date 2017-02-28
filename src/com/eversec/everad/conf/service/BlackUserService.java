package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.BlackUser;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BlackUserService extends BaseService<BlackUser> {
	@Override
	@Resource(name="blackUserDao")
	public void setBaseDao(BaseDao<BlackUser> baseDao){
		this.baseDao = baseDao;
	}
}
