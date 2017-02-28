package org.ever4j.system.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.system.entity.SysKeyword;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysKeywordService extends BaseService<SysKeyword> {
	@Override
	@Resource(name="sysKeywordDao")
	public void setBaseDao(BaseDao<SysKeyword> baseDao){
		this.baseDao = baseDao;
	}
}
