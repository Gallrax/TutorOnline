package com.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/4/27.
 */
@TableName(value = "t_course", resultMap = "courseResult")
public class Course extends Model<Course> {

	@TableId("id")
	private String id;
	private String name;
	private Integer gradeId;
	@TableField(exist = false)
	private Grade grade;

	public Course() {
	}

	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Course{" +
				"id='" + id + '\'' +
				", name='" + name + '\'' +
				", gradeId=" + gradeId +
				", grade=" + grade +
				'}';
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getGradeId() {
		return gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}
}
