package com.eversec.everad.conf.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.eversec.everad.conf.dao.UserLabelDao;
import com.eversec.everad.conf.entity.Labels;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LabelsService extends BaseService<Labels> {
	@Override
	@Resource(name="labelsDao")
	public void setBaseDao(BaseDao<Labels> baseDao){
		this.baseDao = baseDao;
	}
	@Resource(name = "userLabelDao")
	private  UserLabelDao userLabelDao;

	public HashMap<String, String> listPhoneNumDetail(Labels labels) {
		// TODO Auto-generated method stub
		String label = labels.getLabel();
		HashMap<String,String> listPhoneNumDetailMap = new HashMap<String,String>();
		String sql = "select phone_number,weight from ea_user_label where label = ?";
		List<Object[]> phoneNumDetails = userLabelDao.findBySql(sql, label);
		if(phoneNumDetails != null){
			for (Object[] object : phoneNumDetails) {
				if(object.length == 2){
					listPhoneNumDetailMap.put(object[0].toString(), object[1].toString());
				}
			}
		}
		
		return  listPhoneNumDetailMap;
	}
}
