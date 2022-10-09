package com.springmvc.boot.amplicomm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springmvc.boot.amplicomm.model.Addresses;
import com.springmvc.boot.amplicomm.model.User;

public interface AddressesRepository extends JpaRepository<Addresses, Integer> {

	@Query("from Addresses where uid = :uid and address= :address")
	List<Addresses> find(@Param("uid") Integer uid, @Param("address") String address);

//	@Query("from addresses where uid = ?1 and address= ?2")
	List<Addresses> findByUid(Integer uid);

	@Query("select address from Addresses where uid = :uid")
	List<String> addressesByUid(@Param("uid") Integer uid);

}
