package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.DomainGruops;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DomainGruopsService extends BaseService<DomainGruops> {
	@Override
	@Resource(name="domainGruopsDao")
	public void setBaseDao(BaseDao<DomainGruops> baseDao){
		this.baseDao = baseDao;
	}
}
