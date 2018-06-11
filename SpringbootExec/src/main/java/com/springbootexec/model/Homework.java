package com.springbootexec.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="homework")
public class Homework {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	/** 学号 */
	@Column(name="studentno")
	private String studentno;
	/** 学生姓名 */
	@Column(name="studentname")
	private String studentname;
	/** 课程名称 */
	@Column(name="coursename")
	private String coursename;
	/** 序号 */
	@Column(name="xh")
	private int xh;
	/** 提交时间 */
	@Column(name="commitTime")
	private Date commitTime;
	
	public String getStudentno() {
		return studentno;
	}
	public void setStudentno(String studentno) {
		this.studentno = studentno;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public int getXh() {
		return xh;
	}
	public void setXh(int xh) {
		this.xh = xh;
	}
	public void setcommitTime(Date commitTime2) {
		// TODO Auto-generated method stub
		this.commitTime = commitTime2;
	}
	public Date getcommitTime() {
		// TODO Auto-generated method stub
		return commitTime;
		}
	public static List<String> getno(List<Homework> homework){
		List<String> a = new ArrayList<String>();
		for(int i = 0;i<homework.size();i++){
			a.add(homework.get(i).getStudentno());
		}
		return a;
	}
	
	public static List<String> getname(List<Homework> homework){
		List<String> b = new ArrayList<String>();
		for(int i = 0;i<homework.size();i++){
			b.add(homework.get(i).getStudentname());
		}
		return b;
	}
}
