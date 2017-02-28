package com.eversec.everad.conf.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eversec.everad.conf.dao.TerminalDao;
import com.eversec.everad.conf.entity.Terminals;

@Service
@Transactional
public class TerminalsService extends BaseService<Terminals> {
	@Override
	@Resource(name="terminalsDao")
	public void setBaseDao(BaseDao<Terminals> baseDao){
		this.baseDao = baseDao;
	}
	@Resource
	private TerminalDao terminalDao;

	public HashMap<String, String> listPhoneNumbersDetail(String terminal_name) {
		
		HashMap<String,String> listPhoneNumbersDetailMap = new HashMap<String,String>();
		String sql = "select phone_number,weight from ea_terminal where terminal_name = ?";
		@SuppressWarnings("unchecked")
		List<Object[]> phoneNumbersDetail = terminalDao.findBySql(sql, terminal_name);
		if(phoneNumbersDetail != null){
			for (Object[] object : phoneNumbersDetail) {
				if(object.length == 2){
					listPhoneNumbersDetailMap.put(object[0].toString(), object[1].toString());
				}
			}
		}
		
		return  listPhoneNumbersDetailMap;
	}
}
