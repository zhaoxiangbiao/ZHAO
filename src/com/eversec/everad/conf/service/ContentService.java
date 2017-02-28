package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.Content;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ContentService extends BaseService<Content> {
	@Override
	@Resource(name="contentDao")
	public void setBaseDao(BaseDao<Content> baseDao){
		this.baseDao = baseDao;
	}
}
