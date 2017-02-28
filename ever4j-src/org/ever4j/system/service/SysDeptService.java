package org.ever4j.system.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.system.entity.SysDept;
import org.ever4j.utils.Utils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysDeptService extends BaseService<SysDept> {
	@Override
	@Resource(name="sysDeptDao")
	public void setBaseDao(BaseDao<SysDept> baseDao){
		this.baseDao = baseDao;
	}
	
	
	/**
	 * 新增对象.
	 */
	@Override
	public void save(SysDept entity)
	{
		getBaseDao().save(entity);
		generateDeptNum(entity);
	}

	
	/**
	 * 生产自己的编号
	 * @param entity
	 */
	private void generateDeptNum(SysDept entity) {
		SysDept p = entity.getParentId();
		
		String sql = "select max(dept_num) from sys_dept as d where d.parent_id is null";
		if(p!=null){
			p = this.find(p.getId());
			sql = "select max(dept_num) from sys_dept as d where d.parent_id = "+p.getId();
		}
		String maxNum = (String) this.uniqueResult(sql);
		String num = (p==null?"":p.getDeptNum())+"001";
		if(maxNum!=null){
			String n = maxNum.substring(maxNum.length()-3);
			num = (p==null?"":p.getDeptNum())+""+Utils.fillNumLenth(3,Integer.parseInt(n)+1);
		}
		entity.setDeptNum(num);
	}


	/**
	 * 修改对象.
	 */
	@Override
	public void update(SysDept entity)
	{
		SysDept old =  this.find(entity.getId());
		SysDept oldP =  old.getParentId();
		SysDept newP = entity.getParentId();
		Long newPid = newP==null?null:newP.getId();
		Long oldPid = oldP==null?null:oldP.getId();
	    String oldNum = old.getDeptNum();
	    
	    this.getBaseDao().getSession().clear();
		if(oldPid == newPid){
			entity.setDeptNum(oldNum);
			getBaseDao().update(entity);
		}else{
			getBaseDao().update(entity);
			generateDeptNum(entity);
			updateDeptNums(entity,oldNum);
		}
	}


	/**
	 * 更新所有子孙编号
	 * @param entity
	 */
	private void updateDeptNums(SysDept entity,String oldNum) {
		String myNum = entity.getDeptNum();
		String sql = "update  sys_dept set dept_num = CONCAT('"+myNum+"', SUBSTR(dept_num,"+(oldNum.length()+1)+")) where id != ? and dept_num like '"+oldNum+"%'";
		this.executeBySql(sql, entity.getId());
	}
}
