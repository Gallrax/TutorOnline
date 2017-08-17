package com.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2017/4/27.
 */
@TableName(value = "t_subject", resultMap = "subjectResult")
public class Subject extends Model<Subject> {

	@TableId("id")
	private String id;
	private String title;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date beginTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endTime;
	private String address;
	private String description;
	private double money;
	private Integer courseId;
	private Integer teaId;
	private Integer userId;
	private String picUrl;
	@TableField(exist = false)
	private User teacher;
	@TableField(exist = false)
	private User user;
	@TableField(exist = false)
	private Course course;

	public Subject() {
	}

	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Subject{" +
				"id='" + id + '\'' +
				", title='" + title + '\'' +
				", beginTime=" + beginTime +
				", endTime=" + endTime +
				", address='" + address + '\'' +
				", description='" + description + '\'' +
				", money=" + money +
				", courseId=" + courseId +
				", teaId=" + teaId +
				", userId=" + userId +
				", picUrl='" + picUrl + '\'' +
				", teacher=" + teacher +
				", user=" + user +
				", course=" + course +
				'}';
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getTeaId() {
		return teaId;
	}

	public void setTeaId(Integer teaId) {
		this.teaId = teaId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public User getTeacher() {
		return teacher;
	}

	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
}
