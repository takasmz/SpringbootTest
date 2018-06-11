package com.springbootexec.model;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.util.ResourceUtils;


/**
 * 课程缺省配置信息
 * 这不是一个POJO类，而是用于读取course.xml文件的；当InitController的init方法执行的时候，从这里读取配置并初始化数据库
 * @author admin
 *
 */
@XmlRootElement(name="configuration")
public class CourseConfiguration {
	/**
	 * 课程集合
	 */	
	@XmlElementWrapper(name="items")
	@XmlElement(name="item")
	public List<Course> courses = new ArrayList<Course>();
	
	/**
	 * 读取courses.xml文件,注意其中取得File的方式，使用了Spring的ResourceUtils
	 * @return
	 * @throws Exception
	 */
	public static CourseConfiguration Load() throws Exception{
		File file = ResourceUtils.getFile("classpath:courses.xml");
        JAXBContext jaxbContext = JAXBContext.newInstance(CourseConfiguration.class);  
        Unmarshaller jaxbMarshaller = jaxbContext.createUnmarshaller();  
        return (CourseConfiguration) jaxbMarshaller.unmarshal(file); 
	}
}
