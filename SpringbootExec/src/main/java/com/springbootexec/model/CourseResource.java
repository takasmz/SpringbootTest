/**
 * 
 */
package com.springbootexec.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;

/**
 * @author admin
 *
 */
@Entity
@Table(name="COURSE_RESOURCE")
public class CourseResource {
	/** ID */
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	/** 序号  */
	@Column(name="xh")
	private int xh;
	/** 标题 */
	@Column(name="title")
	private String title;
	/** 详细描述 */
	@Column(name="description")	
	private String description;
	/** 课件文件名 */
	@Column(name="pptFilename")
	private String pptFilename;
	/** 教案文件名 */
	@Column(name="planFilename")
	private String planFilename;
	/** 教学视频文件名 */
	@Column(name="videoFilename")
	private String videoFilename;
	
	/** 所属课程名称 */
	@Column(name="courseCaption")
	private String courseCaption;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@XmlAttribute
	public int getXh() {
		return xh;
	}
	public void setXh(int xh) {
		this.xh = xh;
	}
	
	@XmlAttribute
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@XmlAttribute
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@XmlAttribute(name="pptfile")
	public String getPptFilename() {
		return pptFilename;
	}
	public void setPptFilename(String pptFilename) {
		this.pptFilename = pptFilename;
	}
	
	@XmlAttribute(name="planfile")
	public String getPlanFilename() {
		return planFilename;
	}
	public void setPlanFilename(String planFilename) {
		this.planFilename = planFilename;
	}
	
	@XmlAttribute(name="videofile")
	public String getVideoFilename() {
		return videoFilename;
	}
	public void setVideoFilename(String videoFilename) {
		this.videoFilename = videoFilename;
	}
	public String getCourseCaption() {
		return courseCaption;
	}
	public void setCourseCaption(String courseCaption) {
		this.courseCaption = courseCaption;
	}
}
