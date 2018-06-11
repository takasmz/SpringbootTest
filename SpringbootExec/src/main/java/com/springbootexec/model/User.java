package com.springbootexec.model;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * 用户信息
 * @author admin
 *
 */
@Entity
@Table(name="USER")
public class User {

	/**
	 * 用户ID
	 */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    /** 账号 */
    @Column(name="account")
    private String account;
    /** 密码  */
    @Column(name="password")
    private String password;
    
    /** 用户昵称 */
    @Column(name="nickname")
    private String nickname;
    /** 用户身份 */
    @Column(name="status")
    private String status;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getStatus() {
        return status;
    }
}
