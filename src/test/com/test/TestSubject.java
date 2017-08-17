package com.test;

import com.dao.SubjectDao;
import com.entity.Subject;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Administrator on 2017/4/27.
 */
public class TestSubject {

	ApplicationContext context;
//	SubjectService subjectService;
	SubjectDao subjectDao;

	@Before
	public void before() {
		context = new ClassPathXmlApplicationContext("spring/spring.xml");
		subjectDao = context.getBean(SubjectDao.class);
	}

	@Test
	public void test01() {
		Subject subject = subjectDao.selectById(1);
		System.out.println(subject);
	}

	@Test
	public void test02() {
		Subject subject = subjectDao.selectById(1);
		subject.setUserId(1);
		subjectDao.updateById(subject);
	}
}
