package com.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/4/27.
 */
@TableName(value = "t_grade", resultMap = "gradeResult")
public class Grade extends Model<Grade> {

	@TableId("id")
	private Integer id;
	private String name;
	@TableField(exist = false)
	private List<Course> courses;

	public Grade() {
	}

	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Grade{" +
				"id=" + id +
				", name='" + name + '\'' +
				", courses=" + courses +
				'}';
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
}
