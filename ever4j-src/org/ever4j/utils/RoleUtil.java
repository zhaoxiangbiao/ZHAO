package org.ever4j.utils;

import org.ever4j.system.entity.SysUser;

public class RoleUtil {

	public static boolean isAllGrant(SysUser user) {
		
		return (user!=null && user.getId()==1);
	}

}
