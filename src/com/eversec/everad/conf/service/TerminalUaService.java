package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.TerminalUa;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TerminalUaService extends BaseService<TerminalUa> {
	@Override
	@Resource(name="terminalUaDao")
	public void setBaseDao(BaseDao<TerminalUa> baseDao){
		this.baseDao = baseDao;
	}
}
