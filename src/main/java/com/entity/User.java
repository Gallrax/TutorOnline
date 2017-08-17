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
@TableName(value = "t_user", resultMap = "userResult")
public class User extends Model<User> {

	@TableId("id")
	private Integer id;
	private String username;
	private String password;
	private String name;
	private Integer age;
	private String sex;
	private String telphone;
	private Integer isTea;//0.学生,1.老师
	private String description;

	@TableField(exist = false)
	private List<Subject> subjects;

	public User() {
	}

	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", name='" + name + '\'' +
				", age=" + age +
				", sex='" + sex + '\'' +
				", telphone='" + telphone + '\'' +
				", isTea=" + isTea +
				", description='" + description + '\'' +
				", subjects=" + subjects +
				'}';
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public Integer getIsTea() {
		return isTea;
	}

	public void setIsTea(Integer isTea) {
		this.isTea = isTea;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Subject> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Subject> subjects) {
		this.subjects = subjects;
	}
}
