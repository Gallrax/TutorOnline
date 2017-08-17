package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.Course;
import com.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseService courseService;

	@ResponseBody
	@RequestMapping("/getCoursesByGrade")
	public List<Course> getCoursesByGrade(Integer gradeId) {
		List<Course> courses = courseService.selectList(new EntityWrapper<Course>().eq("gradeId", gradeId));
		return courses;
	}
}
