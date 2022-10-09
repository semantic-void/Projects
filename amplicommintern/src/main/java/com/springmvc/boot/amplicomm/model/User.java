package com.springmvc.boot.amplicomm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * @author Lenovo
 *
 */
@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "uid", updatable = false, nullable = false)
	private Integer uid;
	private String username;
	private String name;
	private String password;

	public User() {
	}

	public User(String name, String username, String password) {
		this.username = username;
		this.name = name;
		this.password = password;
	}
//
//	public User(String name, String password) {
//		this.name = name;
//		this.password = password;
//	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setUserName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", name=" + name + ", password=" + password + "]";
	}

}
