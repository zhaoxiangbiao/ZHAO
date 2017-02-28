package com.eversec.everad.conf.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eversec.everad.conf.dao.LabelsDao;
import com.eversec.everad.conf.dao.UserDao;
import com.eversec.everad.conf.entity.Labels;
import com.eversec.everad.conf.entity.User;
import com.eversec.everad.conf.entity.UserLabel;

@Service
@Transactional
public class UserLabelService extends BaseService<UserLabel> {
	@Override
	@Resource(name = "userLabelDao")
	public void setBaseDao(BaseDao<UserLabel> baseDao) {
		this.baseDao = baseDao;
	}

	@Resource(name = "labelsDao")
	private LabelsDao labelsDao;
	
	@Resource(name = "userDao")
	private UserDao userDao;

	public LabelsDao getLabelsDao() {
		return labelsDao;
	}

	public void setLabelsDao(LabelsDao labelsDao) {
		this.labelsDao = labelsDao;
	}

	/*public void updateLabelsAndUserByLabel(UserLabel userLabel) {
		//更新标签库
		String labelTitle = userLabel.getLabel();
		String phoneNumber = userLabel.getPhone_number();
		String hql = "from Labels where label=?";
		Labels label = labelsDao.findHql(hql, labelTitle);
		if (label != null) {
			label.setUser_count(label.getUser_count() + 1);
			labelsDao.update(label);
		} else {
			label = new Labels();
			label.setLabel(labelTitle);
			label.setUser_count(Long.parseLong("1"));
			labelsDao.save(label);
		}
		//更新用户画像
		String hql2 = "from User where phone_number=?";
		User user = userDao.findHql(hql2, phoneNumber);
		if(user != null){
			user.setLabel_count(user.getLabel_count()+1);
			userDao.update(user);
		}else {
			user= new User();
			user.setPhone_number(phoneNumber);
			user.setLabel_count(Long.parseLong("1"));
			userDao.save(user);
		}
	}*/

}
