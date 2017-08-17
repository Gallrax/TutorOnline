package com.test;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.dao.CourseDao;
import com.entity.Course;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2017/4/27.
 */
public class TestCourse {

	ApplicationContext context;
	CourseDao courseDao;

	@Before
	public void before() {
		context = new ClassPathXmlApplicationContext("spring/spring.xml");
		courseDao = context.getBean(CourseDao.class);
	}

	@Test
	public void test01() {
		Course course = courseDao.selectById(2);
		System.out.println(course);
	}

	@Test
	public void test02() {
		List<Course> courses = courseDao.selectList(new EntityWrapper<Course>().eq("gradeId", 1));
		for (Course course : courses) {
			System.out.println(course);
		}
	}

	@Test
	public void test03() {
		List<Course> courses = courseDao.selectList(new EntityWrapper<Course>());
		for (Course course : courses) {
			System.out.println(course);
		}
	}
}
