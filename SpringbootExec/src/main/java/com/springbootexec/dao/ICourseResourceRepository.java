package com.springbootexec.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


import com.springbootexec.model.CourseResource;

public interface ICourseResourceRepository extends JpaRepository<CourseResource, Integer>{
	
	@Query("select cr FROM CourseResource cr where cr.courseCaption=?1")
	List<CourseResource> findByCourseCaption(String courseCaption);

	@Query("select cr FROM CourseResource cr where cr.courseCaption=?1 and cr.xh=?2")
	CourseResource findByCourseCaptionAndXh(String caption, int xh);
	
	@Modifying
	@Transactional	
	@Query("delete from CourseResource cr where cr.courseCaption=?1 and cr.xh=?2")
	void deleteBycourseCaptionAndXh(String caption, int xh);
	
    @Query("select cr FROM CourseResource cr where cr.courseCaption=?1")
    Page<CourseResource> findByCourseCaptionpage(String courseCaption,Pageable pageable);
}
