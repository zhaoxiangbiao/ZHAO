package org.ever4j.system.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.system.entity.SysGrant;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.RoleUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysGrantService extends BaseService<SysGrant> {
	@Override
	@Resource(name="sysGrantDao")
	public void setBaseDao(BaseDao<SysGrant> baseDao){
		this.baseDao = baseDao;
	}

	public List<SysGrant> findByUser(SysUser user) {
		StringBuilder sql = null;
		if(RoleUtil.isAllGrant(user)){
			
			sql = new StringBuilder("SELECT m.id,  m.grant_name,m.grant_desc FROM sys_grant m  where 1=1 ");
		}else{
			sql = new StringBuilder("SELECT m.id,  m.grant_name,m.grant_desc FROM sys_grant m ,sys_grant_role mr where m.id=mr.grant_id and mr.role_id ="+user.getUserRole().getId().toString()+" ");
		}
		List<Object> objs = this.findBySql(sql.toString());
		List<SysGrant> menuLists = new ArrayList<SysGrant>();
		if(objs != null && objs.size() > 0){
			
			for (Object obj : objs) {
				if(obj != null){
					Object[] strs = (Object[])obj;
					BigInteger id = (BigInteger)strs[0];
					String menuName = (String)strs[1];
					String menuDesc = (String)strs[2];
					SysGrant curSysMenu = new SysGrant(id.longValue(), menuName, menuDesc);
					
					menuLists.add(curSysMenu);
				}
			}
		}
		return menuLists;
	}
}
