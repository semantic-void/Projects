package com.springmvc.boot.amplicomm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springmvc.boot.amplicomm.model.User;


public interface UserRepository extends JpaRepository<User, Integer>{

	@Query("from User where username= :username and password= :password")
	User find(@Param("username") String username, @Param("password") String password);
	
}
