package com.eversec.everad.conf.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eversec.everad.conf.dao.UserLabelDao;
import com.eversec.everad.conf.entity.User;

@Service
@Transactional
public class UserService extends BaseService<User> {
	@Override
	@Resource(name="userDao")
	public void setBaseDao(BaseDao<User> baseDao){
		this.baseDao = baseDao;
	}
	@Resource(name = "userLabelDao")
	private  UserLabelDao userLabelDao;
	
	public  HashMap<String,String> listLabelsDetail(User user) {
		// TODO Auto-generated method stub
		String phoneNumber = user.getPhone_number();
		
		HashMap<String,String> listLabelsDetailMap = new HashMap<String,String>();
		String sql = "select label,weight from ea_user_label where phone_number = ?";
		@SuppressWarnings("unchecked")
		List<Object[]> labelsDetail = userLabelDao.findBySql(sql, phoneNumber);
		if(labelsDetail != null){
			for (Object[] object : labelsDetail) {
				if(object.length == 2){
					listLabelsDetailMap.put(object[0].toString(), object[1].toString());
				}
			}
		}
		
		return  listLabelsDetailMap;
	}
}
