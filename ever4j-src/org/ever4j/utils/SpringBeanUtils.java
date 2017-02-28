package org.ever4j.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class SpringBeanUtils {

	/**
	 * 根据bean的类型获取相应类型的对象，没有使用泛型，获得结果后，需要强制转换为相应的类型
	 * 
	 * @param clazz
	 *            bean的类型，没有使用泛型
	 * @return Object类型的对象
	 */
	public static Object getDataSourceBean(String beanName) {
		ApplicationContext wac = new FileSystemXmlApplicationContext("classpath:applicationContext.xml");
		Object bean = wac.getBean(beanName);
		return bean;
	}

	/**
	 * 根据bean的名称获取相应类型的对象，使用泛型，获得结果后，不需要强制转换为相应的类型
	 * 
	 * @param clazz
	 *            bean的类型，使用泛型
	 * @return T类型的对象
	 */
	public static Object getMvcBean(String beanName) {
		ApplicationContext wac = new FileSystemXmlApplicationContext("classpath:springmvc-servlet");
		Object bean = wac.getBean(beanName);
		return bean;
	}

	public static Object getRedisBean(String beanName) {
		ApplicationContext wac = new ClassPathXmlApplicationContext("classpath:spring-redis.xml");
		Object bean = wac.getBean(beanName);
		return bean;
	}

}
