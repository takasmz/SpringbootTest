package com.springbootexec.model;

public class homeworklist {
	public String studentno;
	public String name;
	public String[] times = new String[10];

	public static void clear(String[] times){
		for(int i=0;i<times.length;i++){
		   times[i] = "未完成";
		}
	}
	public homeworklist(String studentno, String name, String[] times){
		this.name =name;
		this.times = times;
		this.studentno =studentno;
	}
	
	public void setstudentno(String studentno){
		this.studentno =studentno;
	}
	public void setname(String name){
		this.name = name;
	}
	public void settimes(String[] times){
		this.times =times;
	}
	public String getstudentno(){
		return studentno;
	}
	public String getname(){
		return name;
	}
	public String[] gettimes(){
		return times;
	}
}
