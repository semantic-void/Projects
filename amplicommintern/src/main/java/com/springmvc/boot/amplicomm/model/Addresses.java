package com.springmvc.boot.amplicomm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Addresses {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "aid", updatable = false, nullable = false)
	private Integer aid;
	private Integer uid;
	private String address;

	public Addresses() {
	}
	
	public Addresses(Integer aid, Integer uid, String address) {
		this.aid = aid;
		this.uid = uid;
		this.address = address;
	}
	
	public Addresses(Integer uid, String address) {
		this.uid = uid;
		this.address = address;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Addresses [aid=" + aid + ", uid=" + uid + ", address=" + address + "]";
	}

}
