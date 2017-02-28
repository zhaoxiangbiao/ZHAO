package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.Template;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TemplateService extends BaseService<Template> {
	@Override
	@Resource(name="templateDao")
	public void setBaseDao(BaseDao<Template> baseDao){
		this.baseDao = baseDao;
	}
}
