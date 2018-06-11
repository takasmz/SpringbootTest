package com.springbootexec.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbootexec.dao.ICourseRepository;
import com.springbootexec.dao.ICourseResourceRepository;
import com.springbootexec.dao.IUserRepository;
import com.springbootexec.model.Course;
import com.springbootexec.model.CourseConfiguration;
import com.springbootexec.model.CourseResource;
import com.springbootexec.model.User;

/**
 * 初始化控制器
 * 
 * @author admin
 *
 */
@Controller
public class InitController {
	/** 日志对象，用于调试过程记录信息  */
	private static Logger logger = LoggerFactory.getLogger(InitController.class);
	
	
	/** 用户表操作对象*/
	@Autowired
	private IUserRepository userRepository;
	
	/** 课程表操作对象*/
	@Autowired
	private ICourseRepository courseRepository;
	
	/** 课程资源表操作对象*/
	@Autowired
	private ICourseResourceRepository courseResourceRepository;
	
	/** 缺省的管理员账号和口令，在数据库中管理员账号丢失的话，用这个数据初始化 */
	public final static String AdminAccount = "admin";
	public final static String AdminPassword = "admin";
	
	/**
	 * 如果数据库存在，但是其中的表中没有数据，则尝试插入初始数据
	 * @return
	 */
	@RequestMapping("/init")
    @ResponseBody
	public String init() {		
		//先看看数据库User表里面是否已经有admin用户了
		User admin = userRepository.findByAccount(AdminAccount);
		if(admin == null) {//User表中没有管理员
			admin = new User();
			admin.setAccount(AdminAccount);
			admin.setPassword(AdminPassword);
			admin.setNickname("Admin");			
			userRepository.save(admin);			
		}
		
		long count = courseRepository.count();
		if(count<=0) {//课程表是空的
			
			//读取courses.xml，里面存有缺省课程信息和缺省课程资源信息
			CourseConfiguration courseConfig = null;
			try {
				courseConfig = CourseConfiguration.Load();
			} catch (Exception e) {				
				e.printStackTrace();
				logger.error("读取课程缺省配置失败:"+e.getMessage());
				return "初始化课程失败："+e.getMessage(); //错误信息返回到客户端
			}
			
			if(courseConfig == null || courseConfig.courses==null || courseConfig.courses.size()<=0)
				return "没有需要初始化的课程记录";
			
			//检查每个课程记录在数据库表中是否已经存在了，不存在则创建
			for(Course course : courseConfig.courses) {
				//先看数据库中是否已经有了
				Course courseInDB = courseRepository.findByCaption(course.getCaption());
				if(courseInDB != null)continue;
				//没有则插入到数据库表中
				courseRepository.saveAndFlush(course);
				
				//将课程资源插入到数据库中
				for(CourseResource cr : course.getResources()) {
					cr.setCourseCaption(course.getCaption());
					courseResourceRepository.saveAndFlush(cr);
				}
			}
			
			
		}
		
		return "初始化完成";
	}
}
