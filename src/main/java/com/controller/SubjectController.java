package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.entity.Subject;
import com.entity.User;
import com.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
@Controller
@RequestMapping("/subject")
public class SubjectController {

	@Autowired
	private SubjectService subjectService;

	@ResponseBody
	@RequestMapping("/getSubjectById")
	public Subject getSubjectById(Integer id) {
		Subject subject = subjectService.selectById(id);
		return subject;
	}

	@ResponseBody
	@RequestMapping("/getPage")
	public Integer getPage(String field, String value) {
		int i = subjectService.selectCount(new EntityWrapper<Subject>().eq(field, value));
		int count = (i % 3) == 0 ? (i / 3) : (i / 3) + 1;
		if(count == 0) count = 1;
		return count;
	}

	@ResponseBody
	@RequestMapping("/getSubjects")
	public List<Subject> getSubjects(Integer index) {
		List<Subject> subjects = subjectService.selectPage(new Page<Subject>(index, 3)).getRecords();
		return subjects;
	}

	@ResponseBody
	@RequestMapping("/getSubjectsByCourse")
	public List<Subject> getSubjectsByCourse(Integer id, Integer index) {
		List<Subject> subjects = subjectService.selectPage(new Page<Subject>(index, 3), new EntityWrapper<Subject>().eq("courseId", id)).getRecords();
		return subjects;
	}


	@ResponseBody
	@RequestMapping("/getSubjectsByTeaId")
	public List<Subject> getSubjectsByTeaId(Integer teaId, Integer index) {
		List<Subject> subjects = subjectService.selectPage(new Page<Subject>(index, 3), new EntityWrapper<Subject>().eq("teaId", teaId)).getRecords();
		return subjects;
	}

	@ResponseBody
	@RequestMapping("/getSubjectsByUserId")
	public List<Subject> getSubjectsByUserId(Integer userId, Integer index) {
		List<Subject> subjects = subjectService.selectPage(new Page<Subject>(index, 3), new EntityWrapper<Subject>().eq("userId", userId)).getRecords();
		return subjects;
	}

	@ResponseBody
	@RequestMapping("/updateUserId")
	public String updateUserId(Integer id, Integer userId) {
		Subject subject = subjectService.selectById(id);
		if(subject.getUserId() != null) return "false";
		subject.setUserId(userId);
		subjectService.updateById(subject);
		return "true";
	}

	@ResponseBody
	@RequestMapping("/judgeUpdate")
	public String judgeUpdate(Integer id) {
		User user = subjectService.selectById(id).getUser();
		if (user != null) {
			return "false";
		}else{
			return "true";
		}
	}

	@RequestMapping("/updateSubject")
	public String updateSubkect(Subject subject, String bTime, String eTime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			subject.setBeginTime(sdf.parse(bTime));
			subject.setEndTime(sdf.parse(eTime));
		} catch (Exception e) {
			e.printStackTrace();
		}
		subjectService.updateById(subject);
		return "index";
	}

	@RequestMapping("/saveSubject")
	public String saveSubject(Subject subject, String bTime, String eTime){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			subject.setBeginTime(sdf.parse(bTime));
			subject.setEndTime(sdf.parse(eTime));
		} catch (Exception e) {
			e.printStackTrace();
		}
		subjectService.insert(subject);
		return "index";
	}

	@ResponseBody
	@RequestMapping("/deleteSubject")
	public String deleteSubject(Integer id) {
		User user = subjectService.selectById(id).getUser();
		if(user != null){
			return "false";
		}else{
			subjectService.deleteById(id.toString());
			return "true";
		}
	}
}
