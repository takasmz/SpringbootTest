package com.springbootexec.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.springbootexec.model.CourseResource;

public interface CourseResourceDao  extends PagingAndSortingRepository<CourseResource, String>{

	@Query( value = "select cr FROM CourseResource cr where cr.courseCaption=?1" )  
    Page<CourseResource> CourseResourcePageData(Pageable page,String courseCaption);  
}
