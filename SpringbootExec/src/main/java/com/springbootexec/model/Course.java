package com.springbootexec.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;

@Entity
@Table(name="COURSE")
public class Course {
	/** 选课编号 */
	@Id
	private String sn;
	/** 名称 */
	@Column(name="caption")
	private String caption;
	/** 存储路径 */
	@Column(name="path")
	private String path;
	
	/** 存储路径 */
	@Column(name="teacherAccount")
	private String teacherAccount;
	
	/**
	 * 课程资源，指ppt，教案，视频
	 */
	@Transient //数据库里面没有这个字段,创建表的时候应忽略
	private List<CourseResource> resources = new ArrayList<CourseResource>();
	
	@XmlAttribute  //因字段是private的，XML注解应加在get方法上
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	@XmlElement
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	@XmlElement
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@XmlElement
	public String getTeacherAccount() {
		return teacherAccount;
	}
	public void setTeacherAccount(String teacherAccount) {
		this.teacherAccount = teacherAccount;
	}
	
	@XmlElementWrapper(name="downloads")
	@XmlElement(name="item")		
	public List<CourseResource> getResources() {
		return resources;
	}
	
	public void setResources(List<CourseResource> resources) {
		this.resources = resources;
	}
}
