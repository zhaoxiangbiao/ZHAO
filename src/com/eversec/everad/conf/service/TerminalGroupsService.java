package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import com.eversec.everad.conf.entity.TerminalGroups;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TerminalGroupsService extends BaseService<TerminalGroups> {
	@Override
	@Resource(name="terminalGroupsDao")
	public void setBaseDao(BaseDao<TerminalGroups> baseDao){
		this.baseDao = baseDao;
	}
}
