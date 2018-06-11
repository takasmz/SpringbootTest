package com.springbootexec.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.springbootexec.model.Course;

@Repository
public interface ICourseRepository  extends JpaRepository<Course, String>{
	
	@Query("select c FROM Course c WHERE c.caption=?1")
	Course findByCaption(String caption); 
	
	@Query("select c FROM Course c WHERE c.teacherAccount=?1")
	List<Course> findByTeacherAccount(String teacherAccount);

	@Query("select c FROM Course c WHERE c.sn=?1")
	Course findBySn(String sn);
}
