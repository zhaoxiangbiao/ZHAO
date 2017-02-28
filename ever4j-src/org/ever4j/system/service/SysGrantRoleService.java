package org.ever4j.system.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.system.entity.SysGrantRole;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysGrantRoleService extends BaseService<SysGrantRole> {
	@Override
	@Resource(name="sysGrantRoleDao")
	public void setBaseDao(BaseDao<SysGrantRole> baseDao){
		this.baseDao = baseDao;
	}
}
