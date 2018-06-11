package com.springbootexec.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.springbootexec.dao.ICourseRepository;
import com.springbootexec.dao.ICourseResourceRepository;
import com.springbootexec.dao.IHomeworkRepository;
import com.springbootexec.model.Course;
import com.springbootexec.model.Homework;
import com.springbootexec.model.SearchDto;
import com.springbootexec.model.User;
import com.springbootexec.model.homeworklist;

/**
 * 资源控制器，用于显示待下载资源列表
 * @author admin
 *
 */
@Controller
public class HomeworkController {
	
	/** 课程表操作对象*/
	@Autowired
	private ICourseRepository courseRepository;
	
	/** 课程资源表操作对象*/
	@Autowired
	private ICourseResourceRepository courseResourceRepository;
	
	/** 作业表操作对象*/
	@Autowired
	private IHomeworkRepository HomeworkRepository;
	public int time = 9;
	/**
	 * 显示当前课程的待下载页面
	 * @return
	 */
	@RequestMapping("/homework")
    public ModelAndView homework(String sn, HttpSession session) {
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
		//取得当前课程的课程资源信息
		List<Homework> homework = HomeworkRepository.findByCourseCaption(curCourse.getCaption());
		List<homeworklist> homeworkstats = new ArrayList<homeworklist>();
		List<Integer> b = new ArrayList<Integer>();
		List<String> no = Homework.getno(homework);
		List<String> no1 = new ArrayList<String>();
		List<String> name1 = new ArrayList<String>();
		String name;String studentno;String[][] times = new String[100][10];
		//homeworkstats.add(new homeworklist(homework.get(0).getStudentno(),homework.get(0).getStudentname(),a.get(0)));
		homeworklist e;
		int indexno,index,j=0;
		for(int i=0;i<homework.size();i++){			
			name =homework.get(i).getStudentname();
			studentno=homework.get(i).getStudentno();
			indexno = no.indexOf(studentno);
			if(indexno != i){
				index = b.indexOf(indexno);
				times[index][homework.get(i).getXh()-1] =  "已完成";
				
			}else{
				homeworklist.clear(times[j]);
				times[j][homework.get(i).getXh()-1] =  "已完成";
				b.add(j,indexno);
				no1.add(j, studentno);
				name1.add(j, name);
				j++;
			}		
		}
		for(int i=0;i<j;i++){		
			homeworklist e1 = new homeworklist(no1.get(i),name1.get(i),times[i]);
			homeworkstats.add(e1);
		}
		

		
		//download.ftl模板
		ModelAndView m = new ModelAndView("homework");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		m.getModel().put("homeworkstats", homeworkstats);
		
		//检查当前用户是否已经登陆 
		User user = (User) session.getAttribute("user");
		if(user != null)
			m.getModel().put("curUser", user);
		
		return m;
    }
	@RequestMapping("/homework2")
    public ModelAndView homework2(String sn, HttpSession session) {
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
		//取得当前课程的课程资源信息
		List<Homework> homework = HomeworkRepository.findAll(new BaseSearch<Homework>(new SearchDto("studentname","eq", "国服")));
		//download.ftl模板
		ModelAndView m = new ModelAndView("homework2");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		m.getModel().put("homework", homework);
		
		//检查当前用户是否已经登陆 
		User user = (User) session.getAttribute("user");
		if(user != null)
			m.getModel().put("curUser", user);
		
		return m;
    }
	/**
	 * 资源编辑
	 * @param sn 课程编号
	 * @param session
	 * @return
	 */
	@RequestMapping("/resedit2")
    public ModelAndView resedit(String sn, HttpSession session) {
		//检查当前用户是否已经登陆 
		User user = (User) session.getAttribute("user");
		if(user == null) {//如果没有登陆，则跳转到登陆页面去
			return new ModelAndView("forward:/login");
		}
		
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
		//取得当前课程的课程资源信息
		List<Homework> homework = HomeworkRepository.findByCourseCaption(curCourse.getCaption());
		//download.ftl模板
		ModelAndView m = new ModelAndView("resedit2");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		m.getModel().put("homework", homework);
		m.getModel().put("curUser", user);
		
		return m;
	}
	
	@RequestMapping(value="/submit",method=RequestMethod.POST)
	public ModelAndView resupdate(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws ParseException {
		//取得所有参数
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
		String courseno = request.getParameter("courseno");		
		String xh = request.getParameter("xh");
		Date commitTime = sdf.parse(request.getParameter("commitTime"));
		String studentname = request.getParameter("studentname");
		String studentno = request.getParameter("studentno");
		String restype = request.getParameter("restype");		
		List<MultipartFile> files =((MultipartHttpServletRequest)request).getFiles("file");
		
		//检查课程编号是否有效
		Course curCourse = courseRepository.getOne(courseno);
		if(curCourse == null) {
			ModelAndView eMV = new ModelAndView("error");
			eMV.getModel().put("errorTitle", "更新失败");
			eMV.getModel().put("errorContent", "课程编号无效:"+courseno);
			return eMV;
		}
		//保存文件
		String filename = "";
		try {
			filename = saveFile(file,curCourse.getPath(),xh);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ModelAndView eMV = new ModelAndView("error");
			eMV.getModel().put("errorTitle", "更新失败");
			eMV.getModel().put("errorContent", "保存文件失败:"+e.getMessage());
			return eMV;
		}
		
		//读取原有资源记录
		Homework hr = HomeworkRepository.findByCourseCaptionAndXh(curCourse.getCaption(),Integer.parseInt(xh));
		if(hr == null) {//如果没有，就创建一个新资源
			hr = new Homework();
		}
		//将客户端传过来的属性给cr赋值
		hr.setXh(Integer.parseInt(xh));
		hr.setcommitTime(commitTime);
		hr.setStudentname(studentname);
		hr.setCoursename(curCourse.getCaption());
		hr.setStudentno(studentno);
		
		
		//保存
		HomeworkRepository.saveAndFlush(hr);
		
		//重定向到资源编辑页面
		return new ModelAndView("forward:/resedit2");
			
	}
	
	@Value("${course.resource.path}") 
	private String homeworkPath;
	
	private String saveFile(MultipartFile file,String path,String xh) throws Exception{
		if (file.isEmpty()) {
			return "";
		}
		
		String orginFilename = file.getOriginalFilename();
		int p = orginFilename.lastIndexOf(".");
		String filename = xh + orginFilename.substring(p,orginFilename.length());		
		File f = new File(homeworkPath+path+"/homework/"+filename);
		if(!f.exists())
			f.createNewFile();
		    
		BufferedOutputStream out = new BufferedOutputStream(
                new FileOutputStream(f));
        out.write(file.getBytes());
        out.flush();
        out.close();
		
        return filename;
	}
	
	//筛选
	@RequestMapping(value="/shaixuan1",method=RequestMethod.POST)
	public ModelAndView shaixuan(String sn, HttpSession session,HttpServletRequest request) throws ParseException {
	    //检查当前用户是否已经登陆 
		User user = (User) session.getAttribute("user");
		if(user == null) {//如果没有登陆，则跳转到登陆页面去
			return new ModelAndView("forward:/login");
		}
				
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
		//取得所有参数	
		String xh = request.getParameter("xh");
		String studentname = request.getParameter("studentname");
		
		List<Homework> homework = HomeworkRepository.findAll(new BaseSearch<Homework>(new SearchDto("studentname","eq", studentname)));;
		
		ModelAndView m = new ModelAndView("homework2");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		m.getModel().put("homework", homework);
		m.getModel().put("curUser", user);
		
		return m;
			
	}
	 
}
