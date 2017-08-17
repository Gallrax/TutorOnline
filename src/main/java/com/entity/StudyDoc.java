package com.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2017/4/28.
 */
@TableName(value = "t_studyDoc")
public class StudyDoc extends Model<StudyDoc> {

	@TableId
	private Integer id;
	private String title;
	private String content;
	private Date insertTime;

	public StudyDoc() {
	}

	@Override
	public String toString() {
		return "StudyDoc{" +
				"id=" + id +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", insertTime=" + insertTime +
				'}';
	}

	protected Serializable pkVal() {
		return this.id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
}
