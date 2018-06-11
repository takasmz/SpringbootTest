package com.springbootexec.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.springbootexec.model.User;

/**
 * 用户JPA数据访问对象
 * @author admin
 *
 */
@Repository
public interface IUserRepository extends JpaRepository<User, String>{
	/**
	 * 查找指定账户的用户 
	 * @param account
	 * @return
	 */
	User findByAccount(String account);
	
	/**
	 * 查找指定账户和密码的用户 
	 * @param account
	 * @param password
	 * @return
	 */
	@Query("select ur FROM User ur WHERE ur.account=?1 and ur.password=?2")
	User findByAccountAndPassword(String account,String password);
	
	@Query("select ur FROM User ur WHERE ur.id = (select max(id) FROM User ur)")
	User findById(); 
}
