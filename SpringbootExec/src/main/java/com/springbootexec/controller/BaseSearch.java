package com.springbootexec.controller;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.springbootexec.dao.IHomeworkRepository;
import com.springbootexec.model.Homework;
import com.springbootexec.model.SearchDto;

import org.junit.Test;
import org.springframework.data.jpa.domain.Specification;

public class BaseSearch<T> implements Specification<T>{
	
	public static final String GRATE_EQUAL = "ge"; //大于等于
    public static final String GRATE_THEN = "gt"; //大于
    public static final String LESS_EQUAL = "le"; //小于等于
    public static final String LESS_THEN = "lt"; //小于
    public static final String LIKE_BEGIN = "likeb"; // like '%?'
    public static final String LIKE_END = "likee"; //like '?%'
    public static final String LIKE = "like"; //like '%?%'
    public static final String LIKE_BEGIN_END = "likebe"; //like '%?%'
    public static final String NOT_LIKE_BEGIN = "nlikeb"; //not like '%?'
    public static final String NOT_LIKE_END = "nlikee"; //not like '?%'
    public static final String NOT_LIKE = "nlike"; //not like '%?%'
    public static final String NOT_LIKE_BEGIN_END = "nlikebe"; // not like '%?%'
    public static final String EQUAL = "eq"; //equal =
    public static final String NOT_EQUAL = "neq"; // not equal   !=
    public static final String IS_NULL = "isnull"; //is null

    private SearchDto criteria;
    public BaseSearch(SearchDto criteria) {
        this.criteria = criteria;
    }
    @Override
    public Predicate toPredicate
            (Root<T> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
        String opt = criteria.getoperation();
        String key = criteria.getkey();
        String value = criteria.getvalue().toString();
        if (opt.equalsIgnoreCase(GRATE_EQUAL)) { //大于等于
            return builder.greaterThanOrEqualTo(
                    root.<String> get(key), value);
        } else if(opt.equalsIgnoreCase(GRATE_THEN)) { //大于
            return builder.greaterThan(root.<String> get(key), value);
        } else if(opt.equalsIgnoreCase(LESS_EQUAL)) { //小于等于
            return builder.lessThanOrEqualTo(root.<String>get(key), value);
        } else if(opt.equalsIgnoreCase(LESS_THEN)) { //小于
            return builder.lessThan(root.<String>get(key), value);
        } else if(opt.equalsIgnoreCase(LIKE_BEGIN)) { // like '%?'
            return builder.like(root.<String>get(key), "%"+value);
        } else if(opt.equalsIgnoreCase(LIKE_END)) { // like '?%'
            return builder.like(root.<String>get(key), value+"%");
        } else if(opt.equalsIgnoreCase(LIKE) || opt.equalsIgnoreCase(LIKE_BEGIN_END)) { //like '%?%'
            return builder.like(root.<String>get(key), "%"+value+"%");
        } else if(opt.equalsIgnoreCase(NOT_LIKE_BEGIN)) { // not like '%?'
            return builder.notLike(root.<String>get(key), "%"+value);
        } else if(opt.equalsIgnoreCase(NOT_LIKE_END)) { // not like '?%'
            return builder.notLike(root.<String> get(key), value + "%");
        } else if(opt.equalsIgnoreCase(NOT_LIKE) || opt.equalsIgnoreCase(NOT_LIKE_BEGIN_END)) { //not like '%?%'
            return builder.notLike(root.<String> get(key), "%"+value+"%");
        } else if(opt.equalsIgnoreCase(EQUAL)) { //equal
            return builder.equal(root.get(key), value);
        } else if(opt.equalsIgnoreCase(NOT_EQUAL)) { //not equal
            return builder.notEqual(root.get(key), value);
        } else if(opt.equalsIgnoreCase(IS_NULL)) { // is null
            return builder.isNull(root.get(key));
        }
        return null;
    }
    private void print(List<Homework> list) {
        for(Homework u : list) {
            System.out.println(u.getXh()+"==="+u.getStudentname());
        }
    }
    IHomeworkRepository h;
    @Test
    public void test1() {
        List<Homework> list = h.findAll(new BaseSearch<Homework>(new SearchDto("studentname","eq", "国服")));
        print(list);
    }
	
}
