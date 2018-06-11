/**
 * 
 */
package com.springbootexec.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.springbootexec.dao.ICourseRepository;
import com.springbootexec.dao.IUserRepository;
import com.springbootexec.model.Course;
import com.springbootexec.model.User;

/**
 * @author admin
 *
 */
@Controller
public class AuthController {
	
	/** 日志对象，用于调试过程记录信息  */
	private static Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	
	/**
	 * 显示登陆界面
	 * @return
	 */
	@RequestMapping("/login")
    public String login() {	      
		return "login";
    }
	@RequestMapping("/logout")
    public String logout() {	      
		return "logout";
    }
	
	/** 登陆会话名 */
	public final static String SESSION_KEY = "user";
	
	/** 用户表操作对象*/
	@Autowired
	private IUserRepository userRepository;
	
	/** 课程表操作对象*/
	@Autowired
	private ICourseRepository courseRepository;
	
	/**
	 * 登陆验证
	 * @return 如果成功，返回index.html，否则返回error.html
	 */
	@RequestMapping(value="/loginverify",method=RequestMethod.POST)
	public ModelAndView loginverify(String account,String password, HttpSession session) {
		//输出调试信息
		logger.info("接收到登陆请求:账号="+account+",密码="+password);
		
		//查询数据库
		User user = userRepository.findByAccount(account);
		
		//验证通过，跳转到index
		if(user != null && password.equals(user.getPassword())) {
			session.setAttribute(SESSION_KEY, user);//将得到的user对象写入session中
			
			//读取课程信息 
			List<Course> courses = courseRepository.findAll();
			
			//建立模型,跳转到index
			ModelAndView m = new ModelAndView("index");
			m.getModel().put("courses", courses);//模版需要的属性变量
			m.getModel().put("curCourse", courses.get(0));
			m.getModel().put("curUser", user);
			return m;
		}
		
		//验证失败，准备跳转到error
		String errorPrompt = "";
		if(user == null)
			errorPrompt = "账号不存在:"+account;
		else
			errorPrompt = "密码错误 :"+account;
		
		ModelAndView eMV = new ModelAndView("error");
		eMV.getModel().put("errorTitle", "登陆失败");
		eMV.getModel().put("errorContent", errorPrompt);
		return eMV;
	}
	
	//注册
	@RequestMapping(value="/zhuce",method=RequestMethod.POST)
	public ModelAndView resupdate(HttpServletRequest request) throws ParseException {
		User userid = userRepository.findById();
		int id = userid.getId();
		String status = "1";
		//取得所有参数
		String nickname = request.getParameter("nickname");		
		String account = request.getParameter("account");
		String password = request.getParameter("password");

		
		//检查账号是否有效
		//User user = userRepository.getOne(account);
		//if(user == null) {
			//ModelAndView eMV = new ModelAndView("error");
			//eMV.getModel().put("errorTitle", "更新失败");
			//eMV.getModel().put("errorContent", "课程编号无效:"+courseno);
			//return eMV;
		//}
		
		//读取原有资源记录
		User hr = new  User();
		//将客户端传过来的属性给cr赋值
		hr.setNickname(nickname);
		hr.setPassword(password);
		hr.setAccount(account);
		hr.setId(id+1);
		hr.setStatus(status);
		System.out.println(1);
		//保存
		userRepository.saveAndFlush(hr);
		
		//重定向到资源编辑页面
		return new ModelAndView("forward:/login");
			
	}
}
