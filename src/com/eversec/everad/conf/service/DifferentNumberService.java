package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.DifferentNumber;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DifferentNumberService extends BaseService<DifferentNumber> {
	@Override
	@Resource(name="differentNumberDao")
	public void setBaseDao(BaseDao<DifferentNumber> baseDao){
		this.baseDao = baseDao;
	}
}
