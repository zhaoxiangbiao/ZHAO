package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.Conf;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ConfService extends BaseService<Conf> {
	@Override
	@Resource(name="confDao")
	public void setBaseDao(BaseDao<Conf> baseDao){
		this.baseDao = baseDao;
	}
}
