package com.test;

import com.entity.StudyDoc;
import com.service.StudyDocService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Administrator on 2017/4/28.
 */
public class TestStudyDoc {

	ApplicationContext context;
	StudyDocService studyDocService;

	@Before
	public void before() {
		context = new ClassPathXmlApplicationContext("spring/spring.xml");
		studyDocService = context.getBean(StudyDocService.class);
	}

	@Test
	public void test01() {
		StudyDoc studyDoc = new StudyDoc();
		studyDoc.setId(1);
		StudyDoc sd = studyDoc.selectById();
		System.out.println(sd);
	}
}
