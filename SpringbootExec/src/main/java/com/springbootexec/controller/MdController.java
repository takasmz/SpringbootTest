package com.springbootexec.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springbootexec.Tools.MarkdownToHtml;
import com.springbootexec.dao.ICourseRepository;
import com.springbootexec.model.Course;
import com.springbootexec.model.CourseResource;
import com.springbootexec.model.User;

@Controller
public class MdController {
	/**
	 * 显示当前课程的待下载页面
	 * @return
	 * @throws IOException 
	 */
	/** 课程表操作对象*/
	@Autowired
	private ICourseRepository courseRepository;
	private MarkdownToHtml MarkdownToHtml = new MarkdownToHtml();
	public String intro=null;
	public String teachers =null;
	public String filename;
	public String filename1;
	
	@RequestMapping("/intro")
    public ModelAndView intro(String sn, HttpSession session,HttpServletRequest request) throws IOException {
		
		//读取课程信息 
		List<Course> courses = courseRepository.findAll();
		//查找编号为sn的课程，找不到则将第一个课程作为当前课程
		Course curCourse = null;
		for(Course c : courses) {
			if(sn != null && sn.equals(c.getSn())) {
				curCourse = c;
				break;
			}
		}
		if(curCourse == null)curCourse = courses.get(0);	
		
		filename = "src/main/resources/static/contents/"+curCourse.getCaption()+"/intro.md";
		//filename = "E:/Users/workspace/SpringbootExec/src/main/resources/static/contents/"+curCourse.getCaption()+"/intro.md";
		String html= null;
			try{
				html = MarkdownToHtml.get(filename);
				//System.out.println(curCourse.getCaption());
			}
			catch(Exception e){
				html = MarkdownToHtml.get("intro.md");
			}
		//download.ftl模板
		ModelAndView m = new ModelAndView("intro");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		m.getModel().put("html",html);
		//检查当前用户是否已经登陆 
		User user = (User) session.getAttribute("user");
		if(user != null)
			m.getModel().put("curUser", user);
		
		return m;
    }
   
	
	@RequestMapping("/editorshow")
	public ModelAndView editorshow(String sn, HttpSession session,HttpServletRequest request) throws IOException {
		String html = MarkdownToHtml.getmd(filename);
		ModelAndView mv = new ModelAndView("mdeditor");
		mv.getModel().put("htmlURL", html);
		return mv;
		
	}
	@RequestMapping("/editorshow1")
	public ModelAndView editorshow1(String sn, HttpSession session,HttpServletRequest request) throws IOException {
		String html = MarkdownToHtml.getmd(filename);
		ModelAndView mv = new ModelAndView("mdeditor2");
		mv.getModel().put("htmlURL", html);
		return mv;
		
	}
	
	@RequestMapping(value="/introedit",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView introedit(String sn, HttpSession session,HttpServletRequest request) throws IOException {
		//读取课程信息 
		List<Course> courses = courseRepository.findAll();
		//查找编号为sn的课程，找不到则将第一个课程作为当前课程
		Course curCourse = null;
		for(Course c : courses) {
			if(sn != null && sn.equals(c.getSn())) {
				curCourse = c;
				break;
			}
		}
		if(curCourse == null)curCourse = courses.get(0);		
		intro = request.getParameter("intro");
		clearFile(filename,intro);
		//download.ftl模板
		ModelAndView m = new ModelAndView("intro");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		//检查当前用户是否已经登陆 
		User user = (User) session.getAttribute("user");
		if(user != null)
			m.getModel().put("curUser", user);
		
		return new ModelAndView("forward:/intro");
    }
	
	
	@RequestMapping("/teachers")
    public ModelAndView teachers(String sn, HttpSession session,HttpServletRequest request) throws IOException {
		//读取课程信息 
		List<Course> courses = courseRepository.findAll();
		//查找编号为sn的课程，找不到则将第一个课程作为当前课程
		Course curCourse = null;
		for(Course c : courses) {
			if(sn != null && sn.equals(c.getSn())) {
				curCourse = c;
				break;
			}
		}
		if(curCourse == null)curCourse = courses.get(0);		
		filename = "E:/Users/workspace/SpringbootExec/src/main/resources/static/contents/"+curCourse.getCaption()+"/teachers.md";
		String html= null;
			try{
				html = MarkdownToHtml.get(filename);
				System.out.println(curCourse.getCaption());
			}
			catch(Exception e){
				html = MarkdownToHtml.get("teachers.md");
			}
		//download.ftl模板
		ModelAndView m = new ModelAndView("teachers");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		m.getModel().put("html",html);
		//检查当前用户是否已经登陆 
		User user = (User) session.getAttribute("user");
		if(user != null)
			m.getModel().put("curUser", user);
		
		return m;
    }
	
	@RequestMapping(value="/teachersedit",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView teachersedit(String sn, HttpSession session,HttpServletRequest request) throws IOException {
		//读取课程信息 
		List<Course> courses = courseRepository.findAll();
		//查找编号为sn的课程，找不到则将第一个课程作为当前课程
		Course curCourse = null;
		for(Course c : courses) {
			if(sn != null && sn.equals(c.getSn())) {
				curCourse = c;
				break;
			}
		}
		if(curCourse == null)curCourse = courses.get(0);		
		
		teachers = request.getParameter("teachers");
		clearFile(filename,teachers);
		//download.ftl模板
		ModelAndView m = new ModelAndView("teachers");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		//检查当前用户是否已经登陆 
		User user = (User) session.getAttribute("user");
		if(user != null)
			m.getModel().put("curUser", user);
		
		return new ModelAndView("forward:/teachers");
    }
	
	public static void clearFile(String fileName,String name) throws FileNotFoundException {
		File file=new File(fileName);
		BufferedWriter bw=null;
		try {
			if(!file.exists()){
				if(file.createNewFile())System.out.println("创建成功");
			}		
		bw=new BufferedWriter(new FileWriter(file));
		bw.write(name);
		bw.close();
		} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
    }
}
