package com.springbootexec.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.springbootexec.model.Homework;

@Repository
public interface IHomeworkRepository extends JpaRepository<Homework, Integer>, JpaSpecificationExecutor<Homework>{
	
	@Query("select hr FROM Homework hr where hr.coursename=?1")
	List<Homework> findByCourseCaption(String courseCaption);

	@Query("select hr FROM Homework hr where hr.coursename=?1 and hr.xh=?2")
	Homework findByCourseCaptionAndXh(String caption, int xh);
	
	@Modifying
	@Transactional	
	@Query("delete from Homework hr where hr.coursename=?1 and hr.xh=?2")
	void deleteBycourseCaptionAndXh(String caption, int xh);
}
