package com.test;

import com.dao.GradeDao;
import com.entity.Grade;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Administrator on 2017/4/27.
 */
public class TestGrade {

	ApplicationContext context;
	GradeDao gradeDao;

	@Before
	public void before() {
		context = new ClassPathXmlApplicationContext("spring/spring.xml");
		gradeDao = context.getBean(GradeDao.class);
	}

	@Test
	public void test01() {
		Grade grade = gradeDao.selectById(1);
		System.out.println(grade);
	}
}
