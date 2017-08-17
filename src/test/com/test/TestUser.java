package com.test;

import com.entity.User;
import com.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.Map;


/**
 * Created by Administrator on 2017/4/27.
 */
public class TestUser {

	ApplicationContext context;
	UserService userService;

	@Before
	public void before() {
		context = new ClassPathXmlApplicationContext("spring/spring.xml");
		userService = context.getBean(UserService.class);
	}

	@Test
	public void test01() {
		User user = new User();
		user.setId(1);
		User u = user.selectById();
		System.out.println(u);
	}

	@Test
	public void test02() {
		User user = new User();
		user.setId(2);
		user.setAge(20);
		userService.updateById(user);
	}

	@Test
	public void test03() {
		System.out.println(8 % 9);
	}

	@Test
	public void test04() {
		Map<Integer, String> map = new HashMap<Integer, String>();
	}

}
