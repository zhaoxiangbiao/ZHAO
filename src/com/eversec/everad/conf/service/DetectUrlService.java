package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.DetectUrl;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DetectUrlService extends BaseService<DetectUrl> {
	@Override
	@Resource(name="detectUrlDao")
	public void setBaseDao(BaseDao<DetectUrl> baseDao){
		this.baseDao = baseDao;
	}
}
