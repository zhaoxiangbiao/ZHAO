package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.main.constant.Constant;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eversec.everad.conf.dao.TaskDao;
import com.eversec.everad.conf.entity.Task;

@Service
@Transactional
public class TaskService extends BaseService<Task> {
	@Override
	@Resource(name="taskDao")
	public void setBaseDao(BaseDao<Task> baseDao){
		this.baseDao = baseDao;
	}
	@Resource
	private TaskDao taskDao;
	//批量停止
	public void batchStop(String ids) {
		if( null != ids){
			String sql = "update ea_task set is_active = 0 where id in "+ "( "+ids+" )";
			taskDao.batchUpdate(sql);
		}
	}
	//批量启用
	public void batchStart(String ids) {
		if( null != ids){
			String sql = "update ea_task set is_active = 1 where id in "+ "( "+ids+" )";
			taskDao.batchUpdate(sql);
		}
	}
	//全部停止
	public int allStop() {
		// TODO Auto-generated method stub
		String sql = "update ea_task set is_active = ? ";
		int executeBySql = executeBySql(sql,0);
		return executeBySql;
	}
	//全部启用
	public int allStart() {
		String sql = "update ea_task set is_active = ? where is_del = 0";
		int executeBySql = executeBySql(sql,1);
		return executeBySql;
	}
}
