package com.springbootexec.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.springbootexec.Tools.MarkdownToHtml;
import com.springbootexec.dao.ICourseRepository;
import com.springbootexec.dao.ICourseResourceRepository;
import com.springbootexec.model.Course;
import com.springbootexec.model.CourseResource;
import com.springbootexec.model.User;

/**
 * 资源控制器，用于显示待下载资源列表
 * @author admin
 *
 */
@Controller
public class ResourceController {
	/** 课程表操作对象*/
	@Autowired
	private ICourseRepository courseRepository;
	
	/** 课程资源表操作对象*/
	@Autowired
	private ICourseResourceRepository courseResourceRepository;
	
	/**
	 * 显示当前课程的待下载页面
	 * @return
	 */
	@RequestMapping("/download")
    public ModelAndView download(String sn, HttpSession session) {
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
		List<CourseResource> courseResources = courseResourceRepository.findByCourseCaption(curCourse.getCaption());
		
		//download.ftl模板
		ModelAndView m = new ModelAndView("download");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		m.getModel().put("courseResources", courseResources);
		
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
	@RequestMapping("/resedit")
    public ModelAndView resedit(HttpServletRequest request,String sn, HttpSession session,
    		@RequestParam(value = "p", defaultValue = "1") Integer page) {
		int pagenumber; 
		if(page>0){
			pagenumber = page-1;
		}else{
			pagenumber = page;
		}
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
	   List<CourseResource> courseResources1 = courseResourceRepository.findByCourseCaption(curCourse.getCaption());
		int totalsize;
		if(courseResources1.size()%15 ==0){
			totalsize = courseResources1.size()/15;
		}else{
			totalsize = courseResources1.size()/15 + 1;
		}
		Sort sort = new Sort(Sort.Direction.ASC, "id");  
	    Pageable pageable = new PageRequest(pagenumber, 15, sort);
	    Page<CourseResource> pages=  courseResourceRepository.findByCourseCaptionpage(curCourse.getCaption(),pageable);  
	   // Iterator<CourseResource> it=pages.iterator();  
	    List<CourseResource> courseResources = pages.getContent();
		//download.ftl模板
		ModelAndView m = new ModelAndView("resedit");
		m.getModel().put("courses", courses);//模版需要的属性变量
		m.getModel().put("curCourse", curCourse);
		m.getModel().put("courseResources", courseResources);
		m.getModel().put("curUser", user);
		m.getModel().put("pagenumber", page);
		m.getModel().put("totalsize", totalsize);
		return m;
	}
	
	@RequestMapping("/resdelete")
    public ModelAndView resdelete(String sn, int resxh,HttpSession session) {
		//检查当前用户是否已经登陆 
		User user = (User) session.getAttribute("user");
		if(user == null) {//如果没有登陆，则跳转到登陆页面去
			return new ModelAndView("forward:/login");
		}
		
		//查找当前课程
		Course curCourse = courseRepository.findBySn(sn);
		if(curCourse == null) {
			ModelAndView eMV = new ModelAndView("error");
			eMV.getModel().put("errorTitle", "删除失败");
			eMV.getModel().put("errorContent", "当前课程编号不存在:"+sn);			
		}
		
		//删除特定课程名称和资源序号的资源项
		courseResourceRepository.deleteBycourseCaptionAndXh(curCourse.getCaption(),resxh);
		
		//重定向到资源编辑页面
		return new ModelAndView("forward:/resedit");
	}
	
	@RequestMapping(value="/resupdate",method=RequestMethod.POST)
	public ModelAndView resupdate(@RequestParam("file") MultipartFile file,HttpServletRequest request) {
		//取得所有参数
		String courseno = request.getParameter("courseno");		
		String xh = request.getParameter("xh");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
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
		CourseResource cr = courseResourceRepository.findByCourseCaptionAndXh(curCourse.getCaption(),Integer.parseInt(xh));
		if(cr == null) {//如果没有，就创建一个新资源
			cr = new CourseResource();
		}
		//将客户端传过来的属性给cr赋值
		cr.setXh(Integer.parseInt(xh));
		cr.setDescription(description);
		cr.setTitle(title);
		cr.setCourseCaption(curCourse.getCaption());
		
		if(restype!=null&&restype.equalsIgnoreCase("ppt"))
			cr.setPptFilename(filename);
		else if(restype!=null&&restype.equalsIgnoreCase("plan"))
			cr.setPlanFilename(filename);
		else if(restype!=null&&restype.equalsIgnoreCase("video"))
			cr.setVideoFilename(filename);
		else {
			ModelAndView eMV = new ModelAndView("error");
			eMV.getModel().put("errorTitle", "更新失败");
			eMV.getModel().put("errorContent", "资源类型无效:"+restype);
			return eMV;
		}
		//保存
		courseResourceRepository.saveAndFlush(cr);
		
		//重定向到资源编辑页面
		return new ModelAndView("forward:/resedit");
			
	}
	
	@Value("${course.resource.path}") 
	private String courseresourcePath;
	
	private String saveFile(MultipartFile file,String path,String xh) throws Exception{
		if (file.isEmpty()) {
			return "";
		}
		
		String orginFilename = file.getOriginalFilename();
		int p = orginFilename.lastIndexOf(".");
		String filename = xh + orginFilename.substring(p,orginFilename.length());		
		File f = new File(courseresourcePath+path+"/download/"+filename);
		if(!f.exists())
			f.createNewFile();
		
		BufferedOutputStream out = new BufferedOutputStream(
                new FileOutputStream(f));
        out.write(file.getBytes());
        out.flush();
        out.close();
		
        return filename;
	}
	
}
